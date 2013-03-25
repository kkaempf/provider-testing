#
# test/env.rb
#

unless defined? TOPLEVEL
  TOPLEVEL = ENV['TOPLEVEL'] || "/tmp/provider-testing"
  Dir.mkdir(TOPLEVEL) unless Dir.exists?(TOPLEVEL)
end

NAMESPACE = "test/test"

TMPDIR = File.join(TOPLEVEL, "tmp")
PROVIDERDIR ||= "#{TOPLEVEL}/src"
