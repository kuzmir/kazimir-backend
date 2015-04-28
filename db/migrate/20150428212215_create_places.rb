class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|

      t.string :name, null: false
      t.text :description
      t.string :place_type, null: false

      t.belongs_to :street

      t.timestamps
    end
  end
end
