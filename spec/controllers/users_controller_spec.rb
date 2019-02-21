require 'rails_helper'

describe UsersController, type: :controller do

  before do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    @user3 = FactoryBot.create(:admin)
  end

  describe 'what a user can do' do

    context 'when a user is not logged in' do

         it 'redirects to login' do
           get :show, params: { id: @user1.id }
           expect(response).to redirect_to(new_user_session_path)
         end #1 st spec
    end # 1st context


     context 'when a user is logged in' do

          before do
            sign_in @user1
          end # before block

           it 'loads correct user details' do
             get :show, params: { id: @user1.id }
             expect(response).to be_ok
             expect(assigns(:user)).to eq @user1
           end # 1st spec

           it 'cannot access another users details' do
              get :show, params: {id: @user2.id}
              expect(response).to have_http_status(302)
              expect(response).to redirect_to root_path
            end # 2nd spec

            it 'cannot delete another users profile' do
               expect { delete :destroy, params: { id: @user2.id} }.not_to change(User, :count)
             end # 3rd spec

           it 'can delete its own profile' do
              expect { delete :destroy, params: { id: @user1.id} }.to change(User, :count).by(-1)
            end # 4th spec
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

            it 'can delete other users profiles' do
              expect { delete :destroy, params: { id: @user1.id} }.to change(User, :count).by(-1)
            end # 3rd spec
        end # 3rd context

      end # 2nd describe
    end # 1st describe
