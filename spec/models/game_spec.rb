require 'spec_helper'

describe Game do
  describe "#create" do
    let (:console) { FactoryGirl.create(:console) }
    subject { FactoryGirl.create(:game, console: console) }
    it { should be_valid }
    its(:name) { should include("game") }
    its(:console) { should eq console }

    it "fails to create a game with the same name for the same console" do
      expect { FactoryGirl.create(:game, name: subject.name, console: console) }.to raise_error
    end

    it "allows creating a game with the same name for different consoles" do
      new_console = FactoryGirl.create(:console, name: "test")
      expect { FactoryGirl.create(:game, name: subject.name, console: new_console) }.to_not raise_error
    end

    it "fails to create a game with a blank name" do
      expect { FactoryGirl.create(:game, name: nil) }.to raise_error
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

  context "When the game has tags" do
    before :each do
      @game = FactoryGirl.build(:game)
      @tag  = FactoryGirl.build(:tag)
      @game.tags << @tag
    end

    it "has the associated tag" do
      expect(@game.tags).to include(@tag)
    end
  end

  context "#add_tag" do
    before :each do
      @game = FactoryGirl.create(:game)
      @tag  = FactoryGirl.create(:tag)
      @game.add_tag @tag.name
    end

    it "adds the tag" do
      expect(@game.tags).to include(@tag)
    end

    it "increases the score to 1" do
      expect(@game.game_tags.first.score).to eq 1
    end
  end
end
