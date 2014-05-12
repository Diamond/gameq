class Console < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true

  has_many :games
end
