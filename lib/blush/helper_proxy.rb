module Blush
  class HelperProxy
    def method_missing(method, *args, &block)
      Blush.helpers.send(method, *args, &block)
    end
  end
end
