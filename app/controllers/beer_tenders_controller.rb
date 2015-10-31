class BeerTendersController < ApplicationController
  def index
    beer_tenders = BeerTender.all

    render json: beer_tenders.map(&:last_update_json)
  end

  def show
    beer_tender = BeerTender.find(params[:id])

    render json: beer_tender.updates_json
  end
end
