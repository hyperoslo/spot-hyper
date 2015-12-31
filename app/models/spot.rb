class Spot < ApplicationRecord
  before_create :create_tags
  after_create_commit { UpdateStatusJob.perform_later(self) }

  def has_tags?
    text.scan(/\B#\w+/).length > 0
  end

  def create_tags
    self.tags = text.scan(/\B#\w+/) if has_tags?
  end
end
