class AddsTranslationFieldsToStreets < ActiveRecord::Migration

  def up

    ## rename columns to names with suffixes
    rename_column :streets, :name, :name_en
    rename_column :streets, :description, :description_en
    rename_column :streets, :past_description, :past_description_en

    ## Add columns for polish translations
    add_column :streets, :name_pl, :string, after: :name_en
    add_column :streets, :description_pl, :text, after: :description_en
    add_column :streets, :past_description_pl, :text, after: :past_description_en

  end

  def down

    ## rename columns to generic names
    rename_column :streets, :name_en, :name
    rename_column :streets, :description_en, :description
    rename_column :streets, :past_description_en, :past_description

    ## Remove pl columns
    remove_columns :streets, :name_pl
    remove_columns :streets, :description_pl
    remove_columns :streets, :past_description_pl

  end
end
