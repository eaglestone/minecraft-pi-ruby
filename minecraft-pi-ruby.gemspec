$:.push File.expand_path("../lib", __FILE__)
Gem::Specification.new do |s|
	s.name = 'minecraft-pi-ruby'
	s.description = 'Control Minecraft Pi Edition using the Ruby programming language.'
	s.version = '0.0.1'
	s.date = '2014-10-26'
	s.summary = 'Minecraft Pi Edition Ruby'
	s.homepage = 'https://github.com/eaglestone/minecraft-pi-ruby'
	s.authors = ["Tim Eaglestone"]
	s.email = ["tim.eaglestone@gmail.com"]
	s.files = `git ls-files`.split("\n")
end
