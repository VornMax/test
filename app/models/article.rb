class Article < ApplicationRecord
  belongs_to :user

  enum status: [:draft, :published]

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validates :user_id, presence: true
end
