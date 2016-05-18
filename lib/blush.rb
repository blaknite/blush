require 'blush/configuration'
require 'blush/has_presenter'
require 'blush/helper_proxy'
require 'blush/presenter'
require 'blush/view_context'

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
  module_function def view_context=(view_context)
    @view_context = view_context
  end

  ##
  # Get the cached view context
  module_function def view_context
    @view_context ||= ApplicationController.helpers
  end

end

ActiveRecord::Base.send :extend, Blush::HasPresenter
ActionController::Base.send :include, Blush::ViewContext
ActionMailer::Base.send :include, Blush::ViewContext
