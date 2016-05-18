module Blush
  module HasPresenter
    def has_presenter(accessor_name = {}, options = nil)
      class_attribute :blush_options

      options, accessor_name = accessor_name, options unless options
      self.blush_options = options

      define_method(accessor_name || Blush.config.accessor_name) do
        @presenter ||= (self.blush_options[:class] || "#{self.model_name}Presenter".constantize).new(self)
      end

      define_method(self.blush_options[:helper_name] || Blush.config.helper_name) do |method, *args, &block|
        presenter.try(method, *args, &block) || send(method, *args, &block)
      end
    end
  end
end
