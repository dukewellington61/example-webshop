require 'rails_helper'

describe ProductsController, type: :controller do

  before do
    @product = FactoryBot.create(:product)
    @admin = FactoryBot.create(:admin)
  end

  describe "products" do

    context "when a user is not logged in" do

      it "can access index" do
        get :index
        expect(response).to have_http_status(200)
      end

      it "can access show" do
        get :show, params: { id: @product.id } 
        expect(response).to have_http_status(200)
      end

    end

    context 'only when user is logged in as admin' do

      before do
        sign_in @admin
      end 

      it "can access edit" do
        get :edit, params: { id: @product.id }
        expect(response).to render_template('edit')
      end

      it "can update a product" do
         put :update, params: { id: @product.id, product: { name: "Edited Name", description: "Edited", price: 200 } }
         @product.reload
         expect(@product.description).to eq("Edited")
         expect(response).to redirect_to @product
      end 

      it "can delete a product" do
        delete :destroy, params: { id: @product.id }
        expect(response).to have_http_status(302)
        expect(assigns(:product)).to eq @product
      end 

      it "can access new" do
        get :new
        expect(response).to render_template('new')
      end

      it "can create a new product" do
        expect { post :create, params: { product: FactoryBot.attributes_for(:product, name: "some bike", price: 1500), product_id: @product.id }}.to change(Product, :count).by(1)
      end 
    end 

    context 'search function' do

      it "returns the matching product" do
        @result = Product.search("Mountain Challenger")
        expect(@result).to eq(@product.name)
      end
    end
  end 
end 
