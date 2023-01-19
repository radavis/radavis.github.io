---
layout: post
title: "Fun with IO"
date: 2016-06-05 16:00
tags: ruby io
comments: true
---

```ruby
# Notes on working with IO objects

require 'pp'

<<-MD
  # IO

  The basis for all input and output in Ruby (and computers).

  Types of IO devices:
    - Keyboards
    - Mic/Speakers/Video
    - USB devices
    - Files

  Data is moved between devices and programs in the form of bytes.

  The IO class will convert pathnames between different OS conventions, if possible.

  ## Methods of Interest

  * .binread
  * .binwrite
  * .copy_stream
  * .new
  * .open
  * .pipe
  * .read
  * .readlines
  * .write
  * #chars
  * #close
  * #each, #each_byte, #each_char, #each_line
  * #eof
  * #lines
  * #readbyte, #readchar, #readline, #readlines
  * #rewind
  * #to_i
  * #to_io
  * #write
MD

# writing to a file with the IO class
#  - create a "file descriptor" object, and then create a new I/O stream with it
#  - IO objects can also be created with the `BasicSocket` and `File` classes
filename = "./junk"
file_descriptor = IO.sysopen(filename, "w")
io_stream = IO.new(file_descriptor)
io_stream.puts "Hello, Richard"
io_stream.close

# reading from a file with the IO class
file_descriptor = IO.sysopen(filename)
io_stream = IO.new(file_descriptor)
io_stream.gets
io_stream.pos # => 15
io_stream.eof? # => true
io_stream.close

# the STDOUT, STDIN, and, STDERR constants are IO objects pointing to your
# program's input, output, and error streams
puts $stdin.object_id == STDIN

# you can capture and of these streams by reassigning their global variable
stderr = StringIO.new
$stderr = stderr

# set things back when you are finished capturing a stream
$stderr = STDERR

<<-MD
  # File

  Subclass of IO

  ## Methods of Interest

  * .path
  * #chmod
  * #size
MD

# write to file
filename = "todo.txt"
# file = File.open(filename, "w") # or
file = open(filename, "w")
file.puts "Wash dishes"
file.puts "Take a walk"
file.puts "Create hardware startup"
file.close

# write to file - block notation
filename = "groceries.txt"
File.open(filename, "w") do |file|
  file.puts "hummus"
  file.puts "carrots"
  file.puts "avocados"
end

# read from file - block notation
puts "#{filename} contains:"
File.open(filename, "r") do |file|
  puts file.read
end

# read from file - lines into array
lines = File.open(filename, "r").readlines
puts "Reading #{filename} with the #readlines method returns:"
PP.pp lines

# checking for existence
file_check = File.exists?(filename)
puts "Does #{filename} exist? #{file_check ? 'yes' : 'no'}"

# getting the path of a the current file
path = File.dirname(__FILE__)
puts "The file executing this code is located at #{path}"


<<-MD
  # Dir

  "Directory streams representing directories in the filesystem."

  ## Methods of Interest

  * Dir[string] - same as Dir.glob(string)
  * .delete
  * .exists?
  * .foreach
  * .home
  * #path
  * #read
  * #rewind
MD

# creating a directory
Dir.mkdir("temp") unless File.exists?("temp")

# file count
home = Dir.home
file_count = Dir.glob("#{home}/*").length
puts "There are #{file_count} files in the root of your home directory"

# recursive file count
file_count = Dir.glob("#{home}/**/*").length
puts "There are #{file_count} files within your home directory"

# file count by type
file_count = Dir.glob("#{home}/**/*.{pdf,PDF}").size
puts "There are #{file_count} PDFs within your home directory"


<<-MD

  # Sockets

  All of the following classes inherit from the IO class.

  - TCPSocket
  - UDPSocket
  - UNIXSocket
  - Socket

MD

# making a HTTP request
require "socket"
tcp_socket = TCPSocket.new("localhost", 3000)
tcp_socket.puts("GET / HTTP/1.1\r\n")
tcp_socket.puts("\r\n")
tcp_socket.gets  # => "HTTP/1.1 302 Found \r\n"

<<-MD
  # Resources

  * [ruby-doc.org](http://ruby-doc.org/core/IO.html)
  * [Streams - RubyMonk](https://rubymonk.com/learning/books/1-ruby-primer/chapters/42-introduction-to-i-o/lessons/89-streams)
  * [IO in Ruby - thoughtbot](https://robots.thoughtbot.com/io-in-ruby)
  * [Input & Output - readruby.io](http://web.archive.org/web/20150101172349/http://readruby.io/io)
  * [Text processing and I/O programming fundamentals](https://github.com/elm-city-craftworks/course-001)
MD
```
