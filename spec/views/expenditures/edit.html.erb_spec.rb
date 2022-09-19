require 'rails_helper'

RSpec.describe "expenditures/edit", type: :view do
  before(:each) do
    @expenditure = assign(:expenditure, Expenditure.create!(
      group: "MyString"
    ))
  end

  it "renders the edit expenditure form" do
    render

    assert_select "form[action=?][method=?]", expenditure_path(@expenditure), "post" do

      assert_select "input[name=?]", "expenditure[group]"
    end
  end
end
