module Blush

  ##
  # Hooks into controllers and mailers to get the curret view context
  module ViewContext
    ##
    # Taps into the call to view_context to caches it
    def view_context
      super.tap do |context|
        set_blush_helpers(context)
      end
    end

    ##
    # Sets the cached helper proxy based on the given view_context
    def set_blush_helpers(context = nil)
      context ||= view_context
      Blush.helpers = Blush::HelperProxy.new(context)
    end
  end

end
