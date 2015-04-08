require 'csv'


class ContactDatabase 

  class << self

    def initialize
      @contact_list = []
      CSV.readlines('contacts.csv').each do |contact|
        phone_numbers = []
        name = contact[0]
        email = contact[1]
        contact[2..-1].each do |phone|
          parts = phone.split(":")
          type = parts[0]
          digits = parts[1]
          phone_numbers << PhoneNumber.new(type, digits)
        end
      @contact_list << Contact.new(name, email, phone_numbers)
      end
    end

    def check_email(email)
      @contact_list.any? { |contact| contact.email == email}
      # if Contact.email.include? 
      # end
    end

    def save(contact)
      CSV.open('contacts.csv', "ab") do |csv|
        line = []
        line << contact.name
        line << contact.email
        contact.phone_numbers.each do |ph|
          line << "#{ph.type}: #{ph.digits}"
        end
      csv << line
      end
    end

    def contact_id
      @contact_list.size
    end

    def list_all
      @contact_list
    end

    def find_contact_by_id(identifier)
      if identifier > contact_id
        puts "id not found"
      else
        @contact_list[identifier]
      end
    end

    def find_contact_by_name(identifier)
      located_contact = @contact_list.select {|contact| contact.name == identifier}
      located_contact.empty? ? "No match found" : located_contact
    end

  end
  
end
