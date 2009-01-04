require 'grit'

module VBG
  
  VERSION = '0.0.1'

  # Usage
  #
  #   myrepo = VBG['/path/to/my/repo']
  #   myrepo::File.new('/path/inside/my/repo')
  #
  def self.[](path_to_repo)
    mod = Module.new
    mod.module_eval <<-CODE
      extend ::VBG::ModuleMethods
    
      REPO = ::VBG::Repo.new('#{path_to_repo}')
      
      def self.repo
        REPO
      end
      
      class File < ::VBG::File
        REPO = REPO
      end
      
      class GFile < ::VBG::File
        REPO = REPO
      end
      
      class Dir < ::VBG::Dir
        REPO = REPO
      end
      
      class GDir < ::VBG::Dir
        REPO = REPO
      end
      
      def self.inspect
        '#<VBG:Module:#{path_to_repo}.git>'
      end
    CODE
    mod
  end
  
  # Usage:
  #
  #   VBG.open('/path/to/my/repo') do |myrepo|
  #     myrepo::File.new('/path/inside/my/repo')
  #   end
  #
  def self.open(path_to_repo, &block)
    mod = self[path_to_repo]
    block.call(mod, mod::File, mod::Dir) if block
    mod
  end

end

Dir["#{File.dirname(__FILE__)}/vbg/*"].each do |file|
  require file
end