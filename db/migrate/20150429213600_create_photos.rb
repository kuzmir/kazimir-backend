class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|

      t.string :title, null: false
      t.text :description
      t.attachment :image

      t.belongs_to :place

      t.timestamps null: false
    end
  end
end
