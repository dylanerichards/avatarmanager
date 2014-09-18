require 'rails_helper'

RSpec.describe AvatarsController, :type => :controller do
  let(:avatar) { FactoryGirl.create(:avatar) }
  describe '#index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template :index
    end

    it 'assigns @avatars to all avatars' do
      get :index
      expect(assigns(:avatars)).to eq Avatar.all
    end
  end

  describe '#show' do
    it 'renders the show template' do
      get :show, id: avatar
      expect(response).to render_template :show
    end

    it 'assigns avatar to the one from params' do
      get :show, id: avatar
      expect(assigns(:avatar)).to eq avatar
    end
  end

  describe '#create' do
    it 'saves the new avatar to the database' do
      expect {
        FactoryGirl.create(:avatar)
      }.to change(Avatar, :count).by 1
    end
  end

  describe '#edit' do
    it 'renders the edit template' do
      get :edit, id: avatar
      expect(response).to render_template :edit
    end

    it 'assigns @avatar to the one from params' do
      get :edit, id: avatar
      expect(assigns(:avatar)).to eq avatar
    end
  end

  describe '#new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template :new
    end
  end
end
