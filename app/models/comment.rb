class Comment < ActiveRecord::Base
  belongs_to(:image_owner, class_name: "Image")
  belongs_to(:commenter, class_name: "User")

  validates(:body, presence: true)
  validates(:image_owner, presence: true)

  # Amount of comments shown on each page
  self.per_page = Settings.comment.per_page
end
