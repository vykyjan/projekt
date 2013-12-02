# == Schema Information
#
# Table name: presents
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  pole       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Present < ActiveRecord::Base
 attr_accessible :name, :pole, :user_id
  belongs_to :user



end
