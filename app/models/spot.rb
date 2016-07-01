class Spot < ApplicationRecord
  include Redis::Objects
  AWESOME_VOTES = 10
  has_many :votes
  before_create :create_tags
  after_create_commit { UpdateStatusJob.perform_later(self) unless new_today? }

  set :voter_ips
  counter :votes_count

  def create_tags
    self.tags = text.scan(/\B#\w+/).map{ |tag| tag.gsub('#', '') }
  end

  def owner?(request_user_id)
    user_id == request_user_id
  end

  def voted?(ip)
    voter_ips.member?(ip.to_s)
  end

  private

  def new_today?
    Spot.where("created_at >= ?", Time.zone.now.beginning_of_day).blank?
  end
end
