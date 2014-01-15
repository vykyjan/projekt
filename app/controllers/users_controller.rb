# coding: utf-8
class UsersController < ApplicationController
  before_filter :signed_in_user, only: [ :edit, :update]
  before_filter :is_an_admin?,   only: [:new, :edit, :update]
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private


  def user_params
    params.require(:user).permit(:name, :surname, :email, :person, :password, :password_confirmation, :admin)
  end

  def signed_in_user
    redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end


end
