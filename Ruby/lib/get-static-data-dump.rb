require 'open-uri'
require 'nokogiri'

def downloadFiles()
  settings = Nokogiri::XML(File.open("data\config.xml"))
  staticData = settings.xpath("//setting[@name='static-data']")
  url = staticData.first['url'] 
  
  staticData.xpath("//properties/property").each do |property|
    dest = "data\static\\" + property
    source = url + property
    
    open(dest, 'wb') do |file|
      file << open(source).read
    end
    
  end
 
end