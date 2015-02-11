class Question < ActiveRecord::Base
  belongs_to :quiz
  has_many :answers
  validates_presence_of :quiz_id
end
