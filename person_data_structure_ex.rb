
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

# now just need to turn this set of arrays into a hash that looks like the expected output

peeps_array = peeps.map do |person|
  person = person.name, person.hobby, person.city, person.state, person.zip
end

# now just need to turn the peeps_array into a hash

 peeps_array =[["Jim", "swimming", "Dallas", "Texas", 75227], 
 ["Ray", "jazz", "Phoenix", "Arizona", 75217], 
 ["Bob", "painting", "Austin", "Texas", 78750], 
 ["Joe", "cooking", "Waco", "Texas", 76706]]

# one solution 

 person_hash = Hash[peeps_array.map do |person|
  [person[0], Hash['hobby', person[1], 'address', Hash['city', person[2], 'state', person[3], 'zip', person[4]]]]
end]

# another solution iterating over peeps

peeps.each_with_object({}) do |instance, h|
  h[instance.name] = { "hobby"   => instance.hobby,
                       "address" => { "city"  => instance.city,
                                      "state" => instance.state,
                                      "zip"   => instance.zip } }
end


# ben's first solution 
# Semi-"easy" way to get this done, it feels like the code "knows too much" about the keys:

person_hash = {}
peeps.each do |peep|
  person_hash[peep.name] = {
    "hobby" => peep.hobby,
    "city"  => peep.city,
    "state" => peep.state,
    "zip"   => peep.zip
  }
end

# another solution from Ben
# Slightly cleaner way of going about it... handles any instance variables we set on Person

class Person
  attr_reader :name, :city, :state, :zip, :hobby

  @@people = {}

  def initialize(name, hobby, city, state, zip)
    @name = name
    @hobby = hobby
    @city = city
    @state = state
    @zip = zip

    add_me_to_hash if @@people[@name].nil?
  end    

  private

  def add_me_to_hash
    @@people[@name] = {}
    self.instance_variables.each do |var|
      @@people[@name][":#{var[1, var.size]}"] = self.instance_variable_get(var)
    end
  end

  def self.people
    @@people
  end

end

# final product answer for all solutions ... 

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
