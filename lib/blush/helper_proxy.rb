module Blush

  ##
  # Proxy helper methods to the view context
  class HelperProxy
    def initialize(view_context)
      @view_context = view_context
    end

    def method_missing(method, *args, &block)
      @view_context.send(method, *args, &block)
    end
  end

end
