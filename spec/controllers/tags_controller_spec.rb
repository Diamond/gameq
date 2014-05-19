require 'spec_helper'

describe TagsController do
  describe 'POST "create"' do
    before :each do
      @game = FactoryGirl.create :game
    end

    it "creates a tag with valid data" do
      post :create, tag: { name: "New Tag" }, game_id: @game.id
      expect(response).to be_success
    end

    it "fails when creating a tag with invalid data" do
      post :create, tag: { name: nil }, game_id: @game.id
      expect(response.status).to eq 422
    end
  end

  describe 'GET "show"' do
    before :each do
      @tag = FactoryGirl.create(:tag)
      get :show, id: @tag.id
    end

    it "returns a successful response" do
      expect(response).to be_success
    end

    it "returns the expected tag" do
      expect(assigns(:tag)).to eq @tag
    end
  end
end
