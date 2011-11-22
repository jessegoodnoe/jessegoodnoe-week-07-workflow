Resources
=========
Books
-----
* Rails Test Prescriptions
* RSpec book
* Rails 3 In Action

Sites
-----
* http://confreaks.net/events

YAML
====
http://yaml.org/YAML_for_ruby.html

Simple use:

* start irb
* require 'yaml'

OpenStruct.new(some_hash) is a good way to turn a hash into an object.

It's included with Ruby.

JSON
====
require 'json'

JSON.parse(something)

XML
===
HappyMapper
UnHappyMapper
Nokogiri-HappyMapper

class Address
 include HappyMapper

	tag 'address'
	has_many :streets, String
	element :city, String
	element :country 'Country'
	
end