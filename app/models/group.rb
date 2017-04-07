class Group < ApplicationRecord
  has_many :posts,:dependent => :destroy
  belongs_to :user
  validates :title, presence: true

  has_many :group_relationships,:dependent => :destroy
  has_many :member, through: :group_relationships, source: :user
end
