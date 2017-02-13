require 'nokogiri'
require 'pry'
require 'open-uri'

xml = Nokogiri::XML(open("http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml"))
char_lines_count = Hash.new(0)

chars = xml.xpath("//SPEAKER")
chars.map do |char|
  unless char.text == "ALL"
    char_lines_count[char.text] += char.xpath("../LINE").length
  end
end

char_lines_count.each do |char, num|
  puts "#{num} #{char}"
end
