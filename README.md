# Election Day

[![Gem Version](https://badge.fury.io/rb/election_day.svg)](https://badge.fury.io/rb/election_day)
[![Build Status](https://travis-ci.org/jcypret/election_day.svg?branch=master)](https://travis-ci.org/jcypret/election_day)
[![Code Climate](https://codeclimate.com/github/jcypret/election_day/badges/gpa.svg)](https://codeclimate.com/github/jcypret/election_day)
[![Test Coverage](https://codeclimate.com/github/jcypret/election_day/badges/coverage.svg)](https://codeclimate.com/github/jcypret/election_day/coverage)

## Installation

Add this line to your application's Gemfile:

```ruby
gem "election_day"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install election_day

## Documentation

The latest documentation for this library can be found here:
[http://www.rubydoc.info/gems/election_day/ElectionDay](http://www.rubydoc.info/gems/election_day/ElectionDay)

## Usage

```ruby
ElectionDay.election_year? # defaults to current year
=> true

ElectionDay.election_year?(2017)
=> false

ElectionDay.presidential_election_year?(2020)
=> true

ElectionDay.midterm_election_year?(2020)
=> false

ElectionDay.next_election
=> #<Date: 2016-11-08 ...>

ElectionDay.next_presidential_election
=> #<Date: 2016-11-08 ...>

ElectionDay.next_midterm_election
=> #<Date: 2018-11-05 ...>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jcypret/election_day. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
