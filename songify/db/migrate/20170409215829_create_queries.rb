class CreateQueries < ActiveRecord::Migration[5.0]
  def change
    create_table :queries do |t|
      t.string :title
      t.integer :search_count

      t.timestamps null: false
    end
  end
end
