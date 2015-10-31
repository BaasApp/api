require './config/boot'
require './config/environment'

module Clockwork
  every(1.minute, 'beer_tenders.load_updates') { BeerTender.load_updates }
end
