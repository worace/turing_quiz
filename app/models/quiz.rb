class Quiz < ActiveRecord::Base
  has_many :questions
  validates_uniqueness_of :slug
  def to_param
    slug
  end
end
