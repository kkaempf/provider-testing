require "provider-testing/env"
require "provider-testing/mkreg"
require "provider-testing/sfcb"

#
# register
#   args: Hash
#     :klass => CIM class name
#     :namespace => namespace, defaults to test/test
#     :mofdir => where to find <klass>.mof, defaults to TOPLEVEL/samples/mof
#     :regdir => where to find <klass>.registration, defaults to TOPLEVEL/samples/registration
#

module ProviderTesting
def self.register_klass args
  args[:mofdir] ||= File.join(TOPLEVEL, "mof")
  args[:regdir] ||= File.join(TOPLEVEL, "registration")
  args[:namespace] ||= "test/test"
  klass = args[:klass]
  raise "No :klass passed to registration" unless klass
  tmpregname = File.join(TMPDIR, "#{klass}.reg")

  # convert generic <klass>.registration to sfcb-specific <klass>.reg
  convert_registrations tmpregname, File.join(args[:regdir], "#{klass}.registration")

  # stage .reg+.mof to namespace
  cmd = "sfcbstage -s #{Helper.cimom.stage_dir} -n #{args[:namespace]} -r #{tmpregname} #{File.join(args[:mofdir],args[:klass])}.mof"
#  STDERR.puts cmd
  res = `#{cmd} 2> #{TMPDIR}/sfcbstage.err`
  raise "Failed: #{cmd}" unless $? == 0
end

def self.mkrepos
  cimom = Helper.cimom
  cmd = "sfcbrepos -f -s #{cimom.stage_dir} -r #{cimom.registration_dir}"
#  STDERR.puts cmd
  res = `#{cmd} 2> #{TMPDIR}/sfcbrepos.err`
  raise "Failed: #{cmd}" unless $? == 0
end

end # module
