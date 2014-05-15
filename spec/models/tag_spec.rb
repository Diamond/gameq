require 'spec_helper'

describe Tag do
  describe "#create" do
    subject { FactoryGirl.build :tag }
    it { should be_valid }
    context "Without a name" do
      before :each do
        subject.name = nil
      end
      it { should_not be_valid }
    end
    context "With an overlapping name" do
      before :each do
        FactoryGirl.create :tag, name: subject.name
      end
      it { should_not be_valid }
    end
    context "With associated games" do
      before :each do
        @game = FactoryGirl.build :game
        subject.games << @game
      end
      its(:games) { should include(@game) }
    end
  end
end
