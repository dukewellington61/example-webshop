require 'rails_helper'

describe CommentsController, type: :controller do
  let(:user) { User.create!(first_name: 'Peter', last_name: 'Parker', email: 'peter@example.com', password: '1234567890') }
  let(:user_admin) { User.create!(first_name: 'George', last_name: 'ThePrinceofWales', email: 'PrinceGeorgy@example.com', password: '1234567890', admin: true) }
  let(:product) { Product.create!(name: "race bike") }
  let(:comment) { Comment.create!(body: "I am the body", rating: 5, user: user, product: product) }

  describe "product reviews" do

    context 'when a user is not logged in' do

      it "cannot write a review for a product" do
        post :create, params: {comment: {body:"I am the body", rating: 5}, product_id: product.id}
        expect(response).not_to render_template('new_comment')
      end #1 st spec
    end # 1st context

    context 'when a user is logged in' do

      before do
        sign_in user
      end # before block

      it "can write a review for a product" do
        post :create, params: {comment: {body:"I am the body", rating: 5}, product_id: product.id}
        expect(response).to have_http_status(302)
      end #1 st spec
    end # 2nd context

    context 'when a admin is logged in' do

      before do
        sign_in user_admin
      end # before block

      it "can delete a review for a product" do
        delete :destroy, params: { product_id: product.id, id: comment.id }
        expect(response).to have_http_status(302)
      end #1 st spec
    end # 3rd context

  end # 2nd describe
end # 1st describe
