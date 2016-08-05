class Poll < ApplicationRecord
  belongs_to :user
  has_many :questions
  has_many :votes, through: :questions

  accepts_nested_attributes_for :questions
  validates :user_id, presence: true
  validates :title, uniqueness: true, presence: true
  validates :end_time, presence: true
end
