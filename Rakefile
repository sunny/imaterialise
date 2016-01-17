# Bundler
require "bundler/gem_tasks"

# Specs
require "rspec/core/rake_task"
RSpec::Core::RakeTask.new(:spec)

# Console
desc "Open a pry session preloaded with this library"
task :console do
  sh "pry --gem -r ./console.rb"
end

task default: :spec
