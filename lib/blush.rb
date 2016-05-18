require 'blush/configuration'
require 'blush/has_presenter'
require 'blush/helper_proxy'
require 'blush/presenter'
require 'blush/view_context'
require 'blush/railtie'

##
# Wrapper module for Blush
module Blush

  ##
  # Convenient API for accessing Blush's configuration
  #
  # Options include:
  #  Blush.config.accessor_name to set the default accessor on the model
  #  Blush.config.helper_name to set the default helper name on the model
  module_function def config
    @config ||= Blush::Configuration.new
  end

  ##
  # Cache the view context globally
  module_function def helpers=(helper_proxy)
    @helpers = helper_proxy
  end

  ##
  # Get the cached view context
  module_function def helpers
    @helpers ||= Blush::HelperProxy.new(ApplicationController.new.view_context)
  end

end
