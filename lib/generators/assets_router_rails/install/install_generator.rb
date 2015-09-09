require "rails"

module AssetsRouterRails
  class InstallGenerator < ::Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    argument :opts, :type => 'array', :default => ['script:coffeescript', 'style:sass']

    def defaults
      {
        :script => 'coffeescript',
        :style  => 'sass'
      }
    end

    def pattern
      {
        :script => ['coffeescript', 'javascript'],
        :style  => ['scss', 'sass']
      }
    end

    def parse_args
      @opts = Hash[opts.join(' ').scan(/([^:\s]+)(?::(\S+))?/)]
      @opts = @opts.with_indifferent_access
      @opts = @opts.reverse_merge(defaults)
      @opts.each do |k, v|
        @opts[k] = defaults[k] unless pattern[k.to_sym].include? v
      end
    end

    def copy_views
      copy_file 'views/layouts/application.html.slim', 'app/views/layouts/application.html.slim'
    end

    def copy_javascripts
      remove_file 'app/assets/javascripts/application.js'
      directory 'javascripts', 'app/assets/javascripts'
    end

    def copy_stylesheets
      remove_file 'app/assets/stylesheets/application.css'
      directory 'stylesheets', 'app/assets/stylesheets'
    end
  end
end
