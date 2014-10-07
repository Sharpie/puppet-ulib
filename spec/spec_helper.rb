require 'puppetlabs_spec_helper/module_spec_helper'
require 'helpers/function4_example_group'

# TODO: Stabilize this, clean it up and submit it upstream to rspec-puppet.
RSpec::configure do |c|
  c.include RSpec::Puppet::Function4ExampleGroup, :type => :puppet4_function, :example_group => {
    :file_path => c.escaped_path(%w[spec functions4])
  }
end
