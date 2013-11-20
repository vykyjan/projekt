# == Schema Information
#
# Table name: pictures
#
#  id            :integer          not null, primary key
#  description   :string(255)
#  image         :string(255)
#  gallery_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  gallery_token :string(255)
#

class Picture < ActiveRecord::Base

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  belongs_to :gallery

  mount_uploader :image, ImageUploader

  after_update :crop_image

  def to_jq_upload
    {
      "name" => read_attribute(:image),
      "size" => image.size,
      "url" => image.url,
      "thumbnail_url" => image.thumb.url,
      "delete_url" => id,
      "picture_id" => id,
      "delete_type" => "DELETE"
    }
  end

  def crop_image
    image.recreate_versions! if crop_x.present?
    current_version = self.image.current_path
    large_version = "#{Rails.root}/public" + self.image.versions[:large].to_s

    FileUtils.rm(current_version)
    FileUtils.cp(large_version, current_version)
  end
end
