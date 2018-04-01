require 'rails_helper'

RSpec.describe "departures/index", type: :view do
  before(:each) do
    assign(:departures, [
      Departure.create!(
        :origin => "Origin",
        :trip => "Trip",
        :destination => "Destination",
        :lateness => 2,
        :track => "Track",
        :status => "Status"
      ),
      Departure.create!(
        :origin => "Origin",
        :trip => "Trip",
        :destination => "Destination",
        :lateness => 2,
        :track => "Track",
        :status => "Status"
      )
    ])
  end

  it "renders a list of departures" do
    render
    assert_select "tr>td", :text => "Origin".to_s, :count => 2
    assert_select "tr>td", :text => "Trip".to_s, :count => 2
    assert_select "tr>td", :text => "Destination".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Track".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
