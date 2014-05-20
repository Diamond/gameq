class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :email, presence: true, uniqueness: true
  validates_confirmation_of :password, if: :password

  has_many :user_games
  has_many :games, through: :user_games
end
