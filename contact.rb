require 'csv'

class Contact
 
  attr_accessor :name, :email

  def initialize(name, email)
    @name = name
    @email = email
    # TODO: assign local variables to instance variables
  end
 
  def to_s
    puts "Contact's name is #{@name} and their email is #{@email}"
    # TODO: return string representation of Contact
  end
 
  ## Class Methods
  class << self

    def create(name, email)
      new_contact = Contact.new(name, email)
      ContactDatabase.save(new_contact.name, new_contact.email)
      puts "Your new contact has the id of #{ContactDatabase.contact_id}"
      # TODO: Will initialize a contact as well as add it to the list of contacts
    end
 
    def find(identifier)
      if CSV.readlines('contacts.csv').each { |raw_contact|  
        if raw_contact.include?(identifier)
          located_contact = Contact.new(raw_contact[0], raw_contact[1])
          puts located_contact
        end
      }
      end

      # TODO: Will find and return contact by index
    end
 
    def all
      ContactDatabase.list_all
      # TODO: Return the list of contacts, as is
    end
    
    def show(id)
      raw_contact = ContactDatabase.find_contact(id)
      located_contact = Contact.new(raw_contact[0], raw_contact[1])
      puts located_contact
      # TODO: Show a contact, based on ID
    end
    
  end

end