class AddsMapPathToStreets < ActiveRecord::Migration
  def change

    add_column :streets, :path, :text

  end
end
