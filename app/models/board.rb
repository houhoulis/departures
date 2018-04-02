class Board < ApplicationRecord
  def departures
    Departure.where origin: self.location
  end
end
