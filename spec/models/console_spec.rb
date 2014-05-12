require 'spec_helper'

describe Console do
  describe "#create" do
    subject { FactoryGirl.create(:console) }
    it { should be_valid }
    its(:name) { should include("Console") }

    it "fails to create a console with the same name" do
      expect { FactoryGirl.create(:console, name: subject.name) }.to raise_error
    end

    it "fails to create a console with a blank name" do
      expect { FactoryGirl.create(:console, name: nil) }.to raise_error
    end

    describe "With associated games" do
      let (:game) { FactoryGirl.create(:game, console: subject) }
      its(:games) { should include(game) }
    end
  end
end
