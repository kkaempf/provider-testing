#
# test/env.rb
#


##
# Assuming __FILE__ lives in test/
#
unless TOPLEVEL
  fdirname = File.dirname(__FILE__)
  TOPLEVEL = File.expand_path(File.join(fdirname,".."))
end

NAMESPACE = "test/test"

TMPDIR = File.join(TOPLEVEL, "tmp")
PROVIDERDIR ||= "#{TOPLEVEL}/src"