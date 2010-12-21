class CreateDummyResources < ActiveRecord::Migration
  def self.up
    create_table :dummy_resources do |t|
      t.string :suck

      t.timestamps
    end
  end

  def self.down
    drop_table :dummy_resources
  end
end
