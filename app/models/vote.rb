class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :user_id, uniqueness: { scope: :question,
    message: "One vote per person" }
end
