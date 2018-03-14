class Post < ApplicationRecord
  belongs_to :user
  #::join_table => "user_id"
  #has_and_belongs_to_many, :join_table => "user_id"
end
