[![Code Climate](https://codeclimate.com/github/factor-io/connector-trello/badges/gpa.svg)](https://codeclimate.com/github/factor-io/connector-trello)
[![Test Coverage](https://codeclimate.com/github/factor-io/connector-trello/badges/coverage.svg)](https://codeclimate.com/github/factor-io/connector-trello)
[![Dependency Status](https://gemnasium.com/factor-io/connector-trello.svg)](https://gemnasium.com/factor-io/connector-trello)
[![Build Status](https://travis-ci.org/factor-io/connector-trello.svg)](https://travis-ci.org/factor-io/connector-trello)
[![Gem Version](https://badge.fury.io/rb/factor-connector-trello.svg)](http://badge.fury.io/rb/factor-connector-trello)


Trello Connector for Factor.io
======================

The Factor.io Trello connector gem is used to run actions in Trello through your Factor.io workflow. It was built with the [factor-connector-api](https://github.com/factor-io/connector-api) and [ruby-trello](https://github.com/jeremytregunna/ruby-trello) gems.

##Authentication

First, you must generate an [application key](https://trello.com/1/appKey/generate).

Afterwards, replace your information and particulars in the link below to create an authentication token:<br />
<https://trello.com/1/authorize?key=substitutewithyourapplicationkey&name=My+Application&expiration=1day&response_type=token&scope=read,write>

##Functionality

####Cards
• creating a card<br />
• retrieving card information<br />
• moving a card from one list to another<br />

####Lists
• creating a list<br />
• retreiving list information<br />

####Boards
• creating a board<br />
• retreiving board information<br />

####Members
• retreiving member information<br />
• assigning a member to a card

##Contributing

Documentation, feature requests, code, tests, and bug reports are welcomed.<br />
For more information on conributing check out:<br />
https://github.com/factor-io/factor/wiki/Contribution
