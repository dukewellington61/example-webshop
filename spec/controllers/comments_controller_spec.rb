require 'rails_helper'

describe CommentsController, type: :controller do

  before do
    @product = FactoryBot.create(:product)
    @admin = FactoryBot.create(:admin)
    @user = FactoryBot.create(:user)
    @comment = FactoryBot.create(:comment)
  end

  describe "product reviews" do


    context 'when a user is not logged in' do

      it "cannot write a review for a product" do
          post :create, params: { comment: FactoryBot.attributes_for(:comment, user: @user, product: @product), product_id: @product.id }
          expect(response).not_to be_ok
      end #1 st spec
    end # 1st context


    context 'when a user is logged in' do

      before do
        sign_in @user
      end # before block

      it "can write a review for a product" do
        expect { post :create, params: { comment: FactoryBot.attributes_for(:comment, user: @user, product: @product), product_id: @product.id }}.to change(Comment, :count).by(1)
      end #1 st spec

      it "cannot destroy a review for a product" do
        expect { delete :destroy, params: { id: @comment.id, product_id: @product.id } }.not_to change(Comment, :count)
      end #2nd spec
    end # 2nd context


    context 'when a admin is logged in' do

      before do
        sign_in @admin
      end # before block

      it "can destroy a review for a product" do
        expect { delete :destroy, params: { id: @comment.id, product_id: @product.id } }.to change(Comment, :count).by(-1)
      end #1 st spec
    end # 3rd context

  end # 2nd describe
end # 1st describe
