module Blush
  class Railtie < Rails::Railtie
    initializer "blush.setup_action_controller" do |app|
      ActiveSupport.on_load :action_controller do
        self.class_eval do
          include Blush::ViewContext

          before_action :set_blush_helpers
        end
      end
    end

    initializer "blush.setup_action_mailer" do |app|
      ActiveSupport.on_load :action_mailer do
        self.class_eval do
          include Blush::ViewContext
        end
      end
    end

    initializer "blush.setup_orm" do |app|
      ActiveSupport.on_load :active_record do
        self.class_eval do
          extend Blush::HasPresenter
        end
      end
    end
  end
end
