# -*- encoding: utf-8 -*-
# stub: huanxin 0.1.5 ruby lib

Gem::Specification.new do |s|
  s.name = "huanxin"
  s.version = "0.1.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org" } if s.respond_to? :metadata=
  s.require_paths = ["lib"]
  s.authors = ["Robot Jiang"]
  s.bindir = "exe"
  s.date = "2016-09-06"
  s.description = "\u{73af}\u{4fe1} Rest API \u{7684} Ruby Client "
  s.email = ["robot.z.jiang@gmail.com"]
  s.files = [".rspec", ".travis.yml", "CODE_OF_CONDUCT.md", "Gemfile", "Gemfile.lock", "LICENSE.txt", "README.md", "Rakefile", "bin/console", "bin/setup", "huanxin.gemspec", "lib/huanxin.rb", "lib/huanxin/base.rb", "lib/huanxin/chat_room.rb", "lib/huanxin/client.rb", "lib/huanxin/group.rb", "lib/huanxin/version.rb"]
  s.homepage = "https://github.com/RobotJiang/ruby-for-huanxin"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5"
  s.summary = "Huanxin Rest API for Ruby Client"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.8"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.0"])
      s.add_development_dependency(%q<httparty>, ["~> 0.13.3"])
      s.add_development_dependency(%q<activesupport>, ["~> 4.0.1"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.8"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<rspec>, ["~> 3.0"])
      s.add_dependency(%q<httparty>, ["~> 0.13.3"])
      s.add_dependency(%q<activesupport>, ["~> 4.0.1"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.8"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<rspec>, ["~> 3.0"])
    s.add_dependency(%q<httparty>, ["~> 0.13.3"])
    s.add_dependency(%q<activesupport>, ["~> 4.0.1"])
  end
end
