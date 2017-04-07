class Post < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :likes, :dependent => :destroy
  has_many :comments ,:dependent => :destroy

  validates :content, presence: true

  scope :recent, -> {order("created_at DESC")}

  def is_like?(user)
    self.likes.where(:user_id => user.id).length > 0
  end
end
