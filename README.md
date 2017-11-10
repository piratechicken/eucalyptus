# EUCALYPTUS: Indigenous plant marketplace
* Deployed: https://eucalyptus-tree.herokuapp.com/
* Github repository: https://github.com/piratechicken/eucalyptus

## Development process links
* [Figma](https://www.figma.com/file/IeVP5RXZTyjUkfpNRrk79ESD/Indigenous-plants-market)
* [Db designer](http://dbdesigner.net/designer/schema/121956)
* [Trello](https://trello.com/b/2yZED6UZ/indigenous-plant-market)
* Presentation keynote file is in docs directory.

## To launch app locally:
* Git clone or extract the app then run the following commands
* $ bundle install
* $ rails db:create
* $ rails db:migrate
* $ rails db:seed
* $ rails s
* Then open localhost:3000 in your browser.

## Rationale
* While Australian native plants are widely available, it can be difficult to buy plants that are indigenous to a particular area. There are only one or two indigenous nurseries in the Melbourne region. (Councils often do their own cultivation.) 
* There's increasing interest in using indigenous plants in private gardens, especially in areas which still have environmental value.
* Indigenous gardens can encourage native arthropods and birds over introduced species.
* There are many unique plants that are difficult to obtain commercially.

## Naming
The app name, Eucalytus, is a reference to our most iconic Australian genus. It is a name that will be familiar to most people (especially the target audience) and so easy to remember. It is also a cheeky hat tip to the gumtree online marketplace.

## User stories
![User stories created in Trello](/docs/userstories.png)

## Design
The intersection of plant people and computer people is relatively small. Therefore I wanted the interface to be very simple. The main function of the app is to either view listing or to create listings. 

The design colours are intended to evoke Australian nature - the brown of bark and mulching leaves, the deep green of a Eucalyptus leaf.

![Lo-fi wireframes created in Figma](/docs/wireframes.png)

## Entity Relationship Diagram
It is impossible to add all species manually so users are able to add them as necessary. Growth form (herb, grass, tree etc) could have been a simple enum for species. I decided that the app could have potential as an informative resource as the db grows, so scaffolded it for future expansion. 

Note that in the app the singular "specie" is used for species. This is specified in /config/initializers/inflections.rb

![ERD created in dbdesigner](/docs/erd.png)

## Development
Git was used for version controll. Nick Sonner reviewed a pull request for me via Github.

I used a kanban-type process in Trello to manage work flow.

![Trello procces](/docs/agile.png)

## Gems used
* Dotenv for env variables
* Devise for logins
* Geocoder
* Pundit for authorisations
* Foundation css library and jquery
* AWS
* Shrine image uploading (and dependencies)
* Money to format... well, money.
* Stripe for payments
* Mailgun for emails
* Byebug for debugging
* Rubocop for Ruby formatting (many offences remain...)

## Features
* Filterable listings, by radius to your profile location, by species or growth form.
* Support emails
* Email notification when a listing of your is sold
* In app messaging between two users, a (potential) buyer and seller. Conversation is unique to a listing.
* A user's listings are available in their profile page. Can be filtered by current or sold.
* A transactions page that lists your transactions, either sold or bought.
* Dummy images for when a listing or user does not have a picture.

## Priorities for future development
* In app notifications for sold listings and new messages - currently notifications are email only.
* Improve search functionality, by keyword
* A rating system for buyers & sellers. The main advantage here is in flagging "dodgy" users.
* Uncouple user and listing location from profile. Would this make the app more flexible?
* Species list by location

## Lessons learned
* I should plan styles better. The scss content is a bit messy and ad hoc. 
* I used Foundation as a css framework and had some troubles getting everything working in Rails. I should have stuck with a framework I am familiar with for the major project.
* Model names need to be clearly singular and plural. Species is not a good word.
* Don’t do software updates mid-project. 
* Seemingly simple applications are not!