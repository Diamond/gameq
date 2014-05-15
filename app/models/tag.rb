class Tag < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true

  has_many :game_tags
  has_many :games, through: :game_tags
end
