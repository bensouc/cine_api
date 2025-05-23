class Movie < ApplicationRecord
  belongs_to :director
  has_many :roles
  has_many :actors, through: :roles
  validates :title, presence: true
end
