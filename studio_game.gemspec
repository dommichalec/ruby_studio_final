# gem build studio_game.gemspec
# gem install prag_studio_game_by_dom-1.0.0.gem
# gem push prag_studio_game_by_dom-1.0.0.gem
Gem::Specification.new do |s|
  s.name         = "prag_studio_game_by_dom"
  s.version      = "1.0.0"
  s.author       = "Dominic Michalec"
  s.email        = "dominicjjmichalec@gmail.com"
  s.summary      = "Studio Game Ruby Gem"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'studio_game.rb' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec'
end
