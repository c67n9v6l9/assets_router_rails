require "rails"

module AssetsRouterRails
  class ControllerGenerator < ::Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    argument :opts, :type => 'array'

    def parse_args
      @controller_name = opts.shift
      @action_names = opts
    end

    # javascript
    def copy_controller
      action_template = ''

      create_file "app/assets/javascripts/controllers/#{@controller_name}_controller.coffee" do
        template = ''
        template += "Settings = @NS.Settings\n\n"
        template += "class #{@controller_name.capitalize}Controller extends @NS.Controller.application\n"
        template += "@NS.Controller = @NS.Controller || {}\n"
        template += "@NS.Controller.#{@controller_name} = #{@controller_name.capitalize}Controller\n"
        template
      end

      @action_names.each do |action_name|
        action_template += "  #{action_name}: ->\n\n"
      end

      case self.behavior
      when :invoke
        insert_into_file "app/assets/javascripts/controllers/#{@controller_name}_controller.coffee", action_template, :before => "@NS.Controller = @NS.Controller || {}\n"
      when :revoke
      end
    end

    def append_router
      append_file 'app/assets/javascripts/config/routes.coffee' do
        template = ''
        @action_names.each do |action_name|
          if action_name == 'index'
            template += "router.add '/#{@controller_name}', '#{@controller_name}##{action_name}'\n"
          else
            template += "router.add '/#{@controller_name}/#{action_name}', '#{@controller_name}##{action_name}'\n"
          end
        end

        template
      end
    end

    # stylesheet
    def create_stylesheet_directory
      empty_directory "app/assets/stylesheets/page/#{@controller_name}"
      @action_names.each do |action_name|
        create_file "app/assets/stylesheets/page/#{@controller_name}/_#{action_name}.sass" do
          "// stylesheets file for #{@controller_name}##{action_name}\n\n.#{@controller_name}_#{action_name}"
        end
      end
    end

    def append_import_css
      append_file 'app/assets/stylesheets/application.css.sass' do
        template = "\n\n"
        @action_names.each do |action_name|
          template += "@import page/#{@controller_name}/#{action_name}\n"
        end

        template
      end
    end

    # image
    def create_image_directory
      empty_directory "app/assets/images/#{@controller_name}"
      empty_directory "app/assets/images/#{@controller_name}/common"
      @action_names.each do |action_name|
        empty_directory "app/assets/images/#{@controller_name}/#{action_name}"
      end
    end
  end
end
