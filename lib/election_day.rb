require "election_day/version"

# "The Tuesday next after the first Monday in the month of November"
# -- The 28th Congress (http://memory.loc.gov/ll/llsl/005/0700/07590721.tif)
module ElectionDay

  # Returns `true` if current year is an election year.
  def self.election_year?(year = Date.today.year)
    year.even?
  end

  # Returns `true` if current year is a midterm election year.
  def self.midterm_election_year?(year = Date.today.year)
    (year + 2) % 4 == 0
  end

  # Returns `true` if current year is a presidential election year.
  def self.presidential_election_year?(year = Date.today.year)
    year % 4 == 0
  end

  # Returns the `Date` of the next election.
  def self.next_election
    get_next_election(&:election_year?)
  end

  # Returns the `Date` of the next midterm election.
  def self.next_midterm_election
    get_next_election(&:midterm_election_year?)
  end

  # Returns the `Date` of the next presidential election.
  def self.next_presidential_election
    get_next_election(&:presidential_election_year?)
  end

  private

  def self.get_next_election(&block)
    year = Date.today.year
    # If there's an election that matches, but it has already occured, skip it.
    if block.call(self, year) && election_has_already_occured?(year)
      year = year + 1
    end
    # Check years incrementally against provided block until match is found.
    year = year + 1 while !block.call(self, year)
    # Return election date for the year that matches the block.
    get_election_date_by_year(year)
  end

  def self.get_election_date_by_year(year)
    # Start at beginning of November of election year.
    date = Date.new(year, 11, 1)
    # Find the first monday of the month.
    date = date.next_day while !date.monday?
    # Add one more day because election day follows the first Monday.
    date.next_day
  end

  def self.election_has_already_occured?(year)
    get_election_date_by_year(year) < Date.today
  end
end
