class Article < ApplicationRecord
  belongs_to :user

  enum status: [:draft, :published]

  scope :filter_by_status, -> (status) { where status: status }
  scope :filter_by_title, -> (title) { where("title LIKE?", "%#{title}%")}
  scope :filter_by_body, -> (body) { where("body LIKE?", "%#{body}%")}
  scope :filter_by_user, -> (user) { where("user_id = ?", user)}

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validates :user_id, presence: true
end
