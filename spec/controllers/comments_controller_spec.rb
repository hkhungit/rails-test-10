require 'rails_helper'

describe CommentsController, type: :controller do

  describe '#index' do
    def do_request
      get :index
    end

    it 'renders the :index template' do
      do_request
      expect(response).to render_template :index
    end
  end
  
  describe '#create' do
    def do_request
      post :create, comment: comment_attributes
    end

    let!(:user)               { create(:user) }
    let!(:comment_attributes) { attributes_for(:comment, user_id: user.id)}


    before { sign_in user }

    it 'creates a comment' do
      expect{ do_request }.to change{ Comment.count }.from(0).to(1)
      expect(response).to redirect_to redirect_to assigns(:comment)
    end
  end  

  describe '#update' do
    def do_request
      patch :create, comment: comment_attributes
    end

    let!(:user)               { create(:user) }
    let!(:comment_attributes) { attributes_for(:comment, user_id: user.id)}


    before { sign_in user }

    it 'creates a comment' do
      expect{ do_request }.to change{ Comment.count }.from(0).to(1)
      expect(response).to redirect_to assigns(:comment)
    end
  end  

  describe '#destroy' do
    def do_request
      delete :destroy, id: comment.id
    end

    let!(:user)               { create(:user) }
    let!(:comment)            { create(:comment, user_id: user.id)}


    before { sign_in user }

    it 'destroy the  comment' do
      expect{ do_request }.to change{ Comment.count }.from(1).to(0)
      expect(response).to redirect_to comments_url
    end
  end 
end
