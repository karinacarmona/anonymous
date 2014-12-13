class Post < ActiveRecord::Base
  belongs_to :poster, class_name: "User", foreign_key: "user_id"

  has_many :comments
  has_many :votes, as: :votable

  validates :user_id, presence: true
  validates :title, presence: true
  validates :body, presence: true

  def score
    self.votes.size
  end

  def voters
    self.votes.map {|vote| vote.user}
  end
end
