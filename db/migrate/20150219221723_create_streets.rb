class CreateStreets < ActiveRecord::Migration
  def change
    create_table :streets do |t|

      # street will have name
      t.string :name, null: false

      # current description of the street
      t.text :description, null: false

      # past (historic) description of the field
      t.text :past_description, null: false

      # flag, if the street is displayed
      t.boolean :active, null: false, default: false  

      t.timestamps null: false
    end
  end
end
