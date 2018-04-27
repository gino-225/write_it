class Post < ApplicationRecord

  belongs_to :user
  has_many :comments
  has_many :votes


  validates :title, :body, presence: true
  #do uniquiness for user and post check stackoverflow

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
     score = 0
     votes.each do |vote|
        if vote.selected == 1
          score += 1
        elsif vote.selected == 0
          score -=  0
        end
     end
     score
   end

   def votes_for(user)

     if votes.where(user_id: user.id).present?
       votes.where(user_id: user.id).first
     else
       votes.new
     end
   end


end
