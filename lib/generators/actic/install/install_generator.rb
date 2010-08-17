require 'active_support/secure_random'

module Actic
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "Creates an Actic initializer and copy locale files to your application."
      class_option :orm

      def copy_initializer
        template "actic.rb", "config/initializers/actic.rb"
      end

      def copy_locale
        copy_file "../../../../../config/locales/en.yml", "config/locales/actic.en.yml"
      end

      def show_readme
        readme "README"
      end
    end
  end
end