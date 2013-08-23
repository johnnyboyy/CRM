require "./database"
require "./contact"



class CRM

  def main_menu
	  	self.print_main_menu
  end

  def print_main_menu
	puts "\n\n\n\n\n"
   	puts "Please pick an option:"
	puts
	puts "add contact, delete, modify, display all, display attribute, exit"
	puts
	self.call_option(gets.chomp)
  end

  def call_option(user_input)

	all_ids = Database.contacts.each do |c|
		c.id
	end

  	case user_input
		when "add contact"
			puts "\n\n\n"
		 	Database.add_contact
		when "modify"
			puts "\n\n\n"
			puts 'Please enter the id of the contact you wish to modify.'
			puts "IDs = "

			all_ids.each do |i|
				 puts i.id
			end
			
			id_to_modify = gets.chomp
			if all_ids.select { |i| i.id == id_to_modify} == []
				puts "\n\nInvalid ID\n\n"
			else
				puts 'Is this the correct contact? (YES / NO)'
				
				puts Database.search_by_id(id_to_modify).describe
				decision_for_modify = gets.chomp
				if "YES" == decision_for_modify.upcase
					Database.modify_contact_by_id(id_to_modify)
				else
					puts "Modify has been canceled"
				end
			end
		when "delete"
			puts "\n\n\n"
			puts "please enter the id of the contact you wish to delete"
			puts "IDs = "
			all_ids.each do |i|
			 puts i.id
			end
			id_to_delete = gets.chomp
			if all_ids.select { |i| i.id == id_to_delete} == []
				puts "\n\nInvalid ID\n\n"
			else
				Database.search_by_id(id_to_delete).describe
				puts "Are you sure you want to delete this contact? (YES / NO)"
				decision_for_delete = gets.chomp
				 if "YES" == decision_for_delete.upcase
					Database.delete_contact_by_id(id_to_delete)
					puts "Contact succesfully deleted."
				else
					puts "Delete has been canceled"
				end
			end
		when "display all"
			puts "\n\n\n"
		 	Database.contacts.each do |c|
		      c.describe
		      puts "\n---------------------------------------------"
		    end
		when "display attribute"
			puts "\n\n\n please enter an attribute"
			puts "firstname, \t lastname, \t email, \t notes, \t id"
			puts "\n\n\n"
			atr = gets.chomp.downcase
			puts ""
			Database.contacts.each do |c|
			  case atr
			      when "firstname"
			        puts c.first_name
			      when "lastname"
			        puts c.last_name
			      when "email"
			        puts c.email
			      when "notes"
			        puts c.notes
			      when "id"
			        puts c.id
			      else
			        puts "no attribute matches the name #{atr}"
		      end 
		  	end
		when "exit"
		else
		 	puts "\n\n\n\n\n"
		 	puts "not a valid command\n\n"
	end
	unless user_input == "exit" 	
		self.main_menu
	end
  end
end

Data
CRM.new.main_menu
