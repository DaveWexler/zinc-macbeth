require 'nokogiri'
require 'pry'
require 'open-uri'

xml = Nokogiri::XML(open("http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml"))

def count_lines(xml_file)
  chars = xml_file.xpath("//SPEAKER")
  char_lines_count = Hash.new(0)
  chars.map do |char|
    unless char.text == "ALL"
      char_lines_count[char.text] += char.xpath("../LINE").length
    end
  end
  char_lines_count
end

def report_lines(hash)
  text = hash.map do |char, num|
    "#{num} #{char}"
  end
  puts text
  text
end

report_lines(count_lines(xml))
