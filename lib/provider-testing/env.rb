#
# test/env.rb
#
# define execution environment
#

# if not called via Rakefile
unless defined? TOPLEVEL
  # root dir of cimom environment
  TOPLEVEL = ENV['TOPLEVEL'] || "/tmp/provider-testing"
  Dir.mkdir(TOPLEVEL) unless Dir.exist?(TOPLEVEL)
end

# namespace for providers under test
NAMESPACE = "test/test"

# temporary directory to create sfcb runtime environment
TMPDIR = File.join(TOPLEVEL, "tmp")

# where we look for providers
PROVIDERDIR = "#{TOPLEVEL}/src" unless defined?(PROVIDERDIR)
