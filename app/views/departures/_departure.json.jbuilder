json.extract! departure, :id, :time_stamp, :origin, :trip, :destination, :scheduled_time, :lateness, :track, :status, :created_at, :updated_at
json.url departure_url(departure, format: :json)
