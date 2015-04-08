class Contact
 
  attr_accessor :name, :email, :phone_numbers

  def initialize(name, email, phone_numbers)
    @name = name
    @email = email
    @phone_numbers = phone_numbers
  end
 
  def to_s
    message = "Contact's name is #{@name}, their email is #{@email} and they have #{phone_numbers.size} phone numbers:\n"
    phone_numbers.each { |phone| message << phone.to_s + "\n" }
    message
  end
 

  class << self

    def create(name, email, phone_numbers=[])
      new_contact = Contact.new(name, email, phone_numbers)
      ContactDatabase.save(new_contact)
      puts "Your new contact has the id of #{ContactDatabase.contact_id}"
    end
 
    def find(identifier)
      puts ContactDatabase.find_contact_by_name(identifier)
    end
 
    def all
      puts ContactDatabase.list_all
    end
    
    def show(identifier)
      puts ContactDatabase.find_contact_by_id(identifier)
    end
    
  end

end