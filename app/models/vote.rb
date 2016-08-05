class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :poll

  validates :user_id, uniqueness: { scope: :poll,
    message: "One Vote Per Person! Nice try though." }
end
