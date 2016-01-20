class DeclareAwesomeSpotsJob < ApplicationJob
  def perform
    Spot.where("created_at >= ?", 12.hours.ago.utc).all.map do |spot|
      if spot.votes_count > Spot::AWESOME_VOTES
        spot.awesome == true
        spot.save
      end
    end
  end
end
