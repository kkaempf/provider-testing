TOPLEVEL = File.dirname(__FILE__)

require 'bundler/gem_tasks'
require 'rake/testtask'

NAME     = File.basename TOPLEVEL
MOFDIR   = "/usr/share/mof/#{NAME}"
CMPIDIR  = "/usr/share/cmpi"
DESTDIR  = ENV['DESTDIR']

Dir['tasks/*.rake'].each { |t| load t }
Dir['lib/tasks/*.rake'].each { |t| load t }

task :default => [:test]
