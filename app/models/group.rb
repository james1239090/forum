class Group < ApplicationRecord
  has_many :posts
  belongs_to :user
  validates :title, presence: true

  has_many :group_relationships
  has_many :member, through: :group_relationships, source: :user
end
