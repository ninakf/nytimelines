class AddCreatorToTimelines < ActiveRecord::Migration
  def change
    add_column :timelines, :creator, :string
  end
end
