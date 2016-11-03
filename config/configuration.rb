require './spec/spec_helper'

class Configuration

  def self.screenshot_path
    path = './temp/screenshots/'
    FileUtils.mkdir_p(path) unless File.directory?(path)
    path
  end

end
