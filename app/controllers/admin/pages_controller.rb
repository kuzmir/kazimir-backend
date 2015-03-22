class Admin::PagesController < Admin::AdminController

  before_action :find_page, except: [:index, :new, :create]

  def index
    @pages = Page.all
  end

  def show
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new page_params

    if @page.save
      redirect_to admin_pages_path, notice: "Page has been created!"
    else
      flash.now[:error] = "Could not create page, please check the form and try again."
      render action: "new"
    end

  end

  def edit
  end

  def update
		if @page.update_attributes(page_params)
			redirect_to admin_pages_path, notice: 'Page was successfully updated.'
		else
      flash.now[:error] = "Could not create page, please check the form and try again."
			render :action => "edit"
		end
	end

  def destroy
		@page.destroy
		redirect_to admin_pages_path
	end

  private
    def page_params
      params.require(:page).permit(:title_en, :title_pl, :subtitle_en, :subtitle_pl, :description_en, :description_pl, :introduction_en, :introduction_pl, :content_en, :content_pl, :aside_en, :aside_pl, :footnotes_en, :footnotes_pl, :slug_en, :slug_pl)
    end

    def find_page
      @page = Page.find params[:id]
    end

end
