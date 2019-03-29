class Poll < ApplicationRecord

  def self.valid_votes
    Poll.where.not(team_id: nil).sum(:value)
  end
end
