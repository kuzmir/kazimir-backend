class Admin::StreetsController < Admin::AdminController

  before_action :find_street, except: [:index, :new, :create]

  def index
    @streets = Street.all
  end

  def show
  end

  def new
    @street = Street.new
  end

  def create
    @street = Street.new street_params

    if @street.save
      redirect_to admin_streets_path, notice: "Street has been created!"
    else
      flash.now[:error] = "Could not create street, please check the form and try again."
      render action: "new"
    end

  end

  def edit
  end

  def update
		if @street.update_attributes(street_params)
			redirect_to admin_streets_path, notice: 'Street was successfully updated.'
		else
      flash.now[:error] = "Could not create street, please check the form and try again."
			render :action => "edit"
		end
	end

  def destroy
		@street.destroy
		redirect_to admin_streets_path
	end

  private
    def street_params
      params.require(:street).permit(:name_en, :name_pl, :description_en, :description_pl, :past_description_en, :past_description_pl, :path)
    end

    def find_street
      @street = Street.find params[:id]
    end

end
