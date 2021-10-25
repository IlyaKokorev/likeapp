class AddLockVersionToCounters < ActiveRecord::Migration[5.2]
  def change
    add_column :counters, :lock_version, :integer
  end
end
