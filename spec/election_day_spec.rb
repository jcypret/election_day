require "spec_helper"

describe ElectionDay do

  # Election dates for the 2016 through 2026
  PRESIDENTIAL_ELECTION_YEARS = [2016, 2020, 2024]
  MIDTERM_ELECTION_YEARS = [2018, 2022, 2026]
  ELECTION_YEARS = PRESIDENTIAL_ELECTION_YEARS + MIDTERM_ELECTION_YEARS
  NON_ELECTION_YEARS = (2016..2026).to_a - ELECTION_YEARS

  it "has a version number" do
    expect(ElectionDay::VERSION).not_to be nil
  end

  describe "#election_year?" do
    ELECTION_YEARS.each do |year|
      it "returns true for an election year: #{year}" do
        expect(ElectionDay.election_year?(year)).to eq true
      end
    end

    NON_ELECTION_YEARS.each do |year|
      it "returns false for a non-election year: #{year}" do
        expect(ElectionDay.election_year?(year)).to eq false
      end
    end
  end

  describe "#midterm_election_year?" do
    MIDTERM_ELECTION_YEARS.each do |year|
      it "returns true for a midterm election year: #{year}" do
        expect(ElectionDay.midterm_election_year?(year)).to eq true
      end
    end

    NON_ELECTION_YEARS.each do |year|
      it "returns false for a non-midterm election year: #{year}" do
        expect(ElectionDay.midterm_election_year?(year)).to eq false
      end
    end

    PRESIDENTIAL_ELECTION_YEARS.each do |year|
      it "returns false for a presidential election year: #{year}" do
        expect(ElectionDay.midterm_election_year?(year)).to eq false
      end
    end
  end

  describe "#presidential_election_year?" do
    PRESIDENTIAL_ELECTION_YEARS.each do |year|
      it "returns true for a presidential election year: #{year}" do
        expect(ElectionDay.presidential_election_year?(year)).to eq true
      end
    end

    NON_ELECTION_YEARS.each do |year|
      it "returns false for a non-election year: #{year}" do
        expect(ElectionDay.presidential_election_year?(year)).to eq false
      end
    end

    MIDTERM_ELECTION_YEARS.each do |year|
      it "returns false for a midterm election year: #{year}" do
        expect(ElectionDay.presidential_election_year?(year)).to eq false
      end
    end
  end

  describe "#next_election" do
    it "returns the date of the next election" do
      expect(ElectionDay.next_election).to eq Date.new(2016, 11, 8)
    end
  end

  describe "#next_presidential_election" do
    it "returns the date of the next presidential election" do
      expect(ElectionDay.next_presidential_election).to eq Date.new(2016, 11, 8)
    end
  end

  describe "#next_midterm_election" do
    it "returns the date of the next midterm election" do
      expect(ElectionDay.next_midterm_election).to eq Date.new(2018, 11, 6)
    end
  end
end
