# -*- encoding: utf-8 -*-
require File.expand_path('../lib/fertilizer/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Haris KRAJINA"]
  gem.email         = ["haris.krajina@gmail.com"]
  gem.description   = %q{Fertilizer is simple gem used to enrich new rails projects with configuration setup, console extensions etc.}
  gem.summary       = %q{Take a look at Fertilizer's generator and use taks to add features to your rails projects.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "fertilizer"
  gem.require_paths = ["lib"]
  gem.version       = Fertilizer::VERSION

  gem.add_dependency "rails", "~> 3.0"
end
