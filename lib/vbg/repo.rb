module VBG
  class Repo
  
    def initialize(path_to_git_repo)
      @path = path_to_git_repo.gsub(/\.git$/,'')+'.git'
    end

    attr_reader :path

    def repo
      @repo ||= find_or_create_repo
    end


    private

    def find_or_create_repo
        return Grit::Repo.new(@path)
      rescue Grit::NoSuchPathError
        return create_bare_repo
    end

    def create_bare_repo
      repo = Grit::Repo.init_bare(@path)
      repo.index.commit('inital commit')
      repo
    end

  
  end
end