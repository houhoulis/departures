require 'rails_helper'

RSpec.describe "departures/new", type: :view do
  before(:each) do
    assign(:departure, Departure.new(
      :origin => "MyString",
      :trip => "MyString",
      :destination => "MyString",
      :lateness => 1,
      :track => "MyString",
      :status => "MyString"
    ))
  end

  it "renders new departure form" do
    render

    assert_select "form[action=?][method=?]", departures_path, "post" do

      assert_select "input[name=?]", "departure[origin]"

      assert_select "input[name=?]", "departure[trip]"

      assert_select "input[name=?]", "departure[destination]"

      assert_select "input[name=?]", "departure[lateness]"

      assert_select "input[name=?]", "departure[track]"

      assert_select "input[name=?]", "departure[status]"
    end
  end
end
