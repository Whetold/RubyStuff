#!/usr/bin/env ruby

require 'rubygems'
require "open-uri" 
require 'ImageResize'

def start(ary)

puts "Hello. Please gib link to picture you wantz.\nAs second argument name of file\nThen after space % size of pic if you want to resize it (in pixels)"
x = gets.chomp

x.gsub(/\s+/m, ' ').strip.split(" ") do |argument| #many white spaces and m is modifier

ary << argument

end


end


def download(x, filename )

if filename == nil
	filename = "Bigfile.jpg"
end


open(x) {|f|
   File.open(filename,"wb") do |file|
     file.puts f.read
   end
}

end

def domagic(filename , x, y )
	if filename == nil
		filename= "Bigfile.jpg"
	end
	Image.resize(filename, "YoursmallImage.jpg", x, y)
end


ary = start(ary)

download(ary[0], ary[1])
if ary[2] != nil && ary[3] != nil
	domagic(ary[1], ary[2], ary[3])
end


