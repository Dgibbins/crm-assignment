#
# c1=Contact.create("Ryan","Anderson",9671111,"hotmail","hey")
#  c2=Contact.create("Tara","Anderson",9671111,"gmail","bye")
# c3=Contact.create("Leya","Anderson",9671111,"yahoo","nomnom")
class Contact

  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note, :update, :number

  @@contacts =[]  #Sets an empty array of contacts to fill
  @@id = 1        #Creates a unique ID for each contact created via class create method.

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, number, email, note)
    # 1. Create a new contact using class method #self.create(args)
    new_contact = Contact.new(first_name, last_name, number, email, note)
    # 2. Push newly created contact into @@contacts list class variable.
    @@contacts << new_contact
    # 3. Increment unique ID by 1.
    @@id +=1
    # 4. Return the newly created contact within cmd line.
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    #1. Displays all contacts stored within class variable @@contacts.
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.each do |contact|
      if id == contact.id
         "#{contact.first_name} #{contact.last_name}"
      end
    end
  end
  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(atrb, value)
    arr= []
    @@contacts.each do |contact|
      if contact.send(atrb) == value
         arr << contact
      end
    end
      if arr.empty?
        return "Error: Contact does not exist. Please try again."
      else
        return arr
      end
  end



  # def self.find_by(atrb, value)
  #
  #   @@contacts.each do |contact|
  #     if atrb == 'first_name'
  #       if value == contact.first_name
  #         return contact.first_name
  #       end
  #     end
  #     if atrb == 'last_name'
  #       if value == contact.last_name
  #         return contact.last_name
  #       end
  #     end
  #     if atrb == 'email'
  #       if value == contact.email
  #         return contact.email
  #       end
  #     end
  #     if atrb == 'note'
  #       if value == contact.note
  #         return contact.note
  #       end
  #     end
  #   end
  # end

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, number, email, note)
    @first_name = first_name
    @last_name = last_name
    @number = number
    @email = email
    @note = note
    @id = @@id
  end



  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  def update(atrb,new_value)
  # and then make the appropriate change to the contact
  # 2. the new value for that attribute
    @@contacts.each do |contact|
      if atrb == 'first_name'
        return contact.first_name = new_value
      elsif atrb == 'last_name'
        return contact.last_name = new_value
      elsif atrb == 'number'
        return contact.number = new_value
      elsif atrb == 'email'
        return contact.email = new_value
      elsif atrb == 'note'
        return contact.note = new_value
      else
        return "Try again!"
      end
    end

  end


  # This method should delete all of the contacts
  def self.delete_all
    unless @@contacts.empty?
      @@contacts.delete_if {|contact| contact != nil }
    else
      return "There are no contacts to delete!"
    end
    # return "Can the Pope's dick fit through a donut hole Morty?"
  end

  def full_name

    return "#{first_name} #{last_name}"

  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete(obj)
    @@contacts.delete_if {|contact| contact.full_name == obj}

  end

  # Feel free to add other methods here, if you need them.

end
