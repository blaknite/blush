require 'blush/configuration'
require 'blush/has_presenter'
require 'blush/presenter'

module Blush
  module_function def config
    @config ||= Blush::Configuration.new
  end

  module_function def helpers
    @helpers ||= ActionView::Base.new
  end
end

ActiveRecord::Base.send :extend, Blush::HasPresenter
