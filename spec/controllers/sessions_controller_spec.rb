require 'spec_helper'

describe SessionsController do

  describe "GET 'create'" do
    it "returns http success with valid credentials" do
      @user = FactoryGirl.create(:user, email: 'test@test.com', password: 'test1234')
      post :create, email: 'test@test.com', password: 'test1234'
      expect(response).to be_success
    end

    it "returns unprocessable entity with invalid credentials" do
      post :create 
      expect(response).to_not be_success
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      delete :destroy, id: 1
      expect(response).to be_success
    end
  end
end
