require 'rails_helper'

describe UsersController, type: :controller do
  let(:user) { User.create!(first_name: 'Peter', last_name: 'Parker', email: 'peter@example.com', password: '1234567890') }
  let(:user_second) { User.create!(first_name: 'Edmund', last_name: 'Blackadder', email: 'Lord@ofaddersblack.com', password: '1234567890') }
  let(:user_admin) { User.create!(first_name: 'George', last_name: 'ThePrinceofWales', email: 'PrinceGeorge@example.com', password: '1234567890', admin: true) }

  describe 'GET #show' do

 context 'when a user is logged in' do

      before do
        sign_in user
      end # before block

       it 'loads correct user details' do
         get :show, params: { id: user.id }
         expect(expect(response).to be_ok)
         expect(assigns(:user)).to eq user
       end # 1st spec

       it 'cannot access the other users details' do
          get :show, params: {id: user_second.id}
          expect(response).to have_http_status(302)
          expect(response).to redirect_to root_path
        end # 2nd spec
  end # 1st context


  context 'when a user is not logged in' do

       it 'redirects to login' do
         get :show, params: { id: user.id }
         expect(response).to redirect_to(new_user_session_path)
       end #1 st spec
  end # 2nd context


  context 'when admin is logged in' do

        before do
          sign_in user_admin
        end # before block

        it 'can access all the users profiles' do
          get :show, params: { id: user_second.id }
          expect(expect(response).to be_ok)
          expect(assigns(:user)).to eq user_second
        end # 1st spec
    end # 3rd context
  end # 2nd describe
end # 1st describe
