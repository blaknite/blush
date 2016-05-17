module Blush
  class Presenter
    attr_accessor :object

    def initialize(object)
      @object = object
    end

    alias_method :o, :object

    def helpers
      @helpers ||= Blush::HelperProxy.new
    end

    alias_method :h, :helpers

    def localize
      helpers.localize
    end

    alias_method :l, :helpers
  end
end
