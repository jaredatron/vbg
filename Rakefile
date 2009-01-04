# -*- ruby -*-

require 'rubygems'
require 'hoe'
require './lib/vbg.rb'

Hoe.new('vbg', VBG::VERSION) do |p|
  p.rubyforge_name = 'vbg'
  p.developer('aaron Blohowiak', 'aaron.blohowiak@gmail.com')
  p.developer('Jared Grippe', 'vbg@jaredgrippe.com')
  p.extra_deps << ['mojombo-grit']
end

desc "Open an irb session preloaded with this library"
task :console do
  sh "irb -rubygems -r ./lib/vbg.rb"
end

# vim: syntax=Ruby
