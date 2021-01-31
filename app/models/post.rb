class Post < ApplicationRecord
  belongs_to :user

  has_many :tags
  has_many :comments, as: :commentable, dependent: :destroy

  enum status: { draft: 0, published: 1, archived: 2 }
  
  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 200 }

  scope :published, -> { where(status: :published) }
  scope :draft, -> { where(status: :draft) }
end
