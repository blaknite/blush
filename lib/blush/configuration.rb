module Blush
  class Configuration
    attr_accessor :accessor_name, :helper_name

    def initialize
      @accessor_name = :presenter
      @helper_name = :present
    end
  end
end
