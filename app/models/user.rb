class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessor :password, :password_confirmation, :password_digest

  validates :email, presence: true, uniqueness: true
  validates_confirmation_of :password

  has_many :user_games
  has_many :games, through: :user_games
end
