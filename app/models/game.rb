class Game < ActiveRecord::Base
  validates :name, uniqueness: { scope: :console }, presence: true

  scope :complete,   -> { where(completed: true) }
  scope :incomplete, -> { where(completed: false) }

  has_many :user_games
  has_many :users, through: :user_games

  has_many :game_tags
  has_many :tags, through: :game_tags

  belongs_to :console

  def add_tag(tag_name)
    tag = Tag.first_or_create(name: tag_name.downcase)
    GameTag.add_tag_for_game(tag, self)
  end
end
