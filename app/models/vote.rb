class Vote < ApplicationRecord

  belongs_to :post
  belongs_to :user


  validates :selected, presence: true


#check if user has already made that a vote on this page
# speakinmg of users. in users login rediert to refering path.
# so when someone trys to create a comment etc they first get asked to sighn in
#or create an accout and when they do they get taken bak to where they were before.

def user_check
  #check if sighned in?
  if user_signed_in?
  #format.html { redirect_to @post, notice: 'Every Vote Counts.' }

  end

end


end
