$LOAD_PATH.push File.expand_path("../lib", __FILE__)

require "imaterialise/version"

Gem::Specification.new do |s|
  s.name        = "imaterialise"
  s.version     = Imaterialise::VERSION
  s.authors     = ["Sunny Ripert"]
  s.email       = ["sunny@cults3d.com"]
  s.homepage    = "http://github.com/sunny/imaterialise"
  s.summary     = "Access imaterialise's API"
  s.description = "Upload 3D Models on imaterialise's service"
  s.license     = "MIT"

  s.files = Dir["lib/**/*",
                "console.rb",
                "MIT-LICENSE",
                "Rakefile",
                "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_runtime_dependency "rest_client"

  s.add_development_dependency "webmock"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "pry"
end
