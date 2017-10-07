class StreetsController < ApplicationController
  def index
    @streets = Street.includes(:places).all
    respond_to do |format|
      format.html # index.html.erb
      format.json {
        response.headers['Access-Control-Allow-Origin'] = '*'
      }
    end
  end

  def show
    @street = Street.includes(:places).find(params[:id])
    respond_to do |format|
      format.html
      format.json {
        response.headers['Access-Control-Allow-Origin'] = '*'
      }
    end
  end
end
