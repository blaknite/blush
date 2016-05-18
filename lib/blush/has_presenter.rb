module Blush

  ##
  # Tell a model that it has a presenter
  #
  # This is included in all models
  #
  # Use with defaults:
  #  has_presenter
  #
  # Use with custom accessor:
  #  has_presenter :accessor_name
  #
  # Use with options:
  #  has_presenter { class: 'ThingPresenter', helper_name: :foo }
  module HasPresenter
    def has_presenter(accessor_name = {}, options = nil)
      class_attribute :blush_options

      options, accessor_name = accessor_name, options unless options
      self.blush_options = options
      self.blush_options[:accessor_name] = accessor_name || Blush.config.accessor_name

      # defines the accessor
      define_method(self.blush_options[:accessor_name]) do
        accessor_name = "@#{self.blush_options[:accessor_name]}"
        presenter_class = (self.blush_options[:class] || "#{self.model_name}Presenter").constantize
        instance_variable_get(accessor_name) || instance_variable_set(accessor_name, presenter_class.new(self))
      end

      # defines the helper
      define_method(self.blush_options[:helper_name] || Blush.config.helper_name) do |method, *args, &block|
        presenter.try(method, *args, &block) || send(method, *args, &block)
      end
    end
  end

end
