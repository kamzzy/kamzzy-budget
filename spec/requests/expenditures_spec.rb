require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe 'Expendetiures', type: :request do
  describe 'Expenditures' do
    it 'renders all groups expendeiture' do
      user = FactoryBot.create(:user)
      group = FactoryBot.create(:group, user_id: user.id)
      user.save
      login_as(user, scope: :user)
      get "/users/#{user.id}/groups/#{group.id}/expenditures"
      expect(response).to render_template('index')
    end
  end
end
