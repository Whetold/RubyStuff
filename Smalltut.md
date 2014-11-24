
# Quick few steps in Ruby
I assume that you know other language, and you just want to quickly look through things that are a bit different
###Commenting
```sh
#this is a comment

=begin
this is area for comment
=end
```


###Multiuse of methods!
```sh
name = "Lukasz"
name.downcase.reverse.upcase

ZSAKUL #printout
```
Combining all those methods on our string Will make it downcase, then reverse and at end upcase it

###Inputs
```sh
yourtext = gets #Takes whole line and puts it into yourtext variable
user_num = Integer(gets.chomp)  #gets line, cuts the nextline sign and forces it to be integer
```
###Outputs
```sh
print "Apple"  
puts "Orange"
p "Lemon"
printf "There are %d apples\n", 3
putc 'K'
puts "Hello #{variable}"   #printouts Hello and variable
```
###Methods
* This is how looks the declaration of method
```sh
def functionname(variable)
   return <value>
end
```
* And that's how you call your function. You can do it in different ways
```sh
function param1, param2
function(param1, param2)
```

###Loops and conditions
You'll be using lots of "end" instead of brackets :)
* Example IF
```sh
if user_num < 0
    puts "You picked a negative integer!"
elsif user_num > 0
    puts "You picked a positive integer!"
else
    puts "You picked zero!"
end
```
* While (don't do this one)
```sh
while 1 < 2
  puts "a"
end
```
or you can declare it like this
```sh
begin 
  #our code 
end while conditional
```
* Until - In ruby sometimes you'll find useful this one 
```sh
until conditional [do] #optional do
    #our code 
end
```
Or you can just type
```sh
begin
    #our code 
end until conditional
```
* Let's see for
```sh
for variable [, variable ...] in expression [do]
   code
end
```
This could be kinda confusing but here's example for you!
```sh
for i in 0..30
   puts "Local variable is #{i}"
end
```
* This one can go even through whole array

```sh
(expression).each do |variable[, variable...]| code end
#and example
(0..30).each do |i|
   puts "Local variable is #{i}"
end
```


* NEXT  makes you jump to next iteration of the most internal loop.
```sh
for i in 0..30
   if i < 2 then
      next
   end
   puts "Local variable is #{i}"
end
```

I hope those basics will help you out at begging. Keep calm and go on with coding!
