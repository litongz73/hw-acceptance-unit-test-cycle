require 'rails_helper'

describe MoviesHelper do
  describe "#oddness" do
    it "returns true" do
      expect(helper.oddness(4)).to eql('even')
    end
  end
end