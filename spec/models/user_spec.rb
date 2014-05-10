require 'spec_helper'

describe User do
  context "When creating a new user account" do
    context "With valid data" do
      subject { FactoryGirl.build(:user) }
      it { should be_valid }
    end

    context "With invalid data" do
      it "is invalid without an email" do
        subject.email = nil
        expect(subject.valid?).to be_false
      end

      it "is invalid without a password" do
        subject.password = nil
        expect(subject.valid?).to be_false
      end

      it "is invalid if the password and password confirmation do not match" do
        subject.password = "foobarbaz"
        expect(subject.valid?).to be_false
      end

      it "is invalid if the email is already registered" do
        subject.email = 'test@test.com'
        FactoryGirl.create(:user, email: subject.email)
        expect(subject.valid?).to be_false
      end
    end
  end

  context "When the user has games" do
    before :each do
      @user = FactoryGirl.build(:user)
      @game = FactoryGirl.build(:game)
      @user.games << @game
    end

    it "has the game associated" do
      expect(@user.games).to include(@game)
    end
  end
end
