require 'grit'

module VBG
  
  VERSION = '0.0.1'

  def self.[](path_to_repo)
    Repo.new(path_to_repo)
  end

end

require File.join( File.dirname(__FILE__), ['vbg','repo'] )