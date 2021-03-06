[![Test Coverage](https://codeclimate.com/github/factor-io/connector-trello/badges/coverage.svg)](https://codeclimate.com/github/factor-io/connector-trello)
[![Dependency Status](https://gemnasium.com/factor-io/connector-trello.svg)](https://gemnasium.com/factor-io/connector-trello)
[![Build Status](https://travis-ci.org/factor-io/connector-trello.svg)](https://travis-ci.org/factor-io/connector-trello)
[![Gem Version](https://badge.fury.io/rb/factor-connector-trello.svg)](http://badge.fury.io/rb/factor-connector-trello)


Trello Connector for Factor.io
======================

The Factor.io Trello connector gem is used to run actions in Trello through your Factor.io workflow. It was built with the [factor-connector-api](https://github.com/factor-io/connector-api) and [ruby-trello](https://github.com/jeremytregunna/ruby-trello) gems.

##Installation

Add this to your `Gemfile` in your [connector](https://github.com/factor-io/connector).
```ruby
gem 'factor-connector-trello', '~> 0.0.4'
```
And the following to your `init.rb` file:
```ruby
require 'factor/connector/trello_boards'
require 'factor/connector/trello_lists'
require 'factor/connector/trello_cards'
require 'factor/connector/trello_members'
```
Refer to the [setup documentation](https://github.com/factor-io/connector#running) to integrate it fully with your workflow.

##Authentication

First, you must generate an [application key](https://trello.com/1/appKey/generate) which will be listed as `key`.

Afterwards, replace your application key and other particulars in the link below. Your desired expiration date can be set to an amount of days or to `never`. Then, enter your customized link into a browser and it will create your authentication token.
<br />
<br />
`https://trello.com/1/authorize?key=substitutewithyourapplicationkey&name=My+Application&expiration=1day&response_type=token&scope=read,write`

##Configuration

**[Setup your workflows](https://github.com/factor-io/connector-trello/wiki/Setup-your-workflows)**: To use the connector in your workflow when you run `factor s` you must setup your `credentials.yml` and `connectors.yml` files.

##Functionality

[example]

Further examples are provided in the **[Actions and Listeners](https://github.com/factor-io/connector-trello/wiki/Actions-and-Listeners)** wiki.

##Testing

Using a command line to test locally, you must set up three environmental variables:

```shell
$ export TRELLO_API_KEY=<api_key>
$ export TRELLO_AUTH_TOKEN=<auth_token>
$ export TRELLO_MEMBER_ID=<username>
```
Next, you can bundle and run the tests:

```shell
$ bundle exec rake
```

##Contributing

Documentation, feature requests, code, tests, and [bug reports](https://github.com/factor-io/connector-trello/issues/new) are welcomed. Click [here](https://github.com/factor-io/factor/wiki/Contribution) for more information.
