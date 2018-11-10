lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dashfiles/version'

Gem::Specification.new do |spec|
  spec.name          = 'dashfiles'
  spec.version       = Dashfiles::VERSION
  spec.authors       = ['Taylor Thurlow']
  spec.email         = ['taylorthurlow8@gmail.com']

  spec.summary       = 'Manage and link your dotfiles.'
  spec.description   = 'Manage and link your dotfiles.'
  spec.homepage      = 'https://github.com/taylorthurlow/dashfiles'
  spec.license       = 'MIT'

  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0")
                     .reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'thor', '~> 0.20'

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
