class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :votes

  #::join_table => "user_id"
  #has_and_belongs_to_many, :join_table => "user_id"

  #create a scope to queries like
  #pull all data where comments = postid

  validates :title, :body, presence: true
  #do uniquiness foe user and post check stackoverflow

  def something
    'hello'
  end

  def comment_count
    comments.count
  end

  # def usssee
  #   :user_id = current_user.id
  # end
end
