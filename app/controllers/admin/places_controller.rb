class Admin::PlacesController < Admin::AdminController

  before_action :find_street
  before_action :find_place, except: [:index, :new, :create]

  def index
    @places = @street.places
  end

  def show
  end

  def new
    @place = new_place_from_params
  end

  def create
    @place = Place.new place_params
    @place.street = @street

    if @place.save
      redirect_to admin_street_path(@street), notice: "Place has been created!"
    else
      flash.now[:error] = "Could not create place, please check the form and try again."
      render action: "new"
    end

  end

  def edit
  end

  def update
		if @place.update_attributes(place_params)
			redirect_to admin_street_path(@street), notice: 'Place was successfully updated.'
		else
      flash.now[:error] = "Could not create place, please check the form and try again."
			render :action => "edit"
		end
	end

  def destroy
		@place.destroy
		redirect_to admin_street_path(@street)
	end

  private
    def place_params
      params.require(:place).permit(:place_type, :name_en, :name_pl, :description_en, :description_pl)
    end

    def find_street
      @street = Street.find params[:street_id]
    end

    def find_place
      @place = @street.places.find params[:id]
    end

    def new_place_from_params

      place = Place.new

      if params[:place_type] == Place::PRESENT.to_s
        place.place_type = Place::PRESENT
      elsif params[:place_type] == Place::PAST.to_s
        place.place_type = Place::PAST
      end

      return place

    end

end
