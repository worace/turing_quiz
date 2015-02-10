class Question < ActiveRecord::Base
  belongs_to :quiz
  has_many :hints
  has_many :answers
  has_many :options
  has_many :further_thoughts
end
