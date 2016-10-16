require "election_day/version"

# "The Tuesday next after the first Monday in the month of November"
# -- The 28th Congress (http://memory.loc.gov/ll/llsl/005/0700/07590721.tif)
module ElectionDay

  # Returns `true` if current year is an election year.
  def self.election_year?
    Date.today.year.even?
  end

  # Returns `true` if current year is a midterm election year.
  def self.midterm_election_year?
    (Date.today.year - 2014) % 4 == 0
  end

  # Returns `true` if current year is a presidential election year.
  def self.presidential_election_year?
    (Date.today.year - 2012) % 4 == 0
  end

  # Returns the `Date` of the next election.
  def self.next_election
  end

  # Returns the `Date` of the next midterm election.
  def self.next_midterm_election
  end

  # Returns the `Date` of the next presidential election.
  def self.next_presidential_election
  end

  private

  def self.get_election_date_by_year(year)
    # start at beginning of November of election year
    date = Date.new(year, 11, 1)
    # find the first monday of the month
    date = date.next_day while !date.monday?
    # add one more day because election day follows the first Monday
    date.next_day
  end
end
