
require 'optparse'

options = {:frieghtCost => nil, :collateralCost => nil}

parser = OptionParser.new do|opts|
	opts.banner = "Usage: material-cost.rb [options]"

	
	opts.on('h', '--help', 'Display Help') do	
		puts opts
		exit
	end
end
parser.parse!

if options[:addApi] == nil
	print "Enter Key ID: "
	options[:addApi] = gets.chomp
end