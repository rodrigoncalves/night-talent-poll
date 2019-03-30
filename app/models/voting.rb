class Voting < ApplicationRecord
    enum status: { wait: 0, open: 1, closed: 2 }
end
