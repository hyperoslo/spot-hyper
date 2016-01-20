class Vote < ApplicationRecord
  belongs_to :spot
  after_create_commit :cache_voter_ip
  after_destroy_commit :delete_voter_ip


  private

  def cache_voter_ip
    spot.voter_ips.add(ip)
    spot.votes_count.increment
  end
  def delete_voter_ip
    spot.voter_ips.delete(ip)
    spot.votes_count.decrement
  end
end
