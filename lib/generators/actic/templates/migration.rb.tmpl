class CreateComponents < ActiveRecord::Migration
  def self.up
    create_table :calendars do |t|
      t.string :ical

      t.timestamps
    end

    create_table :events do |t|
      t.references :calendar
      t.string :dtstart
      t.string :dtend
      t.string :ical

      t.timestamps
    end

    create_table :patterns do |t|
      t.references :owner, :polymorphic => true
      t.string :type
      t.string :rule
    end

    create_table :journals do |t|
      t.references :calendar
      t.string :dtstart
      t.string :dtend
      t.string :ical
      t.string :categories
      t.string :description

      t.timestamps
    end

    create_table :todos do |t|
      t.references :calendar
      t.string :dtstart
      t.string :dtend
      t.string :ical

      t.timestamps
    end

    create_table :free_busies do |t|
      t.references :calendar
      t.string :dtstart
      t.string :dtend
      t.string :ical

      t.timestamps
    end


  # Alarm components can belong to other 'owner' components
    create_table :alarms do |t|
      t.references :calendar
      t.string :owner_type
      t.integer :owner_id
      t.string :dtstart
      t.string :dtend
      t.string :ical

      t.timestamps
    end
  end

  def self.down
    drop_table :calendars
    drop_table :events
    drop_table :journals
    drop_table :todos
    drop_table :alarms
  end
end

=begin
  def self.up
    create_table :components do |t|
      t.string :type
      t.string :parent_type
      t.integer :parent_id
      t.string :ical

      t.timestamps
    end
  end
=end
