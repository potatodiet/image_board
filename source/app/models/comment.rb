class Comment < ActiveRecord::Base
  belongs_to(:image_owner, :class_name => 'Image')

  validates_presence_of(:body)
  validates_presence_of(:image_owner)

  # Amount of comments on each page
  self.per_page = 6
end
