module Blush

  ##
  # Hooks into controllers and mailers to get the curret view context
  module ViewContext
    ##
    # Taps into the call to view_context to caches it
    def view_context
      super.tap do |context|
        Blush.view_context = context
      end
    end

    ##
    # Sets the cached view_context
    def activate_blush
      Blush.view_context = view_context
    end
  end

end
