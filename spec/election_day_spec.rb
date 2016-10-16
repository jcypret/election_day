require "spec_helper"

describe ElectionDay do
  it "has a version number" do
    expect(ElectionDay::VERSION).not_to be nil
  end

  describe "#election_year?" do
    it "returns true for election years" do
      Timecop.freeze(Date.new(2016, 7, 4)) do
        expect(ElectionDay.election_year?).to eq true
      end
    end

    it "returns false for non-election years" do
      Timecop.freeze(Date.new(2017, 7, 4)) do
        expect(ElectionDay.election_year?).to eq false
      end
    end
  end

  describe "#midterm_election_year?" do
    it "returns true for midterm election years" do
      Timecop.freeze(Date.new(2018, 7, 4)) do
        expect(ElectionDay.midterm_election_year?).to eq true
      end
    end

    it "returns false for non-midterm election years" do
      Timecop.freeze(Date.new(2019, 7, 4)) do
        expect(ElectionDay.midterm_election_year?).to eq false
      end
    end

    it "returns false for presidential election years" do
      Timecop.freeze(Date.new(2020, 7, 4)) do
        expect(ElectionDay.midterm_election_year?).to eq false
      end
    end
  end

  describe "#presidential_election_year?" do
    it "returns true for presidential election years" do
      Timecop.freeze(Date.new(2016, 7, 4)) do
        expect(ElectionDay.presidential_election_year?).to eq true
      end
    end

    it "returns false for non-election years" do
      Timecop.freeze(Date.new(2017, 7, 4)) do
        expect(ElectionDay.presidential_election_year?).to eq false
      end
    end

    it "returns false for midterm election years" do
      Timecop.freeze(Date.new(2018, 7, 4)) do
        expect(ElectionDay.presidential_election_year?).to eq false
      end
    end
  end
end
