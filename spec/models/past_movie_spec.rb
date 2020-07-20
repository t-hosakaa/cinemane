require 'rails_helper'

RSpec.describe PastMovie, type: :model do
  describe '#create' do
    context 'can save' do
      it 'title,genreがあれば保存できる' do
        expect(build(:past_movie, image: nil)).to be_valid
      end
    end

    context 'can not save' do
      it 'titleが無いと保存できない' do
        past_movie = build(:past_movie, title: nil)
        past_movie.valid?
        expect(past_movie.errors[:title]).to include('を入力してください')
      end

      it 'genreが無いと保存できない' do
        past_movie = build(:past_movie, genre: nil)
        past_movie.valid?
        expect(past_movie.errors[:genre]).to include('を入力してください')
      end

      it 'user_idが無いと保存できない' do
        past_movie = build(:past_movie, user: nil)
        past_movie.valid?
        expect(past_movie.errors[:user]).to include('を入力してください')
      end
    end

  end
end