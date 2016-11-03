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
create_rspec_tag_task('users')

# 'rake all[tag_name]' to run specs with tag_name
desc 'Run specs tagged :<tag>'
RSpec::Core::RakeTask.new(:all, :tag) do |t, task_args|
  t.rspec_opts = "--tag #{task_args[:tag]} --tag ~skip"
end

desc 'Dry Run specs tagged :wip'
RSpec::Core::RakeTask.new(:wip_dry) do |t|
  t.rspec_opts = '--tag wip --tag ~skip --dry-run'
end

desc 'Dry Run specs tagged <tag>, e.g. dry[mytag]'
RSpec::Core::RakeTask.new(:dry, :tag) do |t, task_args|
  t.rspec_opts = "--tag #{task_args[:tag]} --tag ~skip --dry-run"
end
