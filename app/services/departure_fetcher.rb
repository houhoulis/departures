require 'csv'
require 'net/http'

class DepartureFetcher
  attr_reader :data
  @last_called = Time.zone.now

  URL = URI("http://developer.mbta.com/lib/gtrtfs/Departures.csv")

  def self.call
    return if Time.zone.now < @last_called + 1.minute
    @last_called = Time.zone.now

    new.call
  end

  def call
    Rails.logger.info "#{self.class} destroying #{Departure.count} Departures."
    Departure.destroy_all

    @data = StringIO.new(import_feed URL)

    create_departures
  end

  def import_feed url = URL
    Net::HTTP.get url
  end

  def create_departures
    departures = CSV.parse data.read
    header_row = departures.shift

    Rails.logger.info "#{self.class} creating #{departures.count} Departures at #{Time.now}."
    departures.map do |time_stamp, origin, trip, destination, scheduled_time, lateness, track, status|
      Departure.create! time_stamp: Time.at(time_stamp.to_i),
                        origin: origin,
                        trip: trip,
                        destination: destination,
                        scheduled_time: Time.at(scheduled_time.to_i),
                        lateness: lateness,
                        track: track,
                        status: status
    end
  end
end
