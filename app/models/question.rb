class Question < ApplicationRecord
  belongs_to :poll
  has_many :votes

  validates :content, presence: :true
end
