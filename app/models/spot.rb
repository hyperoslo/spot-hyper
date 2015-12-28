class Spot < ApplicationRecord
  after_commit_create :create_tags

  def has_tags?
    text.scan(/\B#\w+/).length > 0
  end

  def create_tags
    self.tags = text.scan(/\B#\w+/) if has_tags?
  end
end
