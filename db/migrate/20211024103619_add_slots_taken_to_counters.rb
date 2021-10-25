class AddSlotsTakenToCounters < ActiveRecord::Migration[5.2]
  def change
    add_column :counters, :slots_taken, :integer
  end
end
