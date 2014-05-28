class Image < ActiveRecord::Base
  mount_uploader(:asset, ImageUploader)

  acts_as_taggable_on(:tags)

  validates_presence_of(:uploader)
  validates_presence_of(:asset)
  validates_presence_of(:tag_list)

  validate(:validate_tags)

  belongs_to(:uploader, :class_name => 'User')
  has_many(:comments, :foreign_key => 'image_owner_id', :dependent => :destroy)

  # Amount of images shown on each page
  self.per_page = Settings.image.per_page

  def validate_tags
    if tag_list.length > Settings.image.max_tags
      errors.add(:tag_list, "Can not contain more than #{Settings.image.max_tags} tags")
    end
  end
end
