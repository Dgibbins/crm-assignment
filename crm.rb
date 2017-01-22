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
    puts "Please specify what you want to change\n [1]. First name?\n [2]. Last name? \n [3]. Phone number? \n [4]. E-mail?\n [5]. Notes or Comments"
    num = gets.chomp.to_i
      case num
      when 1 then atrb = 'first_name'
      when 2 then atrb = 'last_name'
      when 3 then atrb = 'number'
      when 4 then atrb = 'email'
      when 5 then atrb = 'note'
      end
    puts  "#{atrb} was selected. Change #{atrb} to: "
    new_value = gets.chomp.to_s
    Contact.all.each do |contact|
      if contact.full_name == full_name
        contact.update(atrb, new_value)
      else
        return "Not found within system, please try again!"
      end
      return "\e[H\e[2J"
    end

  end

  def delete_contact
    puts "Please enter the full name of the contact you would like to delete."
    full_name = gets.chomp
    Contact.all.each do |contact|
      if contact.full_name == full_name
        c1 = contact
        c1.delete(full_name)

      else
        return "Contact does not exist"
      end
      return " #{full_name} deleted!"
    end

  end

  def display_all_contacts
    #pull up self.all method in contact.rb and iterate over each contact instance & output them with attributes.
    if Contact.all.empty?    #not working
      return "Contact list is empty =("
    else
      Contact.all.each do |contact|
        puts "#{contact.full_name} \t\t\t phone #: #{contact.number}\t\t\t email:#{contact.email} \t\t\t note:#{contact.note}"
      end
    end

    puts "Press enter to continue"
    enter = gets.chomp
  end

  def search_by_attribute
    puts "How would you like to search through your contacts? [1] First name \n[2] Last name \n[3] Full name \n[4] Email [5] Note [6] Number"
    num = gets.chomp # takes the entered number, enters and compares it to the case.
      case num
      when 1 then atrb = 'first_name' # assign atrb variable to capture method you want to use for later.
        when 2 then atrb = 'last_name'
        when 3 then atrb = 'full_name'
        when 4 then atrb = 'email'
        when 5 then atrb = 'note'
        when 6 then atrb = 'number'
      end
    puts "Enter search query: "
    query = gets.chomp
    Contacts.all.each do |contact|    #Iterate through your array of Contacts and pull out each stored contact instance.
      if contact.atrb  == query
        puts "#{contact}"
      end
    end
  end

end

# puts "\e[H\e[2J"
crm_test= CRM.new("test")
crm_test.main_menu

end
