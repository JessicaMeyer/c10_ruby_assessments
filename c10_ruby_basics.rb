# Ruby C10 first assessment

# What is the output of the following expression.
 
if !"nick"
  puts "He's a cool guy!"
end

# warning: string literal in condition
# => nil

# From Stack Overflow:
# You have to specify the full condition on both sides of the or.


##############################################################

# What is the value of x?

def check_truth?(statement)
  if statement == nil
   "Neither exactly true nor false"
  elsif statement == true
   "It's true!"
  else
   "I admit, tis' false."
  end
end

x = check_truth?("Ruby is awesome!") 

#=> ANSWER HERE  
#  => "I admit, tis false"

# if statement - nil is not true so the first conditional will not run. 
# elsif statement - the statement entered in test code is not the word 'true'
# so else runs

##############################################################  

****** re-evaluate answer ******

# What is the value of x?

def consume_arr(y)
 y.each { |elem| puts (elem * 2) }
end

x = consume_arr([2,4,6])

4
8
12
=> [2, 4, 6]

# x => [2, 4, 6] 
 
##############################################################
 
 
# The following 3 lines of code have errors. Please correct them.
# You can change them in place.
 
var_name = "Nick McDonnough"
pop_punk = "Blink" + 182.to_s
7.0 / 2 == 3.5   # there are multiple acceptable answers for this one.
 
##############################################################
 
# What is the output of the following code 
 
def recursion(x)
  return "HEYO!" if x >= 5
  puts x
  recursion x += 1
end
 
recursion(0)   #=> ANSWER HERE
0
1
2
3
4
 => "Heyo!" 
 
recursion(6)   #=> ANSWER HERE 
=> "HEYO!"

# If x is greater than or equal to 5, put "HEYO!"
# If not then puts value of x and increment by 1 until you reach 5, then "HEYO!"
 
##############################################################
 
# Given the following data structure please answer the
# questions below it
 
ballers = [
  {:name => "Michael Jordan", :team => "Chicago"},
  {:name => "Larry Bird", :team => "Boston"},
  {:name => "Isiah Thomas", :team => "Detroit"}
]
 
# How would you access Larry Bird's team?

ballers[1][:team]
 => "Boston" 

# How would you return an array containing only the player names?

ballers.map {|person| person[:name]}
 => ["Michael Jordan", "Larry Bird", "Isiah Thomas"] 

##############################################################
 
# Using the above hash, what does the following return?
ballers[-1].size 
=> 2

ballers.size 
=> 3

# Alias for .length method

 
##############################################################
 
# Return the cast members of The Sopranos as a single
# string separated by commas.
 
tv_shows = {
  "Mad Men" => {:network => "AMC", :cast => ["John Hamm", "John Slattery", "Elizabeth Olson"]},
  "Dexter" => {:network => "Showtime", :cast => ["Michael C. Hall", "Jennifer Carpenter", "CS Lee"]},
  "The Sopranos" => {:network => "HBO", :cast => ["James Gandolfini", "Michael Imperioli", "Edie Falco"]}
}
 
# ANSWER HERE

tv_shows["The Sopranos"][:cast].join(" , ")
 => "James Gandolfini , Michael Imperioli , Edie Falco"
 
##############################################################
 
# Iterate through 'words' and return the following sentence:
#    "I'm excited for MakerSquare""
 
words = [
  ["I'm", "eating", "pizza"],
  ["Excited", "begins", "with", "E"],
  ["For", "sale"],
  ["MakerSquare", "is", "awesome!"]
]
 
# ANSWER HERE. 

words.map { |phrase| phrase[0] }.join(" ")
 => "I'm Excited For MakerSquare" 
 
##############################################################
 
# How would I access the value "Austin" in this hash?
 
person = {
  :name => "Nick McDonnough",
  :age => 28,
  :address => {
    :street => "2520 Elmont St",
    :city => "Austin",
    :state => "TX"
  }
}

# ANSWER HERE

 person[:address][:city]
  => "Austin"

##############################################################

# Iterate through 'nums' and return a new array containing
# only numbers larger than 10. Bonus if the array is sorted
# from highest to lowest.

nums = [2, 9, 3, 12, 7, 5, 99, 5, 62]

nums.select { |n| n >= 10 }.sort.reverse
 => [99, 62, 12] 

##############################################################
 
# What does the 'initialize' method do?
# A sentence or two will suffice.

If defined, initialize will run every time you create a new instance. Works with instances of a class. 

##############################################################
 
# Create a Person class based off of this behavior
# This will take up many lines. You can start your answer here.

class Person
      attr_reader :name, :age

    def initialize(name, age)
      @name = name
      @age = age
      @kids = []
    end

    def birthday
      @age += 1
    end

    def kids 
      @kids 
    end

    def family
      puts "#{@name} has 2 children: #{kids[0].name}, #{kids[1].name}"
    end
  end
 
bobby = Person.new("Bobby", 28)
bobby.age  #=> 28
bobby.birthday
bobby.birthday
bobby.age  #=> 30
 
tim = Person.new("Tim", 1)
sam = Person.new("Sam", 1)
 
bobby.kids << tim
bobby.kids << sam
 
bobby.family 
#=> "Bobby has 2 children: Tim, Sam"
 
##############################################################
 
# Create a new class Person that is initialized with a name
# In the Person class create a method 'talk' that takes a single parameter
# and prints it to the screen.
# Create a Singer class that inherits from Person. Singer should have a
# method 'sing'. The following code describes the behaviour of the classes.
 
# This will take up many lines. You can start your answer here.
 
 class Person

  def initialize(name)
    @name = name
  end

  def talk(phrase)
    puts phrase
  end

  def greet
    puts "Hey, there! I'm #{@name}."
  end
 end

 class Singer < Person

  def greet
    puts "Hey, there! I'm #{@name}."
  end

  def sing 
    puts "R-E-S-P-E-C-T. Find out what it means to me!"
 end
end
 
aretha = Singer.new("Aretha Franklin")
aretha.greet  #=> "Hey, there! I'm Aretha Franklin!"
aretha.sing   #=> "R-E-S-P-E-C-T. Find out what it means to me!"
 
nick = Person.new("Nick")
nick.greet   #=> "Hey, there! I'm Nick!"
nick.talk("Prework is super important!")  #=> "Prework is super important!"
nick.sing  #=> NoMethodError

 
##############################################################

 
class Product
  @@product_count = 0

  def initialize(name)
    @name = name
    @@product_count += 1
  end

  def self.product_count
   @@product_count
 end
end



# create a Product class that implements the following code
Product.product_count # => 0
widget1 = Product.new('widget')
Product.product_count # => 1
widget2 = Product.new('widget')
Product.product_count # => 2
widget2.product_count # => NoMethodError