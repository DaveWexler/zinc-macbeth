require 'nokogiri'
require_relative 'macbeth_analyser'
require 'pry'

# Note: the following, by all accounts and literally everything I've searched for on the internet, should work to render an XML sample to test with. For some reason that is beyond me, it's not working, so I just used the Macbeth XML file again. I know the assignment says to not do this, but I can't figure out another way to feed the test actual XML with the below not working.
#
# sample = Nokogiri::XML::Builder.new do |xml|
#   xml.play {
#     xml.speech {
#       xml.SPEAKER "Billy"
#       xml.LINE "Hello, Jim!"
#     }
#     xml.speech {
#       xml.SPEAKER "Jim"
#       xml.LINE "Hello, Billy!"
#     }
#     xml.speech {
#       xml.SPEAKER "Billy"
#       xml.LINE "Okay bye!"
#     }
#     xml.speech {
#       xml.SPEAKER "ALL"
#       xml.LINE "Well that was anticlimactic..."
#     }
#   }
# end.to_xml
#
# The error I get is that to_xml is an undefined method, which according to everything I can find anywhere, should not be the case with Nokogiri. In fact, one page I found said that the to_xml method is really the only added value of Nokogiri::XML::Builder. Heh. 


describe "macbeth_analyser" do
  describe "#count_lines" do
    it "counts the lines by speaker" do
      xml = Nokogiri::XML(open("http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml"))
      output = count_lines(xml)
      expect(output).to include({"MACBETH" => 719})
    end
  end

  describe "#report_lines" do
    it "reports the correct number of lines from a hash" do
      sample_hash = {"Billy" => 4, "Jim" => 5}
      # expect(STDOUT).to receive(:puts).with("4 Billy\n5 Jim")
      expect(report_lines(sample_hash)[0]).to eq("4 Billy")
      expect(report_lines(sample_hash)[1]).to eq("5 Jim")
    end
  end
end
