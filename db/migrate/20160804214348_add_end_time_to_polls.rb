class AddEndTimeToPolls < ActiveRecord::Migration[5.0]
  def change
    add_column :polls, :end_time, :Date
  end
end
