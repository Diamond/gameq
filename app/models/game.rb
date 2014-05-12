class Game < ActiveRecord::Base
  validates :name, uniqueness: { scope: :console }, presence: true

  scope :complete,   -> { where(completed: true) }
  scope :incomplete, -> { where(completed: false) }

  has_many :user_games
  has_many :users, through: :user_games

  belongs_to :console
end
