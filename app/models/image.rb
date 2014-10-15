class Image < ActiveRecord::Base
  mount_uploader(:asset, ImageUploader)

  acts_as_taggable_on(:tags)

  validates(:uploader, presence: true)
  validates(:asset, presence: true)
  validates(:tag_list, presence: true)
  validates(:artist, length: { maximum: 15 })

  validate(:validate_tags)
  validate(:validate_source)

  before_save(:default_values)

  belongs_to(:uploader, class_name: "User")
  has_many(:comments, foreign_key: "image_owner_id", dependent: :destroy)

  # Amount of images shown on each page
  self.per_page = Settings.image.per_page

  def validate_tags
    if tag_list.length > Settings.image.max_tags
      errors.add(:tag_list, "Can not contain more than #{Settings.image.max_tags} tags")
    end
  end

  def validate_source
    if source
      unless source.include?("://")
        errors.add(:source, "We require an absolute link. Example: https://google.com")
      end
    end
  end

  def default_values
    # ||= isn't working when updating
    self.artist = "Unkown" if self.artist.blank?
  end
end
