$LOAD_PATH.unshift 'lib'

begin
  require 'bacon'
rescue LoadError
  begin
    require "rubygems"
    require "bacon"
  rescue LoadError
    puts <<-EOS
  To run these tests you must install bacon.
  Quick and easy install for gem:
      gem install bacon
  EOS
    exit(0)
  end
end

Bacon.summary_on_exit

class BlackHole
  instance_methods.each { |m| undef_method m unless m =~ /^__/ }

  def initialize(*a) end

  def method_missing(m, *a)
    BlackHole.new
  end
end

require 'fsr'
require 'fsr/command_socket'
require 'fsr/listener'
