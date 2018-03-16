class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  # has_and_belongs_to_many :post
  # has_and_belongs_to_many :user
end
