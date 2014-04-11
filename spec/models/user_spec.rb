require 'spec_helper'

describe User do
  context "When creating a new user account" do
    context "With valid data" do
      subject { FactoryGirl.build(:user) }
      it { should be_valid }
    end

    context "With invalid data" do
      it "is invalid without an email"
      it "is invalid without a password"
      it "is invalid if the password and password confirmation do not match"
      it "is invalid if the email is already registered"
    end
  end
end
