source 'https://rubygems.org'

gem 'puppet', (ENV['PUPPET_VERSION'] || '~> 3.7.0')

group :test do
  gem 'puppetlabs_spec_helper', '~> 0.8.0'
end

eval_gemfile "#{__FILE__}.local" if File.exists? "#{__FILE__}.local"
