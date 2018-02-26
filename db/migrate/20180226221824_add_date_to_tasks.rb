class AddDateToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column(:tasks, :date, :date)
    add_column(:tasks, :time, :time)
  end
end
