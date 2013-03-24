require "provider-testing/helper"

task :cimom_is_sfcb do
  ProviderTesting::Helper.cimom = :sfcb
end

task :sfcb => [:cimom_is_sfcb, :sfcb_configuration, :sfcb_registration] do
  ProviderTesting::Helper.cimom.start
end
