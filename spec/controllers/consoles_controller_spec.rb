require 'spec_helper'

describe ConsolesController do
  describe 'POST "create"' do
    it "creates a console with valid data" do
      post :create, console: { name: "New Console", completed: false }
      expect(response).to be_success
    end

    it "fails when creating a console with invalid data" do
      post :create, console: { name: nil, completed: false }
      expect(response.status).to eq 422
    end
  end

  describe 'GET "index"' do
    before :each do
      FactoryGirl.create(:console)
      get :index
    end

    it "returns a successful response" do
      expect(response).to be_success
    end

    it "returns a list of consoles" do
      expect(assigns(:consoles)).to_not be_empty
    end
  end

  describe 'GET "show"' do
    before :each do
      @console = FactoryGirl.create(:console)
      get :show, id: @console.id
    end

    it "returns a successful response" do
      expect(response).to be_success
    end

    it "returns the expected console" do
      expect(assigns(:console)).to eq @console
    end
  end

  describe 'DELETE "destroy"' do
    before :each do
      @console = FactoryGirl.create(:console)
      delete :destroy, id: @console.id
    end

    it "returns a successful response" do
      expect(response).to be_success
    end

    it "destroys the console" do
      expect(Console.where(id: @console.id).count).to eq 0
    end
  end

  describe 'PATCH "update"' do
    it "updates the console details" do
      console = FactoryGirl.create(:console)
      patch :update, id: console.id, console: { name: "foobar" }
      console.reload
      expect(console.name).to eq "foobar"
    end
  end
end
