#
# test/helper.rb
#

require "provider-testing/env"

module ProviderTesting

# some helper functions
class Helper
  
  # called from rake

  # select the CIMOM to be run
  # input: name  symbol of CIMOM to run (+:sfcb:+ or +:pegasus:+)
  #
  def self.cimom= name
    @@cimom ||= case name
    when :sfcb
      require_relative "./sfcb"
      Sfcb.new :tmpdir => TMPDIR, :provider => PROVIDERDIR
    when :pegasus
      require_relative "./pegasus"
      Pegasus.new :tmpdir => TMPDIR, :provider => PROVIDERDIR
    else
      raise "Unknown CIMOM #{@cimom}"
    end
  end

  # the selected CIMOM, defaults to +:sfcb+
  def self.cimom
    @@cimom rescue (self.cimom = :sfcb; @@cimom)
  end
  
  # called from test/unit

  # creates a connection the the CIMOM
  # return [client, op]   pair of client connection and object path
  def self.setup klass = "", namespace = "root/cimv2"
    client = Sfcc::Cim::Client.connect(:uri => self.cimom.uri, :verify => false)
    raise "Connection error" unless client
    op = Sfcc::Cim::ObjectPath.new(namespace, klass, client)
    return client, op
  end
  
  # should stop the CIMOM (currently doesn't :-( )
  def self.teardown
    self.cimom.stop
  end
end
end
