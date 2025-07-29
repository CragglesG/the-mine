class CreatePaths < ActiveRecord::Migration[8.0]
  def change
    create_table :paths do |t|
      t.string :name

      t.timestamps
    end
  end
end
