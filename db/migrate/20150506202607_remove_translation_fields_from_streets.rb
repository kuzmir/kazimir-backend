class RemoveTranslationFieldsFromStreets < ActiveRecord::Migration

  def up

    ## rename columns to generic names
    rename_column :streets, :name_en, :name
    change_column :streets, :name, :string, :null => false

    # remove not needed columns
    remove_column :streets, :description_en
    remove_column :streets, :past_description_en

    ## Remove pl columns
    remove_column :streets, :name_pl
    remove_column :streets, :description_pl
    remove_column :streets, :past_description_pl

  end

  def down

    raise ActiveRecord::IrreversibleMigration, "Can't recover the deleted fields"

  end


end
