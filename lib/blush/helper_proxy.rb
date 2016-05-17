module Blush
  class HelperProxy
    def method_missing(method, *args, &block)
      Blush.view_context.send(method, *args, &block)
    end
  end
end
