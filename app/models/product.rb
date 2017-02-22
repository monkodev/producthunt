# == Schema Information
#
# Table name: products
#
#  id                 :integer          not null, primary key
#  name               :string
#  url                :string
#  description        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Product < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :votes

	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>"} ,validate_media_type: false

	validates :name, presence: true
	validates :url, presence: true
	validates :image, presence: false

	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	#validates_attachment :image, presence: true,
    #content_type: { content_type: ["image/jpeg", "image/gif", "image/png", "image/jpg", "image/bmp"] }
	#validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/]

	# Validate content type
  #validates_attachment_content_type :image, :content_type => /\Aimage/

  # Validate filename
  #validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/]

	def voted_by?(user)
		votes.exists?(user: user)
		
	end

end
