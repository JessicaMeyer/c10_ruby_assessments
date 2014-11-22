#C10 second Ruby assessment 

######################################## EXERCISE 1 ###############################################
###################################################################################################   DONE
 
class Pet
  attr_reader :name, :type
  def initialize(name, type)
    @name = name
    @type = type
  end
end
 
buzz = Pet.new("Buzz", "cat")
fido = Pet.new("Fido", "dog")
fudge = Pet.new("Fudge", "cat")
roger = Pet.new("Roger", "dog")
crispy = Pet.new("Crispy", "dog")
 
pet_arr = [buzz, fido, fudge, roger, crispy]
 
#1) 
# print these sentences using pet_arr:
# Buzz is a cat
# Fido is a dog
# etc, etc

pet_arr.each {|animal| puts "#{animal.name} is a #{animal.type}."}

Buzz is a cat.
Fido is a dog.
Fudge is a cat.
Roger is a dog.
Crispy is a dog.
 
#2) 
# create this hash using the pet_arr:
# pet_hash = {
#   "dog" => 3,
#   "cat" => 2
# }

pet_arr.each_with_object(Hash.new(0)) { |animal,counts| counts[animal.type] += 1 }
 => {"cat"=>2, "dog"=>3} 

#or 

count = Hash.new 0

pet_arr.each do |pet|
 count[pet.type] += 1
end
p count

 => {"cat"=>2, "dog"=>3} 

######################################## EXERCISE 2 ############################################### DONE
###################################################################################################

class Person
  
  attr_reader :name, :age
  
  def initialize(name, age)
    @name = name
    @age = age
  end
end

nick = Person.new("Nick", 25)
jim = Person.new("Jim", 37)
bob = Person.new("Bob", 23)
rob = Person.new("Rob", 29)
sue = Person.new("Sue", 31)

peeps = [nick, jim, bob, rob, sue]

# create a hash based on peeps array that looks like this:
# people_ages = {
#   "Nick" => 25,
#   "Jim" => 37,
#   "Bob" => 23,
  # etc...
# }

peoples_ages = Hash[peeps.map { |person| [person.name, person.age] }]

peoples_ages
 => {"Nick"=>25, "Jim"=>37, "Bob"=>23, "Rob"=>29, "Sue"=>31}



######################################## EXERCISE 3 ############################################### DONE
###################################################################################################



win_lose = ["win", "lose", "win", "lose", "win", "win"]

# create a hash based on win_lose array that looks like this:
# win_loss_count = {
#   "win" => 4,
#   "loss" => 2
# }


win_lose.inject(Hash.new(0)) { |type, num| type[num] += 1; type }
=> {"win"=>4, "lose"=>2} 

# or can use .each_with_object 

win_lose.each_with_object(Hash.new(0)) { |word,counts| counts[word] += 1 }
=> {"win"=>4, "lose"=>2} 


######################################## EXERCISE 4 ###############################################
################################################################################################### NOT DONE



class Person
  attr_reader :name, :city, :state, :zip, :hobby
  def initialize(name, hobby, city, state, zip)
    @name = name
    @hobby = hobby
    @city = city
    @state = state
    @zip = zip
  end
    
end
 
jim = Person.new("Jim", "swimming","Dallas", "Texas", 75227)
ray = Person.new("Ray", "jazz","Phoenix", "Arizona", 75217)
bob = Person.new("Bob", "painting","Austin", "Texas", 78750)
joe = Person.new("Joe", "cooking","Waco", "Texas", 76706)
 
peeps = [jim, ray, bob, joe]


peeps_array = peeps.map do |person|
  person = person.name, person.hobby, person.city, person.state, person.zip
end

 => # now just need to turn it into a hash
 [["Jim", "swimming", "Dallas", "Texas", 75227], 
 ["Ray", "jazz", "Phoenix", "Arizona", 75217], 
 ["Bob", "painting", "Austin", "Texas", 78750], 
 ["Joe", "cooking", "Waco", "Texas", 76706]]

 person_hash = Hash[peeps_array.map do |person|
  [person[0], Hash['hobby', person[1], 'address', Hash['city', person[2], 'state', person[3], 'zip', person[4]]]]
end]

person_hash = {
  "Jim"=> {
    "hobby"=>"swimming", 
    "address"=> {
      "city"=>"Dallas", 
      "state"=>"Texas", 
      "zip"=>75227
      }
    }, 
   "Ray"=> {
    "hobby"=>"jazz", 
    "address"=> {
      "city"=>"Phoenix", 
      "state"=>"Arizona", 
      "zip"=>75217
      }
    }, 
    "Bob"=> {
      "hobby"=>"painting", 
      "address"=> {
        "city"=>"Austin", 
        "state"=>"Texas", 
        "zip"=>78750
        }
      }, 
    "Joe"=> {
      "hobby"=>"cooking", 
      "address"=> {
        "city"=>"Waco", 
        "state"=>"Texas", 
        "zip"=>76706
        }
     }
  } 





# surely there is an easier way to do the above problems?



# create:
#
# person_hash = {
#   "Jim" => {
#     "hobby" => "swimming",
#     "address" => {
#       "city" => "Dallas",
#       "state" => "Texas",
#       "zip" => 75227
#     }
#   },
#   "Ray" => {
#     "hobby" => "jazz",
#     "address" => {
#       "city" => "Dallas",
#       "state" => "Texas",
#       "zip" => 75227
#     }
#   },
 
#   # etc, etc
 
# }



 
######################################## EXERCISE 5 ###############################################
################################################################################################### DONE
 
# create an array of ["John Smith", "John Q", "John Ellis", "John Alberts"]

first_name = "John"
last_names = ["Smith", "Q", "Ellis", "Alberts"]

full_names = last_names.collect {|last_name| "#{first_name} #{last_name}"}
 
 => ["John Smith", "John Q", "John Ellis", "John Alberts"]

 

######################################## EXERCISE 6 ###############################################
################################################################################################### DONE

# Use an each loop on the outer array and print out the information about them
# For example, you might print 'Bob is a builder'
 
my_friends = [
    {
        :name => "Bob",
        :occupation => "Builder"
    },
    {
        :name => "Dora",
        :occupation => "Explorer"
    },
    {
        :name => "Mandy",
        :occupation => "Handy(wo)man"
    },
]
 
# answer here

my_friends.each {|person| puts "#{person[:name]} is a #{person[:occupation]}."}

Bob is a Builder.
Dora is a Explorer.
Mandy is a Handy(wo)man.
 
######################################## EXERCISE 7 ############################################### DONE
###################################################################################################
 
# Iterate through the array of the Smith family members and add the last name to each person. 
# The array should look like this at the end: `["John Smith", "Jane Smith", "Jacob Smith"]`
 
smith_family = ["John", "Jane", "Jacob"]
last_name = "Smith"
 
# answer here

full_names = smith_family.collect {|first_name| "#{first_name} #{last_name}"}
=> ["John Smith", "Jane Smith", "Jacob Smith"] 



######################################## EXERCISE 8 ###############################################
################################################################################################### DONE

# First look at this code and then complete the exercises that follow
 
class Pet
  attr_accessor :age, :name, :type
  
  def initialize(type, name, age)
    @type = type
    @name = name
    @age = age
  end
end
 
marlo = Pet.new('dog', 'Marlo', 3)
boots = Pet.new('cat', 'Boots', 5)
goldy = Pet.new('gold fish', 'Goldy', 1)
 
pet_array = [marlo, boots, goldy]
 
# using pet_array, create an array of just the pet names: ["Marlo", "Boots", "Goldy"]. Try it using the method 'map'
# write the answer here

pet_array.map {|pet| pet.name}
 => ["Marlo", "Boots", "Goldy"]
 
# using pet_array, go through pet_array and increments each pet's age by 1
# write the answer here

pet_array.each {|pet| puts "#{pet.name} is now #{pet.age += 1} years old."}


Marlo is now 4 years old.
Boots is now 6 years old.
Goldy is now 2 years old.
 
# using pet_array, select the pet with the name 'Boots'. Try doing this with the 'select' and 'find' method. 
# write the answer here

pet_array.select {|pet| pet.name == "Boots" }
pet_array.find {|pet| pet.name == "Boots"}

# => [<Pet:0x00000102096fc0 @name="Boots", @type="cat", @age=6>]

# using pet_array, select the pets with age greater than 1. Try doing this with the 'select' and 'find' method.
# write the answer here

pet_array.select.map {|pet| pet.name if pet.age >= 1}

=> ["Marlo", "Boots", "Goldy"]

# what is the difference between the methods 'select' and 'find'? 
# write the answer here

# .find returns the first one that evaluates to true or returns nil (.find is alias for .detect)

pet_array.find {|pet| pet.name if pet.age >= 1}
 => #<Pet:0x000001020b24f0 @name="Marlo", @type="dog", @age=4> 

# .select returns all elements that evaluate true to the conditional

pet_array.select {|pet| pet.name if pet.age >= 1}
 => #<Pet:0x000001020b24f0 @name="Marlo", @type="dog", @age=4>, #<Pet:0x00000102096fc0 @name="Boots", @type="cat", @age=6>, 
 #<Pet:0x0000010201e1d8 @name="Goldy", @type="gold fish", @age=2>] 

 
######################################## EXERCISE 9 ############################################### DONE
###################################################################################################

#1)

# what is the value of x in each of the following expressions?

x = nil && "hello world"  

# both sides of the && must be true in order to run. nil is not true, so returns nil.

=> nil

#2) 

x = "goodbye" && "hello world" 

=> "hello world"

# both are true so last evaluated expression

# 3) 

x = "goat" || "cat" 

=> "goat"

# the first expression to evaluate to true is run 

#4) 

x = nil || "eureka"

=> "eureka"

# nil is false, so the expression on the other side of the or is run. 



