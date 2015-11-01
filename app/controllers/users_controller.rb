class UsersController < ApplicationController
  before_filter :get_user, except: [:index, :register]

  def index
    render json: User.json_collection
  end

  def register
    random_calories = 600

    @user = User.create!(name: params[:name], push_register_id: params[:push_register_id], calories: random_calories)

    show
  end

  def show
    # @user.update_health!

    render json: {
      id: @user.id,
      name: @user.name,
      beer_count: @user.beer_count,
      wallet_amount: @user.wallet_amount,
      calories: @user.calories,
      last_update: @user.last_update,
    }
  end

  def health
    begin
      @user.health_auth!(params[:email], params[:password])
      @user.reload
    rescue
    end

    show
  end

  def beer
    @user.beer_count += 1
    @user.save!

    show
  end

  def update
    @user.updates.create({
      latitude: params[:latitude],
      longitude: params[:longitude],
    })

    render nothing: true
  end

  def push
    beer_tender = BeerTender.first

    PushNotification.new.push(@user.push_register_id, beer_tender.id)

    render nothing: true
  end

  private

  def get_user
    @user = User.find(params[:id])
  end
end
