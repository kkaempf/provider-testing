require "provider-testing/helper"

task :cimom_is_pegasus do
  ProviderTesting::Helper.cimom = :pegasus
end

task :pegasus => [:cimom_is_pegasus, :pegasus_configuration, :pegasus_registration] do
  ProviderTesting::Helper.cimom.start
end
