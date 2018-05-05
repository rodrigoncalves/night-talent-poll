class Poll < ApplicationRecord

  def self.valid_votes
    Poll.where.not(team_id: nil).count
  end
end
