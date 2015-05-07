class AddsTranslationsToPlaces < ActiveRecord::Migration
  def up

    ## rename columns to names with suffixes
    rename_column :places, :name, :name_en
    rename_column :places, :description, :description_en

    ## Add columns for polish translations
    add_column :places, :name_pl, :string, after: :name_en
    add_column :places, :description_pl, :text, after: :description_en

  end

  def down

    ## rename columns to generic names
    rename_column :places, :name_en, :name
    rename_column :places, :description_en, :description

    ## Remove pl columns
    remove_columns :places, :name_pl
    remove_columns :places, :description_pl

  end
end
