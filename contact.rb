class Contact
  attr_accessor :id, :first_name, :last_name, :email, :notes
	def initialize(fields_hash)
        @first_name = fields_hash[:input_firstname]
        @last_name = fields_hash[:input_lastname]
        @email = fields_hash[:input_email]
        @notes = fields_hash[:input_notes]
	end

  def describe
    puts "\n
          ID = #{@id}\n
          First Name = #{@first_name}\n
          Last Name = #{@last_name}\n
          Email = #{@email}\n
          Notes = #{@notes}\n"
  end



end
