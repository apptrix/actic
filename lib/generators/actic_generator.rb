module Actic
  module Generator

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
    def next_migration_number(dirname)
      if ActiveRecord::Base.timestamped_migrations
        Time.now.utc.strftime("%Y%m%d%H%M%S")
      else
        "%.3d" % (current_migration_number(dirname) + 1)
      end
    end
    end

    private
    def file_name
      name.underscore
    end

    def table_name
      name.tableize
    end

    def format_attributes(attrs)
      fat = []
      a   = attrs
      b   = a.split
      b.each { |c|
        d = c.split(':')
        e = {:name => d[0], :type => d[1]}
        fat << e
      }
      fat
    end
  end
end