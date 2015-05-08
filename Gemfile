source 'https://rubygems.org'

gem 'puppet', (ENV['PUPPET_VERSION'] || '~> 4.0.0')

# FIXME: This code enables the future parser, but should probably be done a a
# different level... rake perhaps?
ENV['FUTURE_PARSER'] = 'yes'

group :test do
  gem 'rspec', '~> 3.0'
  gem 'rspec-puppet', '~> 2.1.0'
  gem 'puppetlabs_spec_helper', '~> 0.10.0'
end

eval_gemfile "#{__FILE__}.local" if File.exists? "#{__FILE__}.local"
