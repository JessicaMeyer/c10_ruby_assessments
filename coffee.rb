require pry-byebug 

menu = ['coffee', 'chai', 'cortado', 'americano', 'latte', 'espresso', 'capuccino']

# create an array of just drinks that start with the letter 'c' 

	# use the .each method, a results array, and a conditional statement

results = []
menu.each do |drinks|
	if drinks[0].include?("c")
		results.push(drinks)
	end
end

results
 => ["coffee", "chai", "cortado", "capuccino"] 

	# use the .map method with the .start_with? method
# .start_with? returns true if it starts with one of the prefixes given.
# .compact - Returns a copy of self with all nil elements removed.

menu.map {|drinks| drinks if drinks.start_with? "c"}.compact
 => ["coffee", "chai", "cortado", "capuccino"]
# previously didn't have the .compact at the end

	# use the .select method

menu.select {|drinks| drinks[0].include?("c")}
=> ["coffee", "chai", "cortado", "capuccino"]

# create an array of drinks that _do_not_ start with 'c'

menu.select {|drinks| drinks[0] != "c"}
 => ["americano", "latte", "espresso"]

# check out the .partition method and do all of the above in one step!         

# .partition method - Returns two arrays, the first containing the elements of enum for which 
# the block evaluates to true, the second containing the rest.
# If no block is given, an enumerator is returned instead.

# .partition example 
# (1..6).partition { |v| v.even? }  #=> [[2, 4, 6], [1, 3, 5]]

menu.partition {|drinks| drinks[0].include? "c"}
 => [["coffee", "chai", "cortado", "capuccino"], ["americano", "latte", "espresso"]] 


################################################################################################################
################################################################################################################

# what does the line return?

# from docs - .zip - Converts any arguments to arrays, then merges elements of self with corresponding elements from each argument.
# This generates a sequence of ary.size n-element arrays, where n is one more than the count of arguments.
# If the size of any argument is less than the size of the initial array, nil values are supplied.
# If a block is given, it is invoked for each output array, otherwise an array of arrays is returned.


ranks = [6, 7, 3, 4, 1, 2, 5]

pairs = menu.zip ranks

=> [["coffee", 6], ["chai", 7], ["cortado", 3], ["americano", 4], ["latte", 1], ["espresso", 2], ["capuccino", 5]] 

# what does the line return?
# turns pairs into a Hash and saves to bens_drink_ranks

bens_drink_ranks = Hash[pairs]
 => {"coffee"=>6, "chai"=>7, "cortado"=>3, "americano"=>4, "latte"=>1, "espresso"=>2, "capuccino"=>5} 

# what does the line return?
# returns the value associated with 'chai'

bens_drink_ranks['chai']
=> 7

# what does the line return?

Hash[ranks.zip(menu)][1]
 => "latte"
# The order in which I'm zipping is reversed.

# calculate a score for bens_drink_ranks with inject 

bens_drink_ranks.values.inject(0,:+)
=> 28 

# calculate a score for tricias_orders based on bens_drink_ranks
# tried to figure out answer my own way before trying the suggested methods below.

ranks = [6, 7, 3, 4, 1, 2, 5]

tricias_orders = ['coffee', 'chai', 'chai']

tricias_orders_rank = tricias_orders.zip ranks
=> [["coffee", 6], ["chai", 7], ["chai", 3]] 

# tricia_hash = Hash[tricias_orders_rank]
#  => {"coffee"=>6, "chai"=>3} 
# why does it eliminate the other chai when I try and do it this way?
# Hashes can't have duplicate keys, so you are creating the 'chai' key with the value 7, then overwriting it.

tricia_hash = Hash[ranks.zip(tricias_orders)]
 => {6=>"coffee", 7=>"chai", 3=>"chai"} 

tricia_hash.keys.inject(0,:+)
 => 16 

# I'm able to get the amount using keys, and it includes both chai drink numbers, but if try with values, it just gives 9.
# Why is that?
# Hashes can't have duplicate keys

 # tricia_hash = Hash[tricias_orders.zip(ranks)]
 # => {"coffee"=>6, "chai"=>3} 
 # tricia_hash.values.inject(0,:+)
 # => 9


# calculate a score for tricias_orders based on bens_drink_ranks, using...

	# .each method and an accumulator variable

ranks = [6, 7, 3, 4, 1, 2, 5]

tricias_orders = ['coffee', 'chai', 'chai']

tricias_orders_rank = tricias_orders.zip ranks
=> [["coffee", 6], ["chai", 7], ["chai", 3]] 

tricia_hash = Hash[tricias_orders.zip(ranks)]
 => {"coffee"=>6, "chai"=>3} 


count = 0
tricia_hash.each do |drink, value|
	count += value 
end
p count
end
# => 9

	# .map method combined with .inject

tricia_hash.map {|k,v| v.to_f}.inject(0,:+)
 #=> 9.0 


	#. inject by itself 

	tricia_hash.values.inject(0,:+)
 # => 9


# calculate the number of drinks ben ordered with a rank of 3 or less. use...

# I feel like I'm doing a bunch of extra steps

bens_drink_ranks = {"coffee"=>6, "chai"=>7, "cortado"=>3, "americano"=>4, "latte"=>1, "espresso"=>2, "capuccino"=>5} 

bens_orders = ['latte', 'latte', 'latte', 'espresso', 'cortado', 'americano', 'capuccino']

bens_drinks = bens_orders.each_with_object(Hash.new(0)) {|coffee, count| count[coffee] += 1}
 => {"latte"=>3, "espresso"=>1, "cortado"=>1, "americano"=>1, "capuccino"=>1} 

ranks = bens_drink_ranks.select {|k,v| k if v <= 3}
 => {"cortado"=>3, "latte"=>1, "espresso"=>2} 

ranks.flatten.count
 => 6  


	# .each method, conditional

drink_rank = []
bens_drink_ranks.each do |drink, value|
	if value <= 3
		drink_rank << value
	else
		nil
	end
end

drink_rank
#=> [3, 1, 2] 

drink_rank.inject(0,:+)
# => 6 


	# .map 

ranks = bens_drink_ranks.map do |drink, value|
	if value <= 3
		p value
	else
		nil
	end
end

ranks
 # => [nil, nil, 3, nil, 1, 2, nil] 

ranks.compact.inject(0,:+)
 # => 6 


# The menu needs prices associated with each drink, as well as a ranking (idk why, just roll with it)
# Construct a new menu hash that contains the drink name as the key along with prices

# ex:
# 	{ 
# 		'chai' => {
# 			:rank => 7,
# 			:price => 2.99
# 		},
# 		'latte' => {
# 			:rank => 1,
# 			:price => 4.50
# 		}
# 	}

# start by defining a prices array with all the prices, and then modifying bens_drink_ranks.
# this is hard! don't fret! you will most likely need to use .each_with_index but there are other ways of doing it.
# trying this first part out


# start by defining a prices array with all the prices

prices = [1.99, 3.10, 4.25, 3.25, 4.50, 2.50, 4.75]

# and then modify bens_drink_ranks.

bens_drink_ranks
 # => {"coffee"=>6, "chai"=>7, "cortado"=>3, "americano"=>4, "latte"=>1, "espresso"=>2, "capuccino"=>5} 

# Option 1

menu = {}
bens_drink_ranks.each_with_index do |pair, index|
    menu[pair[0]] = { :rank => pair[1], :price => prices[index] }
end

# Option 2

menu = {}
bens_drink_ranks.each_with_index do |(drink,rank), index|
    menu[drink] = { :rank => rank, :price => prices[index] }
end

# Option 3

menu = {}
bens_drink_ranks.each do |drink, rank|
    menu[drink] = { :rank => rank, :price => prices.unshift }
end


menu => {
	"coffee"=>
	{:rank=>6, :price=>1.99}, 
	"chai"=>{:rank=>7, :price=>3.1}, 
	"cortado"=>{:rank=>3, :price=>4.25}, 
	"americano"=>{:rank=>4, :price=>3.25}, 
	"latte"=>{:rank=>1, :price=>4.5}, 
	"espresso"=>{:rank=>2, :price=>2.5}, 
	"capuccino"=>{:rank=>5, :price=>4.75}
}
