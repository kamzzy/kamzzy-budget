require 'rails_helper'

RSpec.describe 'expenditures/new', type: :view do
  before(:each) do
    assign(:expenditure, Expenditure.new(
                           group: 'MyString'
                         ))
  end

  it 'renders new expenditure form' do
    render

    assert_select 'form[action=?][method=?]', expenditures_path, 'post' do
      assert_select 'input[name=?]', 'expenditure[group]'
    end
  end
end
