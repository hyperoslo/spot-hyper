class Spot < ApplicationRecord
  default_scope { where("created_at >= ?", 2.days.ago.utc).order(created_at: :desc) }
  before_create :create_tags
  after_create_commit { UpdateStatusJob.perform_later(self) unless new_today? }

  def create_tags
    self.tags = text.scan(/\B#\w+/).map{ |tag| tag.gsub('#', '') }
  end

  def owner?(request_user_id)
    user_id == request_user_id
  end

  private

  def new_today?
    Spot.where("created_at >= ?", Time.zone.now.beginning_of_day).blank?
  end
end
