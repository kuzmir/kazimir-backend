class StreetsController < ApplicationController
  def index
    @streets = Street.all
    respond_to do |format|
      format.html # index.html.erb
      format.json
    end
  end

  def show
    @street = Street.find(params[:id])
    respond_to do |format|
      format.html
      format.json
    end
  end
end
