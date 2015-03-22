class Page < ActiveRecord::Base

  validates :title_en, presence: true
  validates :content_en, presence: true

  translates :title, :subtitle, :description, :introduction, :content, :aside, :footnotes, :slug


  ## finders

  def self.find_by_locale_slug slug

    locale = I18n.locale

    where("slug_#{locale} = ?", slug)

  end


end
