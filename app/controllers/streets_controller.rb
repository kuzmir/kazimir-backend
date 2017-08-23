class StreetsController < ApplicationController
  def index
    @streets = Street.all
    respond_to do |format|
      format.html # index.html.erb
      format.json {
        response.headers['Access-Control-Allow-Origin'] = '*'
        render :json => @streets
      }
    end
  end

  def show
    @street = Street.find(params[:id])
    respond_to do |format|
      format.html
      format.json {
        response.headers['Access-Control-Allow-Origin'] = '*'
        render :json => @street
      }
    end
  end
end
