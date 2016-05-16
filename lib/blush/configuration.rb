module Blush
  class Configuration
    attr_accessor :accessor_name

    def initialize
      @accessor_name = :presenter
    end
  end
end
