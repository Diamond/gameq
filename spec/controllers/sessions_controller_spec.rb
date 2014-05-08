require 'spec_helper'

describe SessionsController do

  describe "GET 'create'" do
    it "returns http success with valid credentials" do
      @user = FactoryGirl.create(:user, email: 'test@test.com', password: 'test1234')
      get 'create', email: 'test@test.com', password: 'test1234'
      response.should be_success
      @user.destroy
    end

    it "returns unprocessable entity with invalid credentials" do
      get 'create'
      response.should_not be_success
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy'
      response.should be_success
    end
  end
end
