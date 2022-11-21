require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe '投稿' do
    context '投稿できる時' do
      it 'フォームに情報が正しく入力されていれば投稿できる' do
        expect(@tweet).to be_valid
      end

      it 'textが空でも投稿できる' do
        @tweet.text = ''
        expect(@tweet).to be_valid
      end

      it 'imageが空でも投稿できる' do
        @tweet.image = nil
        expect(@tweet).to be_valid
      end
    end

    context '投稿ができない時' do
      it 'titleが空では投稿できない' do
        @tweet.title = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Title can't be blank")
      end

      it 'hashtagが空では出品できない' do
        @tweet.hashtag = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Hashtag can't be blank")
      end

      it 'textとimageが空では投稿できない' do
        @tweet.text = ''
        @tweet.image = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Text can't be blank")
      end

      it 'user情報が紐づいていないと出品できない' do
        @tweet.user = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('User must exist')
      end
    end
  end
end
