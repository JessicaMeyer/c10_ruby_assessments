# Redo c1 heroku app ruby section here

#  Portions of the MKS Heroku Ruby App

############# ARRAYS #############


# In irb, create an array of items you would sell at a garage sale.

garage_items = ["computer", "black backpack", "tv stand", "office chair"]

# Call the second item in the array using the array[index] syntax.

garage_items[1]
 => "black backpack" 

# Update the last item to 'rolling desk chair'.

garage_items[-1] = "rolling desk chair"
=> ["computer", "black backpack", "tv stand", "rolling desk chair"] 

# Delete the 'tv stand' item.

garage_items.delete_at(2)
=> "tv stand"

# Add a 'couch' item between 'computer' and 'black backpack'.

garage_items.insert(1, "couch")
 => ["computer", "couch", "black backpack", "office chair"] 

# Add two more items to the end: 'table' and 'blender'.

garage_items.push("table", "blender")
 => ["computer", "couch", "black backpack", "office chair", "table", "blender"]


#Using the altered array from the above directions, The following code might not work correctly in its current state. 
# Can you figure out the bug?


garage_items = ["computer", "couch", "black backpack", "rolling desk chair", "table", "blender"]

garage_items.sort
 => ["black backpack", "blender", "computer", "couch", "office chair", "table"] # sorts in alphabetical order but doesn't save sorted format.

sorted_garage_items = garage_items
=> ["computer", "couch", "black backpack", "office chair", "table", "blender"] # new var saved to original array, not sorted one. if want new array use .sort!

puts "sorted garage items"
=> "sorted garage items"

puts sorted_garage_items
=> ["computer", "couch", "black backpack", "office chair", "table", "blender"] 

 
# Create a new variable that is an array of garage_items in alphabetical order. 
# Print it, and make sure that it works.

garage_items = ["computer", "couch", "black backpack", "rolling desk chair", "table", "blender"]

alphabetical_garage = garage_items.sort!
=> ["black backpack", "blender", "computer", "couch", "office chair", "table"]

# Create a new variable that is an array of garage_items in reverse order. Print it and make sure it works.

reversed_garage = garage_items.reverse
=> ["table", "office chair", "couch", "computer", "blender", "black backpack"]

# Create a new array called garage_items_capitalized that takes the garage_items array and capitalizes the first letter in each word.
garage_items = ["computer", "couch", "black backpack", "rolling desk chair", "table", "blender"]

garage_items_capitalized = garage_items.map { |item| item.capitalize }
 => ["Computer", "Couch", "Black backpack", "Rolling desk chair", "Table", "Blender"] 

# Why doesn't it capitalize backpack, desk or chair?

# Print an ordered list of the garage_items_capitalized items (you will likely need to use a method called each). 
# Here's how your output shold be formatted:
# 1. Computer
# 2. Couch
# 3. Black backpack
# [...]
# 6. Blender

counter = 0
garage_items_capitalized.each do |item|
	puts "#{counter += 1}. #{item}"
end

1. Computer
2. Couch
3. Black backpack
4. Rolling desk chair
5. Table
6. Blender

# Try to create the ordered list again while taking advantage of .each_with_index do |value, index|
# used .map.with_index like mentioned in forum 

garage_items_capitalized.map.with_index do |item, index|
	puts "#{index += 1}. #{item}"
end

1. Computer
2. Couch
3. Black backpack
4. Rolling desk chair
5. Table
6. Blender


# Iterate through the array of the Smith family members using each and add the last name to each person. 
# The array should look like this at the end: ["John Smith", "Jane Smith", "Jacob Smith"]

smith_family = ["John", "Jane", "Jacob"]
last_name = "Smith"

smith_family.collect {|first_name| "#{first_name} #{last_name}"}
 => ["John Smith", "Jane Smith", "Jacob Smith"] 

############# HASHES #############

# TODO: Create a new empty hash

hash = {}
or
hash = Hash.new

# TODO: Create a hash with a symbol as a key and a string as a value

hash = {:name => "Jessica"}

# TODO: Did you know that hashes can accept anything as a key and anything
# as a value? Try atleast 5 different combinations of key/values
# using different data types. Example: hash = {4.5 => :my_symbol}

hash = {:name => "Jessica", "Steve" => :person, [1, 3, 4], 4.5 => :my_symbol}

# TODO: Start with an empty hash and insert a new key/value pair into
# the hash using hash[<key>] = <value>

hash = {}
hash[:name] = "Jessica"
hash[:age] = 31
 => {:name=>"Jessica", :age=>31} 

# TODO: Use the merge method to put together the 2 given hashes into another variable

hash1 = {"XBox" => "Microsoft", "PS" => "Sony"}
hash2 = {"Macbook" => "Apple", "Windows 8" => "Microsoft"}


combined_hash = hash1.merge(hash2)
 => {"XBox"=>"Microsoft", "PS"=>"Sony", "Macbook"=>"Apple", "Windows 8"=>"Microsoft"} 

# TODO: Use the merge! method to put together the 2 given hashes into hash1
# Question: What's the difference between 'merge' and 'merge!'' ?

merge! mutates the original hash 

hash1 = {"XBox" => "Microsoft", "PS" => "Sony"}
hash2 = {"Macbook" => "Apple", "Windows 8" => "Microsoft"}

hash1.merge!(hash2)
hash1
 => {"XBox"=>"Microsoft", "PS"=>"Sony", "Macbook"=>"Apple", "Windows 8"=>"Microsoft"}

# TODO: Run the each_pair loop with the hash that results from the previous exercise.
# Look up documentation on how to use each_pair on ruby-doc.org

hash1.each_pair {|item, index| puts "#{item} is made by #{index}."}

XBox is made by Microsoft.
PS is made by Sony.
Macbook is made by Apple.
Windows 8 is made by Microsoft.

# TODO: Print each of the values in the hash. Use the keys (you don't need to use a loop)

hash = {"name" => "bob", :job => "builder", 21 => "current_age"}
hash.values
=> ["bob", "builder", "current_age"] 

# TODO: Print each of the values in the hash. Use the keys (don't use loops)

hash = {
    "name" => {
        :first => "Louis",
        :last => "The Thirteenth"
    },
    "father" => {
        "name" => {
            :first => "Louis",
            :last => "The Twelvth"
        },
        "father" => {
            "name" => {
                :first => "Louis",
                :last => "The Eleventh"
            },
            "father" => "You've gotta be kidding me!"
        }
    }
}

hash["name"].values  # => ["Louis", "The Thirteenth"] 
hash["father"]["name"].values  # => ["Louis", "The Twelvth"]
hash["father"]["father"]["name"].values # => ["Louis", "The Eleventh"] 
hash["father"]["father"]["father"] #  => "You've gotta be kidding me!"

# TODO: Use an each loop on the outter array and print out the information about each
# of my friends.

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


my_friends.each {|person| puts "#{person[:name]} is a #{person[:occupation]}"}

Bob is a Builder
Dora is a Explorer
Mandy is a Handy(wo)man

# We want to bring back the concept of the garage sale. 
# Create an array called garage_inventory:

garage_inventory = []

# Each item in the array should be a hash representing an item in your inventory.
# Each hash should include three keys: name, price, and quantity.
# Example: garage_inventory << {name: 'computer', price: '100.00', quantity: 1}

garage_inventory = [
	{:name => "computer", :price => 100, :quantity => 1},
	{:name => "desk", :price => 400, :quantity => 1},
	{:name => "chair", :price => 50, :quantity => 2},
	{:name => "table", :price => 1000, :quantity => 1}
]

# Using the array, print out a list of each item with their price and quantity available using each.

garage_inventory.each do |item|
	puts "There is a #{item[:name]} listed at $#{item[:price]}. Quantity left: #{item[:quantity]}."
end

There is a computer listed at $100. Quantity left: 1.
There is a desk listed at $400. Quantity left: 1.
There is a chair listed at $50. Quantity left: 2.
There is a table listed at $1000. Quantity left: 1.
	

# Print out the number of types of items you have using count.
garage_inventory.count
=> 4


# Print the total value of each item on stock: price * quantity.

garage_inventory.each do |item| 
	value = item[:price].to_f * item[:quantity]
	puts "The total value of #{item[:name]}s inventory is #{value}."
end

The total value of computers inventory is 100.0.
The total value of desks inventory is 400.0.
The total value of chairs inventory is 100.0.
The total value of tables inventory is 1000.0.

# Print out the total value of inventory: all the items quantity * their prices, respectively.

total_amount = garage_inventory.collect do |item|
	value = item[:price].to_f * item[:quantity]
end
puts "The total value of inventory is: $#{total_amount.inject(0,:+)}"

=> "The total value of inventory is: $1600.0"


######### IF STATEMENTS ##########

#1) 

# Input is_friend is a boolean with value true or false
# TODO: return "yes" if the user is a friend, otherwise return "no"

def can_i_access_your_profile(is_friend)
   
   if is_friend == true
   	return "yes"
   else 
   	return "no"
   end
end

# OR shorthand syntax

def can_i_access_your_profile(is_friend)
	is_friend ? "yes" : "no"
end

#2)

 # Input is_friend is a boolean
 # Input my_city and their_city are strings
 # TODO: return "yes" if they are your friend
 # return "maybe" if they live in the same city as you
 # otherwise return "no"

def can_i_access_your_profile(is_friend, my_city, their_city)
	if is_friend == true
		return "yes"
	elsif my_city == their_city
		return "maybe"
	else 
		return "no"
	end
   end


#3) 
 # Input is_friend is a boolean
    # Input my_city and their_city are strings
    # TODO: return "yes" if they are your friend
    # return "HELL YEAH" if they go to school at "MakerSquare"
    # return "maybe" if they live in the same city as you
    # otherwise return "no"

    # Question: How would this differ if you changed the order of checking the school
    # and checking the city?

def can_i_access_your_profile(is_friend, my_city, their_city, their_school)
   if is_friend == true
   	return "yes"
   elsif their_school == "MakerSquare"
   	return "HELL YEAH"
   elsif my_city == their_city
   	return "maybe"
   else
   	return "no"
   end
end

#4) 
# TODO: Return true is they are a friend
    # If they live in the same city as you and go to MakerSquare, return "YES"
    # If they live in the same city and don't go to MakerSquare, return "Mehh"
    # Otherwise return "Naw"
    # Make sure to nest if statements!

def can_i_access_your_profile(is_friend, my_city, their_city, their_school)
    if is_friend == true
    	return true
    elsif my_city == their_city && their_school == "MakerSquare"
    	return "YES"
    elsif my_city == their_city && their_school != "MakerSquare"
    	return "Mehh"
    else 
    	return "Naw"
    end
end

#5) some random example 

def drink_test(age, sex)
    if age >= 21
        response = "You can drink"
    elsif age > 18 or sex == "female"
        response = "You can probably drink with fake id"
    else
        response = "You can't drink"
    end
    return response
end


#6) 
# TODO: perform the operator on num1 and num2
# Example: calculator('*', 5, 6) should return 30

def calculator_1(operator, num1, num2)
    outcome = num1.send(operator, num2)
end    
calculator_1('*', 5, 6)
 => 30 


#7) 
 # TODO: return whether or not the movie given is being played

def is_movie_available_1(name)
    movies = ["Thor", "Captain America", "Hulk", "Iron Man"]
    movies.include?(name) ? "yes it's playing" : "no it's not playing"
end

is_movie_available_1("Thor")
# => "yes it's playing" 
is_movie_available_1("Anchorman")
# => "no it's not playing"


#8) 
# TODO: return true if the movie is being played and if it starts at the time given

def is_movie_available_2(name, time)
    movie_timings = {
        "Thor" => [100, 400, 600, 1200, 1400, 1830],
        "Captain America" => [400, 845, 1115, 1430, 1940, 2130, 2300],
        "Hulk" => [ 1200, 1500, 1830, 2200],
        "Iron Man" => [1315, 1645]
    }

if movie_timings[name].include?(time)
        return true
    else
        puts "Sorry, your movie is not playing then"
    end
end


#9)
 # TODO: Return the first movie timing that the user can go to for the given movie name


def is_movie_available_3(name, time)

    movie_timings = {
        "Thor" => [100, 400, 600, 1200, 1400, 1830],
        "Captain America" => [400, 845, 1115, 1430, 1940, 2130, 2300],
        "Hulk" => [ 1200, 1500, 1830, 2200],
        "Iron Man" => [1315, 1645]
    }

    if movie_timings[name].include?(time)
        return "The first movie available is at #{movie_timings[name][0]}" 
    end
end

is_movie_available_3("Thor", 400)
 => "The first movie available is at 100"

########### Extensions ###########

#1) 
# TODO: Return a dictionary of movies being played mapped to a list of movie timings
# that the user can go to
# Only add the move as a key if a proper timing is available

def is_movie_available_4(time)
    
    movie_timings = {
        "Thor" => [100, 400, 600, 1200, 1400, 1830],
        "Captain America" => [400, 845, 1115, 1430, 1940, 2130, 2300],
        "Hulk" => [ 1200, 1500, 1830, 2200],
        "Iron Man" => [1315, 1645]
    }
    movies = {}
   
    movie_timings.select do |movie|
		 if movie_timings.include?(time)
		 	movies[movie] = time
		 end
    	return movies
 		end
	end
end

# still getting an empty hash -- need to finish this one

#2) 
# TODO: perform operation on every number in list given
# Example: calculator_2("*", 2, 3, 4) should return  24 (2*3*4)


def calculator_2(operator, *nums)
   nums.send(operator)
end

########### WHILE LOOPS ###########

#1) 
# TODO:
    # 1) Ask User for password
    # 2) Get an input from the user for password
    # 3) while the user's input is incorrect, print an error message and ask for it again

def quiz
    puts "Who is the coolest person in the world"
    answer = gets.chomp
    while answer != "Shehzan"
        puts "You're wrong"
        answer = gets.chomp
    end
    puts "You're right"
end
def log_in
    password_saved = "Shehzan_is_awesome"
    
end

#2) 
# TODO: until the password is greater than 8 characters, ask the user
# to input another password

def sign_up
    puts "What's your username"
    username = gets.chomp
    puts "What's your password"
    password = gets.chomp
    
end

#3) 
# TODO: until the password is greater than 8 characters and the password
# matches with the password_confirmation, ask the user to re-input values

def sign_up
    puts "What's your username"
    username = gets.chomp
    puts "What's your password"
    password = gets.chomp
    puts "Confirm the password"
    password_confirmation = gets.chomp
    
end

#4) 
 # TODO:
 # 1) Have the user guess the random number
 # 2) Print whether or not the user guessed the number right

def guess_number_1
    random_number = rand(100) # rand gives random number between 0 and x-1
    puts "Guess a number any number"
end


#5) 
# TODO: Allow the user to continuously guess until he/she gets it right

def guess_number_2
    random_number = rand(100) # rand gives random number between 0 and x-1
    puts "Guess a number any number"
end


########## Extensions #############

42
def guess_number_3
    random_number = rand(100) # rand gives random number between 0 and x-1
    # TODO: Same as guess_number_2 but tell the user how many times they tried
end
def guess_number_4
    random_number = rand(100) # rand gives random number between 0 and x-1
    puts "Guess a number any number"
    # TODO: Same as guess_number_3 but tell the user whether the real number is higher or lower
end
43
def guess_number_5
    random_number = rand(100) # rand gives random number between 0 and x-1
    puts "Guess a number any number"
    # TODO: Same as guess_number_3 but tell the user whether they are getting warmer or colder
    # (For the first guess you don't tell them warmer or coler)
    # HINT: use the "abs" method for absolute value. Example -5.abs returns 5
end
TIMES METHOD

44
def nag(sentence)
    10.times do |i|
        puts i.to_s + " " + sentence
    end
end
Exercises

45
def countdown(count)
    # print out numbers from count to 0
end
46
def countup(count)
    # opposite of countdown
end
47
def fizz
    # During countdown, multiples of 3 are replaced with fizz
end









