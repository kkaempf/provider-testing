#
# test/env.rb
#

TOPLEVEL = ENV['TOPLEVEL'] || File.expand_path(File.join(File.dirname(__FILE__), ".."))

NAMESPACE = "test/test"

TMPDIR = File.join(TOPLEVEL, "tmp")
PROVIDERDIR ||= "#{TOPLEVEL}/src"
