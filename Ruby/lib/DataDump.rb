require 'open-uri'
require 'uri'
require 'openssl'
require 'set'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class DataDump
  def self.get()
    urls = Set.new
    source = 'https://www.fuzzwork.co.uk/dump/latest/'
    html = open(source).read 
    urls.merge(html.scan(/[a-zA-Z]+\.sql\.bz2/))

    puts "Downloading: "
    urls.each do |filename|
      open(filename, 'wb') do |file|
        puts "\t" + source + filename + "..."
        file << open(source + filename).read
        system("powershell 7za e " + filename)
      end
    end
  end
end
