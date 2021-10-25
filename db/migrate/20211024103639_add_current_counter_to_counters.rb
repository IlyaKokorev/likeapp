class AddCurrentCounterToCounters < ActiveRecord::Migration[5.2]
  def change
    add_column :counters, :current_counter, :integer
  end
end
