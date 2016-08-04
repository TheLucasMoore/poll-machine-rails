class Poll < ApplicationRecord
  belongs_to :user
  has_many :questions

  accepts_nested_attributes_for :questions
  validates_presence_of :title, :user_id, presence: true
end
