# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "validates-belongs-to/version"

Gem::Specification.new do |s|
  s.name        = "validates-belongs-to"
  s.version     = Validates::Belongs::To::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Matt Burke']
  s.email       = ['spraints@gmail.com']
  s.homepage    = 'http://github.com/spraints/validates-belongs-to'
  s.summary     = %q{ActiveModel validation that two associated models are related to each other.}
  s.description = %q{ActiveModel validation that two associated models are related to each other.}

  s.rubyforge_project = "validates-belongs-to"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'activemodel', '>= 3.0.0'
end
