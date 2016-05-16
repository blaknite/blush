module Blush
  class Presenter
    attr_accessor :object

    def initialize(object)
      @object = object
    end

    def helpers
      Blush.helpers
    end

    alias_method :h, :helpers
  end
end
