class Admin::StreetsController < Admin::AdminController

  def index
    @streets = Street.all
  end

end
