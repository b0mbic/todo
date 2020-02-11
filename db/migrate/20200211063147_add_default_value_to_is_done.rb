class AddDefaultValueToIsDone < ActiveRecord::Migration[5.2]
  def change
    change_column_default :tasks, :is_done, from: nil, to: false
  end
end
