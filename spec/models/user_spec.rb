require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "ニックネームが空だと登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "メールアドレスが空だと登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it"メールアドレスが一意性であること" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "メールアドレスは、@を含む必要があること" do
      @user.email = "aaaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "パスワードが必須であること" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "パスワードは、6文字以上での入力が必須であること" do
      @user.password = "aa00"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    
    it "パスワードは、半角英数字混合での入力が必須であること" do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "パスワードは、確認用を含めて2回入力すること" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "パスワードとパスワード（確認用）、値の一致が必須であること" do
      @user.password_confirmation = @user.password + "a"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end

  # describe '新規登録/本人情報確認' do
  #   # - ユーザー本名は、名字と名前がそれぞれ必須であること
  #   # - ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること
  #   # - ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること
  #   # - ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること
  #   # - 生年月日が必須であること
  # end

    # ## トップページ
    # - ログアウト状態では、ヘッダーに新規登録/ログインボタンが表示されること
    # - ログイン状態では、ヘッダーにユーザーのニックネーム/ログアウトボタンが表示されること
    # - ヘッダーの新規登録/ログインボタンをクリックすることで、各ページに遷移できること
    # - ヘッダーのログアウトボタンをクリックすることで、ログアウトができること

  
end
