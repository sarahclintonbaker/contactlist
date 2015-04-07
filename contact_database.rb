## TODO: Implement CSV reading/writing
require 'csv'

class ContactDatabase 

  class << self

    def save(name, email)
      CSV.open('contacts.csv', "ab") do |csv|
        csv << [name, email]
      end
    end

    def contact_id
      CSV.readlines('contacts.csv').size
    end

    def list_all
      CSV.readlines('contacts.csv').each_with_index do |contact, index|
        puts "#{index}: #{contact[0]} (#{contact[1]})"
      end
    end

    def find_contact(id)
      if id > contact_id
        puts "id not found"
      else
        CSV.readlines('contacts.csv')[id]
      end
    end

  end
  
end