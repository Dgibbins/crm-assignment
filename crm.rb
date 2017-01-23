require_relative 'contact'

class CRM

attr_reader :add_new_contact, :modify_existing_contact, :delete_contact, :display_all_contacts, :search_by_attribute
  def initialize(name)
    @name = name
  end

  def main_menu
    puts "\e[H\e[2J"
    while true #repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '

  end

  def call_option(user_selected)
    puts "\e[H\e[2J"
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then abort("Adios muchachos!")
  end

  def add_new_contact
    puts "Please enter the contact's first_name: "
    first_name = gets.chomp.to_s
    puts "Please enter the contact's last_name: "
    last_name = gets.chomp.to_s
    puts "Please enter the contact's phone number: "
    number = gets.chomp.to_s
    puts "Please enter the contact's email address: "
    email = gets.chomp.to_s
    puts "Please enter any comments or notes: "
    note = gets.chomp.to_s
    puts "Sucessfully created #{first_name} #{last_name}!!!"
    waiting_to_continute = gets.chomp
    puts "\e[H\e[2J"

    Contact.create(first_name, last_name, number, email, note)


  end

  def modify_existing_contact
    puts "Please enter the full name of the contact you wish to update: "
    full_name = gets.chomp.to_s
    puts "Please specify what you want to change\n [1]. First name?\n [2]. Last name? \n [3]. Full name? \n [4]. E-mail?\n [5]. Notes or Comments\n [6] Phone Number"
    num = gets.chomp.to_i
      case num
      when 1 then atrb = 'first_name'
      when 2 then atrb = 'last_name'
      when 3 then atrb = 'full_name'
      when 4 then atrb = 'email'
      when 5 then atrb = 'note'
      when 6 then atrb = 'number'
      end
    puts  "#{atrb} was selected. Change #{atrb} to: "
    new_value = gets.chomp.to_s
    Contact.all.find do |contact| contact.full_name == full_name
        Contact.find(full_name).update(atrb, new_value)
    end
      return "\e[H\e[2J"


  end

  def delete_contact
    puts "Please enter the full name of the contact you would like to delete."
    full_name = gets.chomp

      Contact.all.find do |contact| contact.full_name == full_name
        puts "Are you sure you want to delete #{contact.full_name} (y/n): "
        answer = gets.chomp.downcase
        if answer == 'y'
          Contact.find(full_name).delete
          puts "\e[H\e[2J"
          puts "Contact Deleted!!!"
          user_prompt=gets.chomp
          puts "\e[H\e[2J"
        else
          puts "\e[H\e[2J"
          puts "Contact not deleted!"
          user_prompt=gets.chomp
          puts "\e[H\e[2J"
        end
      end
      # puts "Contact Deleted!"
  end

  def display_all_contacts
    #pull up self.all method in contact.rb and iterate over each contact instance & output them with attributes.
    i=1
    if Contact.all.empty?    #not working
      puts "Contact list is empty =("
    else
      Contact.all.each do |contact|
        puts "[#{i}] #{contact.full_name}  phone #: #{contact.number} email:#{contact.email}  note:#{contact.note}"
        i+=1
      end
    end

    puts "Press enter to continue"
    enter = gets.chomp
  end



  def search_by_attribute #can't get #send method to work with #case atrb1 obj.
    puts "How would you like to search through your contacts?\n[1] First name \n[2] Last name \n[3] Full name \n[4] Email \n[5] Note \n[6] Number"
    num = gets.chomp.to_i
      case num    #this does not work with #send(string) function on line 139
      when 1 then atrb1 = 'first_name' # assign atrb variable to capture method you want to use for later.
      when 2 then atrb1 = 'last_name'
      when 3 then atrb1 = 'full_name'
      when 4 then atrb1 = 'email'
      when 5 then atrb1 = 'note'
      when 6 then atrb1 = 'number'
      end

    puts "Enter search term: "
    search_term=gets.chomp
    arr_list = []                   #Create an empty array to populate matching queries.
    Contact.all.each do |contact|
      if contact.send(atrb1) == search_term
        arr_list << contact
      end
    end
    arr_list.each do |found|
      puts "\n #{found.full_name}, #{found.email}, #{found.note}, #{found.number}\n"
      20.times {print "-"}
      puts "\n"
      x=gets.chomp
      puts "\e[H\e[2J"
    end
  end

end

# puts "\e[H\e[2J"
crm_test= CRM.new("test")
crm_test.main_menu
end
