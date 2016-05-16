require 'blush/configuration'
require 'blush/has_presenter'
require 'blush/helper_proxy'
require 'blush/presenter'
require 'blush/view_context'

module Blush
  module_function def config
    @config ||= Blush::Configuration.new
  end

  module_function def helpers=(view_context)
    @helpers = view_context
  end

  module_function def helpers
    @helpers ||= ApplicationController.helpers
  end
end

ActiveRecord::Base.send :extend, Blush::HasPresenter
ActionController::Base.send :include, Blush::ViewContext
