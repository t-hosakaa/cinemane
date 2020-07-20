require 'rails_helper'
describe User do
  describe '#create' do

    it "name,email,password,password_confirmationが存在していれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nameが空である場合登録できないこと" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "emailが空である場合登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "passwordが空である場合登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "nameが7文字以上あれば登録できないこと" do
      user = build(:user, name: "ttttttt")
      user.valid?
      expect(user.errors[:name]).to include("は6文字以内で入力してください")
    end

    it "nameが6文字以下であれば登録できること" do
      user = build(:user, name: "tttttt")
      expect(user).to be_valid
    end

    it "重複したemailがあれば登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "passwordが6文字以上であれば登録できること" do
      user = build(:user, password: "123456", password_confirmation: "123456")
      expect(user).to be_valid
    end

    it "passwordが5文字以下であれば登録できないこと" do
      user = build(:user, password: "12345", password_confirmation: "12345")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end
  end
end