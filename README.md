# Rack::Ermahgerd

Translate the text of a Rack application's web response to ERMAHGERD-ish with this piece of Rack Middleware. It modifies the response, so newer versions of Rails will not work with it. I've tested it to be working with Sinatra and plain rack apps. 

## Installation

Add this line to your application's Gemfile:

    gem 'rack-ermahgerd'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack-ermahgerd

## Usage

Use it as middleware in your rack based application. In your Sinatra app or Rackup file add the following:

    require 'rack-ermahgerd'
    use Rack::Ermahgerd

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
