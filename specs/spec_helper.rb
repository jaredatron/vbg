$LOAD_PATH << File.dirname(__FILE__) + '/../lib'
 
require 'vbg'
require 'rubygems'
require 'spec'

TEMP_DIR   = File.join(File.dirname(__FILE__), 'tmp')

# def flush_tmp_dir
#   Dir["#{TMP_DIR}/*"].each{|f| FileUtils.rm_rf(f) }
# end

