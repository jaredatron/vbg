require File.dirname(__FILE__) + '/spec_helper'
 
describe VBG do

  before(:each) do
    @repo_path = File.join(TEMP_DIR,"test_repo_#{Time.now.to_i}")
    @vbgo = VBG[@repo_path]
  end
  

  it "should guzzel vaginal blood" do
    VBG.should == VBG
  end
  
  it "should return an annoymous module" do
    @vbgo.class.should == Module
  end
  
  # it "should return "
  
  it "should create a repo with a path ending in .git" do
    ( !!@vbgo.repo.path.match(/\.git$/) ).should == true
  end
  
  it "should create a repo at the same path given" do
    @vbgo.repo.path.should == @repo_path+'.git'
  end
  
  it "should creates bare repo" do
    @vbgo.repo.class.should == VBG::Repo
  end
  
  it "should read from an existsing repo" do
    myrepo = VBG[@repo_path]
    myrepo::File
  end

  it "open should accept a block" do
    VBG.open( File.join(TEMP_DIR,"test_repo_#{Time.now.to_i}_2") ) do |myrepo, file, dir|
      file.should == myrepo::File
      dir.should  == myrepo::Dir
      include myrepo
      GFile.should == myrepo::GFile
      GDir.should  == myrepo::GDir
    end
  end

  
  after(:each) do
    FileUtils.rm_rf( @vbgo.repo.path ) 
  end

end