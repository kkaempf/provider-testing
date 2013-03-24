task :sfcb_registration => [:sfcb_configuration] do |t|
  puts "Register all providers"
  
  require "provider-testing/registration"
  Dir['registration/*.registration'].each do |regname|
    klass = File.basename regname, ".registration"
    ProviderTesting.register_klass :klass => klass
  end
  ProviderTesting.mkrepos
end


task :pegasus_registration => [:pegasus_configuration] do
  puts "Registering Pegasus providers"
end
