class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|

      t.string :title
      t.string :subtitle
      t.string :description

      t.text :introduction
      t.text :content
      t.text :aside
      t.text :footnotes

      t.string :slug

      t.timestamps null: false
    end

    add_index :pages, :slug

  end
end
