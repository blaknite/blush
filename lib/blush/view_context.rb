module Blush
  module ViewContext
    def view_context
      super.tap do |context|
        Blush.view_context = context
      end
    end
  end
end
