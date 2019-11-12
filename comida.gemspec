lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "comida/version"

Gem::Specification.new do |spec|
  spec.name          = "comida"
  spec.version       = Comida::VERSION
  spec.authors       = ["David Valverde"]
  spec.email         = ["alu0101100296@ull.edu.es"]

  spec.summary       = %q{Lenguajes y Paradigmas de Programación. Práctica 6.}
  spec.description   = %q{Desarrollo Dirigido por Pruebas.}
  spec.homepage      = "https://github.com/ULL-ESIT-LPP-1920/tdd-daviddvg7.git"

  spec.metadata["allowed_push_host"] = spec.homepage

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
