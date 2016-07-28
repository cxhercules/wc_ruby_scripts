##!/usr/bin/env ruby
require 'crypt/blowfish'

unless ARGV[0]
   puts "Usage: ./encrypt.rb <filename.ext>"
   puts "Example: ./encrypt.rb secret.stuff"
   exit
end

#take in the file name to encrypt as an argument
filename = ARGV[0].chomp
puts filename
c = "Encrypted_#{filename}"

if File.exists?(c)
   puts "File already exists."
   exit
end

print 'Enter your encryption key (1-56 bytes): '
kee = gets.chomp

begin
   blowfish = Crypt::Blowfish.new(kee)
   blowfish.encrypt_file(filename.to_str, c)
   puts 'Encryption Success!'
rescue Exception => e
   puts "An error occurred during encryption: \n #{e}"
end
