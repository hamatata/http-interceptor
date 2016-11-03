begin
  require 'bundler'
rescue LoadError
  puts 'Failed to load bundler, try running: gem install bundler'
  exit 1
end

begin
  require 'rubygems'
  require 'rspec/core/rake_task'
rescue LoadError
  puts 'Failed to load some dependencies, try running: bundle install'
  exit 1
end

desc 'Run all specs, default task'
RSpec::Core::RakeTask.new(:spec)
task :default => :spec

def create_rspec_tag_task(tag)
  desc "Run specs tagged :#{tag}"
  RSpec::Core::RakeTask.new("#{tag}") do |t|
    t.rspec_opts = "--tag #{tag} --tag ~skip"
  end
end

create_rspec_tag_task('wip')