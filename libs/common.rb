require './spec/spec_helper'

def require_dir(directory)
  directory = directory + '/**/*.rb'
  [directory].each { |dir| Dir[dir].sort.each { |file| require file} }
end

def read_json_file(file_path)
  begin
    if File.exist?(file_path)
      file = File.read(file_path)
      JSON.parse(file)
    else
      raise "There is no file with path: #{file_path}"
    end
  rescue JSON::ParserError => e
    puts "File #{file_path} contains not well formed JSON"
    raise e
  end
end

def time_now
  Time.new.strftime('%Y-%m-%dT%H-%M')
end

def screenshot_path
  path = './temp/screenshots/'
  FileUtils.mkdir_p(path) unless File.directory?(path)
  path
end

def make_screenshot#(name=nil)
  #name ||= time_now
  save_screenshot(screenshot_path + time_now + '.png')
end