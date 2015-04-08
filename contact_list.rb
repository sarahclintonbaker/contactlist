require_relative 'contact'
require_relative 'contact_database'
require_relative 'contact_phonenumber'
# require 'pry'

ContactDatabase.initialize
# puts ContactDatabase.contact_id
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
    puts "What is their email?"
    email = STDIN.gets.chomp.downcase
    while ContactDatabase.check_email(email) == true
      puts "This email address already exists, please try again."
      email = STDIN.gets.chomp.downcase
    end
    puts "What is their name?"
    name = STDIN.gets.chomp.downcase
    puts "Do you want to add a number? y/n"
    add_number = STDIN.gets.chomp.downcase
    phone_numbers = []
    while add_number == 'y'
      puts "What type of number? Skype, home, mobile"
      type = STDIN.gets.chomp.downcase
      puts "Please enter the number:"
      digits = STDIN.gets.chomp.downcase
      phone_numbers << PhoneNumber.new(type, digits)
      puts "Do you want to add another number? y/n"
      add_number = STDIN.gets.chomp.downcase
    end
    Contact.create(name, email, phone_numbers)
  when 'list' 
    Contact.all
  when 'show' 
    Contact.show(identifier.to_i)
  when 'find' 
    Contact.find(identifier)
end

