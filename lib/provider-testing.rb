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

module ProviderTesting
  VERSION = '0.3.1'
  require 'provider-testing/helper'
  def self.setup klass, namespace = "test/test"
    Helper.setup klass, namespace
  end
  def self.teardown
    Helper.teardown
  end
end
