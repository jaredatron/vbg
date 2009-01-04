require File.dirname(__FILE__) + '/spec_helper'
 
describe VBG do

  before(:each) do
    @repo = VBG[ File.join(TEMP_DIR,"test_repo_#{Time.now.to_i}") ]
  end
  

  it "should guzzel vaginal blood" do
    VBG.should == VBG
  end
  
  it "should return a VBG::Repo" do
    @repo.class.should == VBG::Repo
  end

  it "should create a repo with a path ending in .git" do
    ( !!@repo.path.match(/\.git$/) ).should == true
  end
  
  # describe "creates bare repo" do
  #   @repo.class.should == Grit::Repo
  # end
  # 
  # describe "reads from existsing repo" do
  #   
  # end

  
  after(:each) do
    FileUtils.rm_rf( @repo.path ) 
  end

end