puts 'Hello from test.rb'

def attributes_defined(attributes_array)
  attributes_array.each { |attribute| return if attribute.nil? }
  true
end

loc1 = { name: 'my name', address: 'my address' }
# puts 'loc1 ='
# puts loc1
# puts 'loc1[:name]'
# puts loc1[:name]
# puts 'loc1[:name].nil?'
# puts loc1[:name].nil?
loc2 = { name: 'my name', address: nil }
loc3 = { name: nil, address: 'my address' }
loc4 = { name: nil, address: nil }

answer1 = attributes_defined([loc1[:name], loc1[:address]])
puts 'answer1 ='
puts answer1 == true # expected true

answer2 = attributes_defined([loc2[:name], loc2[:address]])
puts 'answer2 ='
puts answer2.nil? # expected false

answer3 = attributes_defined([loc3[:name], loc3[:address]])
puts 'answer3 ='
puts answer3 == true # expected false

answer4 = attributes_defined([loc4[:name], loc4[:address]])
puts 'answer4 ='
puts answer4 == false # expected false

y_n = answer4 == true ? 'yes' : 'no'
puts 'y_n = '
puts y_n
