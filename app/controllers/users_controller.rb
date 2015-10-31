class UsersController < ApplicationController
  def register
    user = User.create!(name: params[:name], push_register_id: params[:push_register_id])

    render json: { id: user.id }
  end

  def show
  end

  def beer
  end

  def index
    render json: User.json_collection
  end

  def update
    user = User.find(params[:id])

    user.updates.create({
      latitude: params[:latitude],
      longitude: params[:longitude],
    })

    render nothing: true
  end

  def push
    user = User.find(params[:id])
    beer_tender = BeerTender.first

    PushNotification.new.push(user.push_register_id, beer_tender.id)

    render nothing: true
  end
end
