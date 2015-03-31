class AddsTranslationsToPages < ActiveRecord::Migration

  def up

    ## rename columns to names with suffixes
    rename_column :pages, :title, :title_en
    rename_column :pages, :subtitle, :subtitle_en
    rename_column :pages, :description, :description_en

    rename_column :pages, :introduction, :introduction_en
    rename_column :pages, :content, :content_en
    rename_column :pages, :aside, :aside_en
    rename_column :pages, :footnotes, :footnotes_en

    ## remove default index, rename slug & create new index
    remove_index :pages, :slug
    rename_column :pages, :slug, :slug_en
    add_index :pages, :slug_en, unique: true

    ## Add columns for polish translations
    add_column :pages, :title_pl, :string, after: :title_en
    add_column :pages, :subtitle_pl, :string, after: :subtitle_en
    add_column :pages, :description_pl, :string, after: :description_en

    add_column :pages, :introduction_pl, :text, after: :introduction_en
    add_column :pages, :content_pl, :text, after: :content_en
    add_column :pages, :aside_pl, :text, after: :aside_en
    add_column :pages, :footnotes_pl, :text, after: :footnotes_en

    add_column :pages, :slug_pl, :string, after: :slug_en
    add_index :pages, :slug_pl, unique: true

  end

  def down

    ## remove indexes
    remove_index :pages, :slug_pl
    remove_index :pages, :slug_en

    ## restore old names
    rename_column :pages, :title_en, :title
    rename_column :pages, :subtitle_en, :subtitle
    rename_column :pages, :description_en, :description

    rename_column :pages, :introduction_en, :introduction
    rename_column :pages, :content_en, :content
    rename_column :pages, :aside_en, :aside
    rename_column :pages, :footnotes_en, :footnotes

    rename_column :pages, :slug_en, :slug

    ## restore old index
    add_index :pages, :slug, unique: true

    ## remove old colu,ns
    remove_columns :pages, :title_pl
    remove_columns :pages, :subtitle_pl
    remove_columns :pages, :description_pl

    remove_columns :pages, :introduction_pl
    remove_columns :pages, :content_pl
    remove_columns :pages, :aside_pl
    remove_columns :pages, :footnotes_pl

    remove_columns :pages, :slug_pl

  end

end
