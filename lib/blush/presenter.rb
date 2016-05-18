module Blush

  ##
  # The base presenter class. All presenters should inherit from this.
  class Presenter
    attr_accessor :object

    def initialize(object)
      @object = object
    end

    ##
    # Alias o to object for convenience
    alias_method :o, :object

    ##
    # Access helpers from the view context through HelperProxy
    def helpers
      Blush.helpers
    end

    ##
    # Alias h to helpers for convenience
    alias_method :h, :helpers

    ##
    # Alias localize to helpers.localize for convenience
    def localize
      helpers.localize
    end

    ##
    # Alias l to localize for convenience
    alias_method :l, :helpers
  end

end
