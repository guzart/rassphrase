# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rassphrase/version"

Gem::Specification.new do |s|
  s.name        = "rassphrase"
  s.version     = Rassphrase::VERSION
  s.authors     = ["Arturo Guzman"]
  s.email       = ["arturo@agrdt.com"]
  s.homepage    = "https://github.com/guzart/rassphrase"
  s.summary     = "A Ruby implementation of Diceware passphrase."
  s.description = "Uses the Diceware method and method to generate secure passphrases."

  s.rubyforge_project = "rassphrase"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_development_dependency "cucumber"
end
