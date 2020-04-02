class ChangeTripTrailstoTripsTrails < ActiveRecord::Migration[5.1]
  def change
    rename_table :trip_trails, :trips_trails
  end
end
