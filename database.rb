require './contact'

class Database
  @contacts = []
  @@id = 1

  def self.add_contact
    
    contact = Contact.new(self.get_fields)

    contact.id = "PERSON " + @@id.to_s
    puts contact.id
    @contacts << contact
    @@id += 1
  end

  def self.get_fields(*optional_id)

    print "Enter First Name: "
    first_name = gets.chomp
    print "Enter Last Name: "
    last_name = gets.chomp
    print "Enter Email Address: "
    email = gets.chomp
    print "Enter a Note: "
    notes = gets.chomp

    fields = {input_firstname: first_name,
              input_lastname: last_name,
              input_email: email,
              input_notes: notes
             }

      if optional_id == true
        puts "Enter ID:"
        id = gets.chomp
        id_hash = {new_id: id }

        fields.merge(id_hash)
      end
    return fields
  end

  def self.contacts
    @contacts
  end

  def self.delete_contact_by_id(id)
    if self.contacts.length == 0
      puts "ERROR no contacts in databse"
    else
      @contacts.delete_if { |c| id == c.id }
    end
    self.contacts
  end

  def self.search_by_id(search_id)
    contact = @contacts.each do |c|
      if c.id == search_id
        return c
      end
    end
  end

  def self.display_attribute(atr)
    # @contacts.each do |c|
      # case atr
      # when "firstname"
      #   return c.first_name
      # when "lastname"
      #   return c.last_name
      # when "email"
      #   return c.email
      # when "notes"
      #   return c.notes
      # when "id"
      #   return c.id
      # else
      #   puts "no attribute matches the name #{atr}"
      # end 
    # end
  end

  def self.modify_contact_by_id(id)
    contact_to_modify = search_by_id(id)

    need_id = true
    new_fields = self.get_fields(need_id)
    contact_to_modify

    contact_to_modify.first_name = new_fields[:input_firstname]
    contact_to_modify.last_name = new_fields[:input_lastname]
    contact_to_modify.email = new_fields[:input_email]
    contact_to_modify.notes = new_fields[:input_notes]
  end

end