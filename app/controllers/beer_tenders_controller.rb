class BeerTendersController < ApplicationController
  def index
    beer_tenders = BeerTender.all

    render json: beer_tenders.map(&:index_json)
  end

  def show
    beer_tender = BeerTender.find(params[:id])

    render json: beer_tender.show_json
  end
end
