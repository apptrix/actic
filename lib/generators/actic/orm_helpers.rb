module Actic
  module Generators
    module OrmHelpers
      def model_contents
<<-CONTENT
  # Include default ical modules
  actic :ical

CONTENT
      end

      def model_exists?
        File.exists?(File.join(destination_root, model_path))
      end

      def model_path
        @model_path ||= File.join("app", "models", "#{file_path}.rb")
      end
    end
  end
end