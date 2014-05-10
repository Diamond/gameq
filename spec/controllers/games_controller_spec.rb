require 'spec_helper'

describe GamesController do
  describe 'POST "create"' do
    it "creates a game with valid data" do
      post :create, game: { name: "New Game", completed: false }
      expect(response).to be_success
    end

    it "fails when creating a game with invalid data" do
      post :create, game: { name: nil, completed: false }
      expect(response.status).to eq 422
    end
  end

  describe 'GET "index"' do
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

  describe 'GET "show"' do
    before :each do
      @game = FactoryGirl.create(:game)
      get :show, id: @game.id
    end

    it "returns a successful response" do
      expect(response).to be_success
    end

    it "returns the expected game" do
      expect(assigns(:game)).to eq @game
    end
  end

  describe 'DELETE "destroy"' do
    before :each do
      @game = FactoryGirl.create(:game)
      delete :destroy, id: @game.id
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
  end
end
