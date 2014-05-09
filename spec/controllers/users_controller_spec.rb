require 'spec_helper'

describe UsersController do
  describe "POST 'create'" do
    it "returns http success with valid data" do
      post 'create', user: { email: 'test2@test.com', password: 'test1234', password_confirmation: 'test1234' }
      expect(response).to be_success
    end

    it "returns unprocessable entity with invalid data" do
      post 'create', user: { email: nil, password: 'test1234', password_confirmation: 'test1234' }
      expect(response.status).to eq 422
    end
  end

  describe "GET 'show'" do
    before :each do
      FactoryGirl.create(:user)
    end

    it "returns http success for a member that exists" do
      get :show, id: 1
      expect(response).to be_success
    end

    it "returns failure for a member that does not exist" do
      get :show, id: 3756
      expect(response.status).to eq 422
    end
  end

  describe "PUT 'update'" do
    before :each do
      @user = FactoryGirl.create(:user)
    end

    context "When logged in as the target user" do
      before :each do
        mock_login @user 
      end

      it "updates the password for the same user" do
        old_pw = @user.crypted_password
        put :update, id: @user.id, user: { password: 'newpw', password_confirmation: 'newpw' }

        @user.reload
        expect(@user.crypted_password).to_not eq old_pw
      end

      it "returns failure with invalid data" do
        put :update, id: @user.id, user: { password: 'badpw', password_confirmation: 'reallybadpw' }
        expect(response.status).to eq 422
      end

      it "returns failure for an invalid user" do
        put :update, id: '4019', user: { password: 'newpw', password_confirmation: 'newpw' }
        expect(response.status).to eq 422
      end
    end

    context "When logged in as a different user" do
      before :each do
        other_user = FactoryGirl.create(:user)
        mock_login(other_user)
      end

      it "returns failure when attempting to update another user" do
        put :update, id: @user.id, user: { password: 'newpw', password_confirmation: 'newpw' }
        expect(response.status).to eq 422
      end
    end
  end

  describe 'DELETE "destroy"' do
    before :each do
      @user = FactoryGirl.create(:user)
    end

    context "When logged in as the target user" do
      before :each do
        mock_login @user
      end

      it "returns success when deleting the user" do
        delete :destroy, id: @user.id
        expect(response).to be_success
      end

      it "fails when deleting an invalid user" do
        delete :destroy, id: "103128"
        expect(response.status).to eq 422
      end
    end

    context "When logged in as a different user" do
      before :each do
        other_user = FactoryGirl.create(:user)
        mock_login other_user
      end

      it "fails when deleting a different user" do
        delete :destroy, id: @user.id
        expect(response.status).to eq 422
      end
    end
  end
end
