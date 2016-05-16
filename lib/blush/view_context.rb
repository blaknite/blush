module Blush
  module ViewContext
    def view_context
      super.tap do |context|
        Blush.helpers = context
      end
    end
  end
end
