c1=Contact.create("Ryan","Anderson","hotmail","hey")
 c2=Contact.create("Tara","Anderson","gmail","bye")
c3=Contact.create("Leya","Anderson","yahoo","nomnom")
class Contact

  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note

  @@contacts =[]  #Sets an empty array of contacts to fill
  @@id = 1        #Creates a unique ID for each contact created via class create method.

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    # 1. Create a new contact using class method #self.create(args)
    new_contact = Contact.new(first_name, last_name, email, note)
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
        return "#{contact.first_name} #{contact.last_name}"
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
    return arr
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
  def initialize(first_name, last_name, email, note)

    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
  end



  def update
  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact


  end


  # This method should delete all of the contacts
  def self.delete_all

  end

  def full_name

  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete

  end

  # Feel free to add other methods here, if you need them.

end
