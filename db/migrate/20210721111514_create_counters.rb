class CreateCounters < ActiveRecord::Migration[5.2]
  def change
    create_table :counters do |t|
      t.integer :count, default: 1

      t.timestamps
    end
  end
end
