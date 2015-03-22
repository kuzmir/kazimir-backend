class PagesController < ApplicationController

  def index

    @page = Page.find_by_locale_slug(:index).first

    if @page.nil?
      render template: "pages/static/index"
    end

  end

  def static

    # Add here allowed page keyword to use as url keys like /pages/about
    # TODO: Refactor to something better when list is bigger than 1 line ;-)
    allowed_pages = [:about]

    if allowed_pages.include? params[:page].to_sym
      render template: "pages/static/#{params[:page]}"
    else
      render plain: "404 not found", status: 404
    end


  end

end
