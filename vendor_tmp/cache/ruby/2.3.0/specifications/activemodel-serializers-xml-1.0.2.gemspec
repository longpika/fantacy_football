# -*- encoding: utf-8 -*-
# stub: activemodel-serializers-xml 1.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "activemodel-serializers-xml"
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Rails team"]
  s.date = "2017-08-16"
  s.email = ["security@rubyonrails.com"]
  s.homepage = "http://github.com/rails/activemodel-serializers-xml"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "XML serialization for your Active Model objects and Active Record models - extracted from Rails"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, ["> 5.x"])
      s.add_runtime_dependency(%q<activemodel>, ["> 5.x"])
      s.add_runtime_dependency(%q<builder>, ["~> 3.1"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<activerecord>, ["> 5.x"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
    else
      s.add_dependency(%q<activesupport>, ["> 5.x"])
      s.add_dependency(%q<activemodel>, ["> 5.x"])
      s.add_dependency(%q<builder>, ["~> 3.1"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<activerecord>, ["> 5.x"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
    end
  else
    s.add_dependency(%q<activesupport>, ["> 5.x"])
    s.add_dependency(%q<activemodel>, ["> 5.x"])
    s.add_dependency(%q<builder>, ["~> 3.1"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<activerecord>, ["> 5.x"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
  end
end
