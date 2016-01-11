class Spot < ApplicationRecord
  default_scope { where("created_at >= ?", 2.days.ago.utc).order(created_at: :desc) }
  before_create :create_tags, :cleanup_text
  after_create_commit { UpdateStatusJob.perform_later(self) unless new_today? }

  def cleanup_text
    self.text = text.gsub(/\B#\w+/, '')
  end

  def create_tags
    self.tags = text.scan(/\B#\w+/).map{ |tag| tag.gsub('#', '') }
  end

  private

  def new_today?
    Spot.where("created_at >= ?", Time.zone.now.beginning_of_day).blank?
  end
end
