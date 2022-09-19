require 'rails_helper'

RSpec.describe "expenditures/index", type: :view do
  before(:each) do
    assign(:expenditures, [
      Expenditure.create!(
        group: "Group"
      ),
      Expenditure.create!(
        group: "Group"
      )
    ])
  end

  it "renders a list of expenditures" do
    render
    assert_select "tr>td", text: "Group".to_s, count: 2
  end
end
