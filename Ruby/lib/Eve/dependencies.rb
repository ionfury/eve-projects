require 'net/http'
require 'nokogiri'

$:.unshift File.dirname(__FILE__)

module Eve
  autoload :API, "eve/api"
end