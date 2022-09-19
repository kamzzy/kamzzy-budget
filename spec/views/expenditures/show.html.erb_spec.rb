require 'rails_helper'

RSpec.describe "expenditures/show", type: :view do
  before(:each) do
    @expenditure = assign(:expenditure, Expenditure.create!(
      group: "Group"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Group/)
  end
end
