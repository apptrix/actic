module Actic
  module Generators
    class ActicGenerator < Rails::Generators::NamedBase
      namespace "actic"
      source_root File.expand_path("../templates", __FILE__)

      desc "Generates a model with the given NAME (if one does not exist) with actic " <<
           "configuration plus a migration file and actic routes."

      hook_for :orm

      def add_actic_routes
        route "actic_for :#{table_name}"
      end
    end
  end
end