module Blush

  ##
  # Proxy helper methods to the view context
  class HelperProxy
    def method_missing(method, *args, &block)
      Blush.view_context.send(method, *args, &block)
    end
  end

end
