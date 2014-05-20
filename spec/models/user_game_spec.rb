require 'spec_helper'

describe UserGame do
  describe '.add_game_for_user' do
    before :each do
      @user = FactoryGirl.create(:user)
    end

    context "For a valid game" do
      before :each do
        @game = FactoryGirl.create(:game)
      end

      it "adds the game to the user's list" do
        UserGame.add_game_for_user(@game, @user, true)
        expect(UserGame.where(game_id: @game.id, user_id: @user.id).count).to eq 1
      end
    end

    context "For an invalid game" do
       before :each do
        @game = FactoryGirl.create(:game)
      end

      it "adds the game to the user's list" do
        @game.name = nil
        result = UserGame.add_game_for_user(@game, @user, true)
        expect(result).to eq false
      end
    end
  end
end
