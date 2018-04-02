require 'rails_helper'

RSpec.describe "boards/index", type: :view do
  before(:each) do
    assign(:boards, [
      Board.create!(
        :location => "Location"
      ),
      Board.create!(
        :location => "Location"
      )
    ])
  end

  it "renders a list of boards" do
    render
    assert_select "tr>td", :text => "Location".to_s, :count => 2
  end
end
