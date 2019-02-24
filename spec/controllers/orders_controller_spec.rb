require 'rails_helper'

describe OrdersController, type: :controller do
  let(:user) { User.create!(first_name: "Arthur ", last_name: "Wellesley", email: "dukewellington@gmx.de", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, admin: true) }
  let(:product) { Product.create!(name: "Mountain Challenger", price: 200) }
  let(:order) {Order.create!(user_id: 1, product_id: product.id, total: 1)}

  describe 'GET #index' do


    context 'when a user is logged in' do

        before do
          sign_in user
        end # before block

        it 'can access the index view' do
          get :show, params: { id: order.id }
          expect(response).to be_ok
        end #1 st spec
    end # 1st context


    context 'when a user is not logged in' do

         it 'redirects to login' do
           get :show, params: { id: user.id }
           expect(response).to redirect_to(new_user_session_path)
         end #1 st spec
    end # 2nd context

  end # 2nd describe
end # 1st describe
