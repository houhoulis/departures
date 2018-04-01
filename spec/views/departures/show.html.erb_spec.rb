require 'rails_helper'

RSpec.describe "departures/show", type: :view do
  before(:each) do
    @departure = assign(:departure, Departure.create!(
      :origin => "Origin",
      :trip => "Trip",
      :destination => "Destination",
      :lateness => 2,
      :track => "Track",
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Origin/)
    expect(rendered).to match(/Trip/)
    expect(rendered).to match(/Destination/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Track/)
    expect(rendered).to match(/Status/)
  end
end
