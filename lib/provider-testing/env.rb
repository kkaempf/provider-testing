#
# test/env.rb
#

unless defined? TOPLEVEL
  TOPLEVEL = ENV['TOPLEVEL'] || "/tmp/provider-testing"
  Dir.mkdir(TOPLEVEL) unless Dir.exist?(TOPLEVEL)
end

NAMESPACE = "test/test"

TMPDIR = File.join(TOPLEVEL, "tmp")
PROVIDERDIR = "#{TOPLEVEL}/src" unless defined?(PROVIDERDIR)
