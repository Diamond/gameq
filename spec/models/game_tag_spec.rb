require 'spec_helper'

describe GameTag do
  describe "#increase_score" do
    subject { FactoryGirl.build :game_tag }
    it "increases the score by 1" do
      subject.increase_score
      expect(subject.score).to eq 2
    end
  end

  describe ".add_tag_for_game" do
    context "Without an existing game/tag combo" do
      before :each do
        @game     = FactoryGirl.create :game
        @tag      = FactoryGirl.create :tag
        @game_tag = GameTag.add_tag_for_game(@tag, @game)
      end

      it "creates a new game tag" do
        expect(@game_tag).to be_a(GameTag)
      end

      it "has a score of 1" do
        expect(@game_tag.score).to eq 1
      end
    end

    context "With an existing game/tag combo" do
      before :each do
        @game              = FactoryGirl.create :game
        @tag               = FactoryGirl.create :tag
        @existing_game_tag = GameTag.add_tag_for_game(@tag, @game)
        @new_game_tag      = GameTag.add_tag_for_game(@tag, @game)
      end

      it "does not create a new game tag" do
        expect(@new_game_tag.id).to eq @existing_game_tag.id
      end

      it "has a score of 2" do
        expect(@new_game_tag.score).to eq 2
      end
    end
  end

  describe "#set_default_score" do
    before :each do
      @game_tag = FactoryGirl.build :game_tag, score: nil
    end

    it "sets the score to 0" do
      @game_tag.save
      expect(@game_tag.score).to eq 0
    end
  end
end
