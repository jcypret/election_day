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
    context "when election is upcoming in the following year" do
      it "returns the date of the next election" do
        Timecop.freeze(Date.new(2015, 7, 4)) do
          expect(ElectionDay.next_election).to eq Date.new(2016, 11, 8)
        end
      end
    end

    context "when election is upcoming in current year" do
      it "returns the date of the next election" do
        Timecop.freeze(Date.new(2016, 7, 4)) do
          expect(ElectionDay.next_election).to eq Date.new(2016, 11, 8)
        end
      end
    end

    context "when election has already occured in current year" do
      it "returns the date of the next election" do
        Timecop.freeze(Date.new(2016, 11, 9)) do
          expect(ElectionDay.next_election).to eq Date.new(2018, 11, 6)
        end
      end
    end
  end

  describe "#next_midterm_election" do
    context "when midterm election is upcoming in a following year" do
      it "returns the date of the next midterm election" do
        Timecop.freeze(Date.new(2015, 7, 4)) do
          expect(ElectionDay.next_midterm_election).to eq Date.new(2018, 11, 6)
        end
      end
    end

    context "when midterm election is upcoming in current year" do
      it "returns the date of the next midterm election" do
        Timecop.freeze(Date.new(2018, 7, 4)) do
          expect(ElectionDay.next_midterm_election).to eq Date.new(2018, 11, 6)
        end
      end
    end

    context "when midterm election has already occured in current year" do
      it "returns the date of the next midterm election" do
        Timecop.freeze(Date.new(2018, 11, 7)) do
          expect(ElectionDay.next_midterm_election).to eq Date.new(2022, 11, 8)
        end
      end
    end
  end

  describe "#next_presidential_election" do
    context "when presidential election is upcoming in a following year" do
      it "returns the date of the next presidential election" do
        Timecop.freeze(Date.new(2017, 7, 4)) do
          expect(ElectionDay.next_presidential_election).to eq Date.new(2020, 11, 3)
        end
      end
    end

    context "when presidential election is upcoming in current year" do
      it "returns the date of the next presidential election" do
        Timecop.freeze(Date.new(2020, 7, 4)) do
          expect(ElectionDay.next_presidential_election).to eq Date.new(2020, 11, 3)
        end
      end
    end

    context "when presidential election has already occured in current year" do
      it "returns the date of the next presidential election" do
        Timecop.freeze(Date.new(2020, 11, 4)) do
          expect(ElectionDay.next_presidential_election).to eq Date.new(2024, 11, 5)
        end
      end
    end
  end
end
