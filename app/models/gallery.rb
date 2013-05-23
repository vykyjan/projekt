# == Schema Information
#
# Table name: galleries
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  cover       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  token       :string(255)
#

class Gallery < ActiveRecord::Base
  attr_accessible :cover, :description, :name, :token

  has_many :pictures, :dependent => :destroy

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64
      break random_token unless Gallery.where(token: random_token).exists?
    end
  end

end
