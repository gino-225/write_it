class Post < ApplicationRecord

  belongs_to :user
  has_many :comments
  has_many :votes


  validates :title, :body, presence: true
  #do uniquiness foe user and post check stackoverflow

  def body_count
    body.length
  end

  def comment_count
    if comments.count < 1
      "Be the first to Comment."
    else
       'Comments (' + comments.count.to_s + ')'
    end
  end

  def type_count(string)
    case string
    when 'comments'
      if comments.count < 1
        "Be the first to Comment."
      else
         "Comments (" + comments.count.to_s + ")"
      end
    when 'votes'
      if votes.count < 1
        "Be the first to Vote."
      else
         "Votes (" + votes.count.to_s + ")"
      end
    end
  end

 def counting_votes
   up_vote = []
   down_vote = []
   score = 0
   votes.each do |vote|
    score = score + 1 if vote.selected == 1
    score = score - 1 if vote.selected == 0


   end
  # "up vote = " + up_vote.count.to_s + "down vote = " + down_vote.count.to_s
   #vhash = {'up' => up_vote, 'down' => down_vote }
   score
 end

  # def  display_votes_values
  #   votes.each do |vote|
  #     "#{vote.selected} + <br>"
  #   end
  #
  # end



end
