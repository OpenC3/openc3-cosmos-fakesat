# encoding: ascii-8bit

# Copyright 2026 OpenC3, Inc.
# All Rights Reserved.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See LICENSE.md for more details.

spec = Gem::Specification.new do |s|
  s.name = 'openc3-cosmos-fakesat'
  s.summary = 'Fakesat'
  s.description = "Fakesat plugin facilitating COSMOS user training"
  s.license = 'OpenC3'
  s.authors = ['Ryan Melton', 'Jason Thomas']
  s.email = ['support@openc3.com']
  s.homepage = 'https://github.com/OpenC3/openc3-cosmos-fakesat'
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 3.0.0'
  s.metadata = {
    "openc3_store_keywords" => "fakesat,training",
    "source_code_uri" => "https://github.com/OpenC3/openc3-cosmos-fakesat",
  }
  if ENV['VERSION']
    s.version = ENV['VERSION'].dup
  else
    time = Time.now.strftime("%Y%m%d%H%M%S")
    s.version = '0.0.0' + ".#{time}"
  end
  s.files = Dir.glob("{targets,lib,public,microservices}/**/*") + %w(Rakefile LICENSE.md README.md plugin.txt)
end
