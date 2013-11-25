class BrideGallery < ActiveRecord::Base
  has_many :bride_pictures, :dependent => :destroy

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64
      break random_token unless GroomGallery.where(token: random_token).exists?
    end
  end

end
