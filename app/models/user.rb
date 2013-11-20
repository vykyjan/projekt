# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  surname    :string(255)
#  email      :string(255)
#  person     :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base

  has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: { :message => "neni vyplneno" }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :name, presence: { :message => "neni vyplneno" }, length: { maximum: 20 }
  validates :person, presence: { :message => "neni vyplneno" }, :numericality => {:greater_than => 0 }
  validates :surname, presence: { :message => "neni vyplneno" }, length: { maximum: 20 }
  validates :password, presence: { :message => "neni vyplneno" }, length: { minimum: 6, :message => "prilis kratke"  }
  validates :password_confirmation, presence: { :message => "neni vyplneno" }

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
