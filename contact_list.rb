require_relative 'contact'
require_relative 'contact_database'
require 'pry'

command = ARGV[0]
identifier = ARGV[1]

prompt = '> '

case command
  when 'help'
    puts " Here is a list of available commands:
      new  - Create a new contact
      list - List all contacts
      show - Show a contact
      find - Find a contact"
  when 'new'  
    puts "What is their name?"
    name = STDIN.gets.chomp.downcase
    puts "What is their email?"
    email = STDIN.gets.chomp.downcase
    Contact.create(name, email)
  when 'list' 
    Contact.all
  when 'show' 
    Contact.show(identifier.to_i)
  when 'find' 
    Contact.find(identifier)
end

