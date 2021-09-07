class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable

  validates :content, presence: true

  def base_article
    cmbo = commentable
    loop do
      return cmbo if cmbo.is_a? Article
      cmbo = cmbo.commentable
    end
  end
end
