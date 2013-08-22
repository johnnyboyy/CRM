

class Database
  @contacts = []
  @@id = 1

  def self.add_contact
    print "Enter First Name: "
    first_name = gets.chomp
    print "Enter Last Name: "
    last_name = gets.chomp
    print "Enter Email Address: "
    email = gets.chomp
    print "Enter a Note: "
    note = gets.chomp
    contact = Contact.new(first_name, last_name, email, note)

    contact.id = "PERSON " + @@id.to_s
    @contacts << contact
    @@id += 1
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

    puts "new first name?"
    contact_to_modify.first_name = gets.chomp
    puts "new last name?"
    contact_to_modify.last_name = gets.chomp
    puts "new email?"
    contact_to_modify.email = gets.chomp
    puts "new notes?"
    contact_to_modify.notes = gets.chomp
    puts "new id?"
    contact_to_modify.id = gets.chomp
  end

  


end