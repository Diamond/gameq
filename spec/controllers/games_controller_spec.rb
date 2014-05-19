require 'spec_helper'

describe GamesController do
  describe 'POST "create"' do
    it "creates a game with valid data" do
      post :create, game: { name: "New Game" }
      expect(response).to be_success
    end

    it "fails when creating a game with invalid data" do
      post :create, game: { name: nil }
      expect(response.status).to eq 422
    end
  end

  describe 'GET "index"' do
    context "With no context" do
      before :each do
        FactoryGirl.create(:game)
        get :index
      end

      it "returns a successful response" do
        expect(response).to be_success
      end

      it "returns a list of games" do
        expect(assigns(:games)).to_not be_empty
      end
    end

    context "When in contexts" do
      before :each do
        @user   = FactoryGirl.create :user
        @tag    = FactoryGirl.create :tag
        @game_1 = FactoryGirl.create :game
        @game_2 = FactoryGirl.create :game
        @other_game = FactoryGirl.create :game
      end

      context "Of a user" do
        before :each do
          @user.games = [@game_1, @game_2]
          @user.save
          get :index, user_id: @user.id
        end

        it "returns a successful response" do
          expect(response).to be_success
        end

        it "returns a list of games with the right user" do
          expect(assigns(:games)).to include(@game_1)
        end

        it "gets a list of games only for the user" do
          expect(assigns(:games)).to_not include(@other_game)
        end
      end

      context "Of a tag" do
        before :each do
          GameTag.add_tag_for_game @tag, @game_1
          GameTag.add_tag_for_game @tag, @game_2
          get :index, tag_id: @tag.id
        end

        it "returns a successful response" do
          expect(response).to be_success
        end

        it "returns a list of games with the right tag" do
          expect(assigns(:games)).to include(@game_1)
        end

        it "gets a list of games only for the tag" do
          expect(assigns(:games)).to_not include(@other_game)
        end
      end
    end
  end

  describe 'GET "show"' do
    before :each do
      @game = FactoryGirl.create(:game)
      get :show, id: @game.id
    end

    it "returns a successful response" do
      expect(response).to be_success
    end

    it "returns the expected game" do
      expect(assigns(:user_game)).to eq @game
    end
  end

  describe 'DELETE "destroy"' do
    before :each do
      @game      = FactoryGirl.create :game
      @user      = FactoryGirl.create :user
      @user_game = FactoryGirl.create :user_game, game_id: @game.id, user_id: @user.id
      delete :destroy, id: @user_game.id
    end

    it "returns a successful response" do
      expect(response).to be_success
    end

    it "destroys the game" do
      expect(Game.where(id: @game.id).count).to eq 0 
    end
  end

  describe 'PATCH "update"' do
    it "updates the game details" do
      game = FactoryGirl.create(:game)
      patch :update, id: game.id, game: { name: "foobar" }
      game.reload
      expect(game.name).to eq "foobar"
    end

    it "fails to update with bad data" do
      game = FactoryGirl.create(:game)
      patch :update, id: game.id, game: { name: nil }
      expect(response.status).to eq 422
    end

  end
end
