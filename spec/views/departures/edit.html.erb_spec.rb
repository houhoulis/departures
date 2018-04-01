require 'rails_helper'

RSpec.describe "departures/edit", type: :view do
  before(:each) do
    @departure = assign(:departure, Departure.create!(
      :origin => "MyString",
      :trip => "MyString",
      :destination => "MyString",
      :lateness => 1,
      :track => "MyString",
      :status => "MyString"
    ))
  end

  it "renders the edit departure form" do
    render

    assert_select "form[action=?][method=?]", departure_path(@departure), "post" do

      assert_select "input[name=?]", "departure[origin]"

      assert_select "input[name=?]", "departure[trip]"

      assert_select "input[name=?]", "departure[destination]"

      assert_select "input[name=?]", "departure[lateness]"

      assert_select "input[name=?]", "departure[track]"

      assert_select "input[name=?]", "departure[status]"
    end
  end
end
