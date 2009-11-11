module ActionView
  module Helpers
    module PrototypeHelper
      # A wrapper for link_to_remote that returns a link to a remote action if 
      # +condition+ is true.  Otherwise only the name is returned. To specialize the
      # default behavior, you can pass a block that accepts the name or the full
      # argument list for link_to_remote_if.
      def link_to_remote_if(condition, name, options = {}, html_options = nil, &block)
        logger.error "FOOFOOFOO"
        if condition
          link_to_remote(name, options, html_options)
        else
          if block_given?
            block.arity <= 1 ? yield(name) : yield(name, options, html_options)
          else
            name
          end
        end
      end

      # A wrapper for link_to_remote that returns a link to a remote action unless
      # +condition+ is true.  Otherwise only the name is returned.  To specialize
      # the default behavior, you can pass a block that accepts the name or the full
      # argument list for link_to_remote_if
      def link_to_remote_unless(condition, name, options = {}, html_options = nil, &block)
        link_to_remote_if !condition, name, options, html_options, &block
      end
    end
  end
end
