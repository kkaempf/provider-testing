#
# Transform generic .registration format to
#   sfcb-specific .reg format
#
module ProviderTesting

# read .registration file, return array of
#  0         1         2            3              4..-1
#  classname namespace providername providermodule caps
def self.rdreg from
  File.open(from, "r") do |f|
    while (l = f.gets)
      next if l =~ /^\s*#.*$/
      l.chomp!
      next if l.empty?
      reg = l.split(" ")
      raise unless reg.size > 4
      yield reg
    end
  end
end

# create a provider registration config
# input: from  registration data
# input: out   file to write registration config to
def self.mkreg from, out
#  STDERR.puts "mkreg #{from}"
  self.rdreg from do |reg|
    #  0         1         2            3              4..-1
    #  classname namespace providername providermodule caps
    out.puts "[#{reg[0]}]"
    out.puts "  provider: #{reg[2]}"
    out.puts "  location: #{reg[3]}"
    out.puts "  type: #{reg[4..-1].join(' ')}"
    out.puts "  namespace: #{reg[1]}"
  end
end

# converts multiple registrations to a config readable by CIMOM
# input: outfile  file to write config to
# input: regfiles registration files to read
#
def self.convert_registrations outfile, *regfiles
#  STDERR.puts "convert_registrations => #{outfile}"
  File.open(outfile, "w+") do |out|
    regfiles.each do |regfile|
      mkreg regfile, out
    end
  end
end
end
