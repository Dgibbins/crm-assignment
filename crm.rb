require_relative 'contact'

class CRM

  def initialize(name)
    @name = name
  end

  def main_menu
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
    first_name = gets.chomp
    puts "Please enter the contact's last_name: "
    last_name = gets.chomp
    puts "Please enter the contact's phone number: "
    number = gets.chomp    
    puts "Please enter the contact's email address: "
    email = gets.chomp
    puts "Please enter any comments or notes: "
    note = gets.chomp

  end

  def modify_existing_contact

  end

  def delete_contact

  end

  def display_all_contacts

  end

  def search_by_attribute

  end


end


crm_test= CRM.new
crm_test.main_menu
