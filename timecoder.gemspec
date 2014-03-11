# -*- encoding: utf-8 -*-
require File.expand_path('../lib/timecoder/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["jason"]
  gem.email         = ["jsofokleous@googlemail.com"]
  gem.description   = %q{Given a time in seconds it returns a formatted timecode (hh:mm:ss) and given a formatted timecode it returns the total time in seconds}
  gem.summary       = %q{Converts a formatted timecode to the total time in seconds and vice versa}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "timecoder"
  gem.require_paths = ["lib"]
  gem.version       = Timecoder::VERSION

  gem.add_development_dependency 'rake'
  gem.add_development_dependency "rspec" 
end
