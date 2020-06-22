# Pixitar

![Pixitar avatar examples](examples/avatars.png)

Pixitar is an avatar generation library written in Ruby. Generate random, male or female avatars.

Inspired by https://github.com/matveyco/8biticon (author of the original image assets). 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pixitar'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install pixitar

## Usage

```
avatar = Pixitar::Avatar.new
avatar.generate_avatar                         " Generates a random with either male or female face and saves it to avatar.png
avatar.generate_avatar(:male, "avatar.png")    " Generates a random avatar with male face and saves it to avatar.png
avatar.male_avatar                             " Generates a random avatar with male face and saves it to avatar.png
avatar.female_avatar                           " Generates a random avatar with female face and saves it to avatar.png

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ptcodes/pixitar.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
