class Contact
  attr_accessor :id, :first_name, :last_name, :email, :notes
	def initialize(first_name, last_name, email, notes = "")
		@first_name = first_name
		@last_name = last_name
		@email = email
		@notes = notes
	end

  # def self.modify_first_name
  #   puts "new first name:"
  #   new_first_name = gets.chomp
  #   @first_name = new_first_name.to_s
  # end

  # def self.modify_first_name
  #   puts "new last name:"
  #   new_last_name = gets.chomp
  #   @last_name = new_last_name.to_s
  # end

  # def self.modify_email(new_email)
  #   @email = new_email.to_s
  # end

  # def self.modify_notes(new_notes)
  #   @notes = new_notes.to_s
  # end

  def describe
    puts "\n
          ID = #{@id}\n
          First Name = #{@first_name}\n
          Last Name = #{@last_name}\n
          Email = #{@email}\n
          Notes = #{@notes}\n"
  end



end