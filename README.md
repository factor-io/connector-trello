Trello Connector for Factor.io
======================

The Factor.io Trello connector gem is used to run actions in Trello through the command line. It was built with the [factor-connector-api](https://github.com/factor-io/connector-api) and [ruby-trello](https://github.com/jeremytregunna/ruby-trello) gems.

##Authentication

First, you must generate an [application key](https://trello.com/1/appKey/generate).

Afterwards, replace your information and particulars in the link below to create an authentication token:
https://trello.com/1/authorize?key=substitutewithyourapplicationkey&name=My+Application&expiration=1day&response_type=token&scope=read,write

##Functionality

####Cards
• creating a card<br />
• retrieving a card's information<br />
• moving a card from one list to another<br />

####Lists
• creating a list<br />
• retreiving a list's information<br />

####Boards
• creating a board<br />
• retreiving a board's information<br />

####Members
• retreiving a member's information<br />
• assigning a member to a card

##Contribute

Documentation, feature requests, code, tests, and bug reports are welcomed.<br />
For information on conributing check out:
https://github.com/factor-io/factor/wiki/Contribution
