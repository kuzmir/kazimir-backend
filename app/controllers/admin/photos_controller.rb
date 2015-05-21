class Admin::PhotosController < Admin::AdminController

  before_action :find_place
  before_action :find_photo, except: [:index, :new, :create]

  def index
    @photo = Photo.new
  end

  def show

  end

  def create
    @photo = Photo.new photo_params
    @photo.place = @place

    if @photo.save
      redirect_to admin_place_photos_path(@place), notice: "Photo has been created!"
    else
      flash.now[:error] = "Could not create photo, please check the form and try again."
      render action: "index"
    end
  end

  def edit
  end

  def update
		if @photo.update_attributes(photo_params)
			redirect_to admin_place_photos_path(@place), notice: 'Photo was successfully updated.'
		else
      flash.now[:error] = "Could not create photo, please check the form and try again."
			render :action => "edit"
		end
	end

  def destroy
		@photo.destroy
		redirect_to admin_place_photos_path(@place)
	end

  private
    def photo_params
      params.require(:photo).permit(:title, :description, :image)
    end

    def find_place
      @place = Place.find params[:place_id]
    end

    def find_photo
      @photo = @place.photos.find params[:id]
    end

end
