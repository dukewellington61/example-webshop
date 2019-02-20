require 'rails_helper'

describe UsersController, type: :controller do

  before do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    @user3 = FactoryBot.create(:admin)
  end

  describe 'GET #show' do

 context 'when a user is logged in' do

      before do
        sign_in @user1
      end # before block

       it 'loads correct user details' do
         get :show, params: { id: @user1.id }
         expect(response).to be_ok
         expect(assigns(:user)).to eq @user1
       end # 1st spec

       it 'cannot access the other users details' do
          get :show, params: {id: @user2.id}
          expect(response).to have_http_status(302)
          expect(response).to redirect_to root_path
        end # 2nd spec
  end # 1st context


  context 'when a user is not logged in' do

       it 'redirects to login' do
         get :show, params: { id: @user1.id }
         expect(response).to redirect_to(new_user_session_path)
       end #1 st spec
  end # 2nd context


  context 'when admin is logged in' do

        before do
          sign_in @user3
        end # before block

        it 'can access all the users profiles' do
          get :show, params: { id: @user1.id }
          expect(response).to have_http_status(200)
          expect(assigns(:user)).to eq @user1
        end # 1st spec
    end # 3rd context
  end # 2nd describe
end # 1st describe
