require 'spec_helper'

describe Game do
  describe "#create" do
    subject { FactoryGirl.create(:game) }
    it { should be_valid }
    its(:name) { should include("game") }

    it "fails to create a game with the same name" do
      expect { FactoryGirl.create(:game, name: subject.name) }.to raise_error
    end
  end

  context "For completion scopes" do
    before :each do
      @game1 = FactoryGirl.create(:game, completed: true)
      @game2 = FactoryGirl.create(:game)
    end

    describe "#complete" do
      subject { Game.complete }
      it { should include(@game1) }
    end

    describe "#incomplete" do
      subject { Game.incomplete }
      it { should include(@game2) }
    end
  end

  context "When the game has users" do
    before :each do
      @user = FactoryGirl.build(:user)
      @game = FactoryGirl.build(:game)
      @game.users << @user
    end

    it "has the user associated" do
      expect(@game.users).to include(@user)
    end
  end
end
