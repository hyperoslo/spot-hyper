class Spot < ApplicationRecord
  default_scope { order(created_at: :desc) }
  before_create :create_tags, :cleanup_text
  after_create_commit { UpdateStatusJob.perform_later(self) unless new_today? }

  def has_tags?
    text.scan(/\B#\w+/).length > 0
  end

  def cleanup_text
    self.text = text.gsub(/\B#\w+/, '')
  end

  def create_tags
    self.tags = text.scan(/\B#\w+/).map{ |tag| tag.gsub('#', '') } if has_tags?
  end

  private

  def new_today?
    Spot.where("created_at >= ?", Time.zone.now.beginning_of_day).blank?
  end
end
