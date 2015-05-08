source 'https://rubygems.org'

gem 'puppet', (ENV['PUPPET_VERSION'] || '~> 4.0.0')

# FIXME: This code enables the future parser, but should probably be done a a
# different level... rake perhaps?
ENV['FUTURE_PARSER'] = 'yes'

# Lots internals have changed since rspec-puppet v1.0. Tracking GitHub refs
# so that 4x function support can be contributed back once it is solid.
gem 'rspec-puppet', :github => 'rodjek/rspec-puppet', :ref => '28c29d0'

group :test do
  gem 'puppetlabs_spec_helper', '~> 0.8.0'
end

eval_gemfile "#{__FILE__}.local" if File.exists? "#{__FILE__}.local"
