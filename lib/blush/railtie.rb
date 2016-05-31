module Blush
  class Railtie < Rails::Railtie
    config.after_initialize do |app|
      app.config.paths.add 'app/presenters', eager_load: true
    end

    initializer "blush.setup_action_controller" do |app|
      ActiveSupport.on_load :action_controller do
        self.class_eval do
          include Blush::ViewContext

          before_action :activate_blush
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
