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
end
