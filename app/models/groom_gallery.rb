class GroomGallery < ActiveRecord::Base
 has_many :groom_pictures, :dependent => :destroy
 attr_accessible :name, :description, :token, :cover

def generate_token
  self.token = loop do
    random_token = SecureRandom.urlsafe_base64
    break random_token unless GroomGallery.where(token: random_token).exists?
  end
end

end