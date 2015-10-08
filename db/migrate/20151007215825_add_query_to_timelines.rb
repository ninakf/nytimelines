class AddQueryToTimelines < ActiveRecord::Migration
  def change
    add_column :timelines, :query, :string
  end
end
