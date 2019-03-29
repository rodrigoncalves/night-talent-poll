class Poll < ApplicationRecord

  def self.valid_votes
    Poll.where.not(team_id: nil).sum(:value)
  end

  def self.votes_count
    Poll.where.not(team_id: nil).count
  end

end
