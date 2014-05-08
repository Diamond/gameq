require 'spec_helper'

describe UsersController do
  describe "POST 'create'" do
    it "returns http success with valid data" do
      post 'create', user: { email: 'test@test.com', password: 'test1234', password_confirmation: 'test1234' }
      expect(response).to be_success
    end

    it "returns unprocessable entity with invalid data" do
      post 'create', user: { email: nil, password: 'test1234', password_confirmation: 'test1234' }
      expect(response.status).to eq 422
    end
  end
end
