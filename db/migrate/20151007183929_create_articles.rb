class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.string :author
      t.integer :date
      t.integer :timeline_id

      t.timestamps null: false
    end
  end
end
