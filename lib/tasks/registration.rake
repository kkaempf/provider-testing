task :sfcb_registration => [:sfcb_configuration] do |t|
  puts "Register all providers"
  
  require "provider-testing/registration"
  Dir['registration/*.registration'].each do |regname|
    puts "  #{regname}"
    ProviderTesting.register_file regname
  end
  ProviderTesting.mkrepos
end


task :pegasus_registration => [:pegasus_configuration] do
  puts "Registering Pegasus providers"
end
