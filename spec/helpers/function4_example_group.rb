require 'puppet/pops'
require 'puppet/loaders'

module RSpec::Puppet
  module Function4ExampleGroup
    # Inherit all behaviors of the existing function example group. We'll
    # override what needs to change.
    #
    # FIXME: This is extremely dangerous. and brittle.
    include FunctionExampleGroup

    # This adapter object conforms a 4x function to part of the interface
    # presented by a 3x function. This is a gross hack, but it allows us to
    # avoid re-implementing the FunctionMatchers for the time being.
    #
    # Components conformed:
    #
    #   - The scope attribute
    #   - The name attribute
    #   - The call method
    #
    # The wrapped 4x function is available via the `function` attribute.
    Function4Adapter = Struct.new(:function, :scope, :name) do
      def call(args)
        # Ensure that the arguments are wrapped in an enclosing array. This
        # allows:
        #
        #   - Calling the Function in the 3x manner: call([arg_one, arg_two])
        #   - Calling the Function in the 4x manner: call(arg_one, arg_two)
        function.call(scope, *Array(args))
      end
    end

    def subject
      function_name = self.class.top_level_description.downcase

      vardir = setup_puppet

      node_name = nodename(:function)
      function_scope = scope(compiler, node_name)

      # FIXME: Is this the most reliable way of determining the module root?
      mod_root = File.expand_path('../../..', __FILE__)
      # This is ugly... but the Puppet::Module **HAS** to be constructed with a
      # name that matches the top level module namespace. The module root
      # directory could be named anything, so we create a trow-away module
      # object in order to parse the name out of the metadata.
      mod = Puppet::Module.new('zomgwhoknows', mod_root, function_scope.environment)
      # TODO: Ensure this matches the logic that the Puppet Module tool uses to
      # generate module names.
      # FIXME: Throw an error if we don't have a sane name.
      mod_name = mod.forge_name.gsub('/', '-').split('-', 2).last


      loader = function_scope.compiler.loaders.public_loader_for_module(mod_name)

      # Return the method instance for the function.  This can be used with
      # method.call
      function = loader.load(:function, function_name)
      FileUtils.rm_rf(vardir) if File.directory?(vardir)

      return nil if function.nil?
      Function4Adapter.new(function, function_scope, function_name)
    end

  end
end
