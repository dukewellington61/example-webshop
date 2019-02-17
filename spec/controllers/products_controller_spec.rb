require 'rails_helper'

describe ProductsController, type: :controller do
  let(:user_admin) { User.create!(first_name: 'George', last_name: 'ThePrinceofWales', email: 'PrinceGeorgy@example.com', password: '1234567890', admin: true) }
  let(:product) { Product.create!(name: "Mountain Challenger") }


  describe "products" do

    context 'only when user is logged in as admin' do

      before do
        sign_in user_admin
      end # before bloc

      it "can edit a product" do
        get :edit, params: {id: product.id}
        expect(response).to be_ok
        expect(assigns(:product)).to eq product
      end #1 st spec


      it "can delete a product" do
        delete :destroy, params: { id: product.id }
        expect(response).to have_http_status(302)
        expect(assigns(:product)).to eq product
      end #2 nd spec


      it "can create a new product" do
        get :new, params: {name: "Mountain Challenger"}
        expect(response).to have_http_status(200)
    end #3 rd spec
  end # 1st context

  end # 2nd describe
end # 1st describe
