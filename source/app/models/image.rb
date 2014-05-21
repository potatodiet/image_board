class Image < ActiveRecord::Base
  mount_uploader(:asset, ImageUploader)

  acts_as_taggable_on(:tags)

  validates_presence_of(:uploader)
  validates_presence_of(:asset)
  validates_presence_of(:tag_list)

  validate(:validate_tags)

  belongs_to(:uploader, :class_name => 'User')
  has_many(:comments, :foreign_key => 'image_owner_id')

  # Amount of images on each page
  self.per_page = 24

  def validate_tags
    errors.add(:tag_list, 'Can not contain more than 20 tags') if tag_list.length > 20
  end
end
