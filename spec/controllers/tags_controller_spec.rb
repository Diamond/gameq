require 'spec_helper'

describe TagsController do
  describe 'POST "create"' do
    it "creates a tag with valid data" do
      post :create, tag: { name: "New Game", completed: false }
      expect(response).to be_success
    end

    it "fails when creating a tag with invalid data" do
      post :create, tag: { name: nil, completed: false }
      expect(response.status).to eq 422
    end
  end

  describe 'GET "index"' do
    before :each do
      FactoryGirl.create(:tag)
      get :index
    end

    it "returns a successful response" do
      expect(response).to be_success
    end

    it "returns a list of tags" do
      expect(assigns(:tags)).to_not be_empty
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

  describe 'DELETE "destroy"' do
    before :each do
      @tag = FactoryGirl.create(:tag)
      delete :destroy, id: @tag.id
    end

    it "returns a successful response" do
      expect(response).to be_success
    end

    it "destroys the tag" do
      expect(Tag.where(id: @tag.id).count).to eq 0 
    end
  end

  describe 'PATCH "update"' do
    it "updates the tag details" do
      tag = FactoryGirl.create(:tag)
      patch :update, id: tag.id, tag: { name: "foobar" }
      tag.reload
      expect(tag.name).to eq "foobar"
    end

    it "fails to update with bad data" do
      tag = FactoryGirl.create(:tag)
      patch :update, id: tag.id, tag: { name: nil }
      expect(response.status).to eq 422
    end

  end
end
