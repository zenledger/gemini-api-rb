# Gemini Trading API for Ruby

[![Code Climate](https://codeclimate.com/repos/56db27e5b86182573b0045ed/badges/bd763083d70114379a41/gpa.svg)](https://codeclimate.com/repos/56db27e5b86182573b0045ed/feed)

* Official implementation
* REST API
* WebSockets API 
* REST API version 2
* WebSockets API version 2


## Installation

Add this line to your application's Gemfile:

    gem 'gemini-rb'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gemini-rb

## Usage

Configure your gem as:

```
require 'gemini'

Gemini::Client.configure do |conf|
  # add `secret` and `api_key` if you need to access authenticated endpoints.
  conf.secret = ENV["GEMINI_API_SECRET"]
  conf.api_key = ENV["GEMINI_API_KEY"]

  # uncomment if you want to use version 2 of the API
  # which is opt-in at the moment
  #
  # conf.use_api_v2
end
```

Then you can use the client as follow:

```
client = Gemini::Client.new
client.balances
```

check the [Gemini API documentation](http://docs.gemini.com/) for more information.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/gemini/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
