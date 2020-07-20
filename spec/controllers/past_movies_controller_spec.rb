require 'rails_helper'

describe PastMoviesController do
  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #show' do
    it "@past_movieが正しく定義されている" do
      past_movie = create(:past_movie)
      get :show, params: { id: past_movie }
      expect(assigns(:past_movie)).to eq past_movie
    end

    it '意図したビューが表示される' do
      past_movie = create(:past_movie)
      get :show, params: { id: past_movie }
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do
    it "@past_movieが正しく定義されている" do
      past_movie = create(:past_movie)
      get :edit, params: { id: past_movie }
      expect(assigns(:past_movie)).to eq past_movie
    end

    it "renders the :edit template" do
      past_movie = create(:past_movie)
      get :edit, params: { id: past_movie }
      expect(response).to render_template :edit
    end
  end
end