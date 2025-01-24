#
# provider-testing.rb
#
# A Ruby-based testsuite for CIM providers
#
# Copyright (c) 2013 Klaus Kämpf <kkaempf@suse.de>
#
# Licensed under the Ruby license
#
$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

# toplevel Module
module ProviderTesting
  # gem version
  VERSION = '0.4.0'
  require 'provider-testing/helper'
  # toplevel initialization routine
  def self.setup klass = "", namespace = "root/cimv2"
    Helper.setup klass, namespace
  end
  # toplevel teardown routine
  def self.teardown
    Helper.teardown
  end
end
