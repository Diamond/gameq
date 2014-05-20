require 'spec_helper'

describe GamesController do
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
end
