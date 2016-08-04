class Poll < ApplicationRecord
  belongs_to :user
  has_many :questions

  accepts_nested_attributes_for :questions
  validates :user_id, presence: true
  validates :title, uniqueness: true, presence: true
end
