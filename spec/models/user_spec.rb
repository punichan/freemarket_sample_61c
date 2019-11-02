require 'rails_helper'

describe User do
  describe '#create' do
    # # 1. nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること
    # it "is valid with a nickname, email, password, password_confirmation" do
    #   user = build(:user)
    #   expect(user).to be_valid
    # end

    # 2. nicknameが空では登録できない
    it "nicknameが空では登録できない" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    # 3. emailが空では登録できないこと
    it "emailが空では登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # 4. passwordが空では登録できないこと
    it "passwordが空では登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # 5. passwordが存在してもpassword_confirmationが空では登録できないこと
    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    # 8. 重複したemailが存在する場合登録できないこと
    it "重複したemailが存在する場合登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    # 9. passwordが7文字以上であれば登録できること
    it "passwordが7文字以上であれば登録できること" do
      user = build(:user, password: "0000000000", password_confirmation: "0000000000")
      user.valid?
      expect(user).to be_valid
    end

    # 10. passwordが6文字以下であれば登録できないこと
    it "passwordが6文字以下であれば登録できないこと" do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
      
    end

    # 11. phone_numberが空では登録できないこと
    it "phone_numberが空では登録できないこと" do
      user = build(:user, phone_number: nil)
      user.valid?
      expect(user.errors[:phone_number]).to include("can't be blank")
    end

    # 11. 重複したphone_numberが存在する場合登録できないこと
    it "重複したphone_numberが存在する場合登録できないこと" do
      user = create(:user)
      another_user = build(:user, phone_number: user.phone_number)
      another_user.valid?
      expect(another_user.errors[:phone_number]).to include("has already been taken")
    end

    # 12. first_nameが空では登録できないこと
    it "first_nameが空では登録できないこと" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    # 13. last_nameが空では登録できないこと
    it "last_nameが空では登録できないこと" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    # 14. first_name_kanaが空では登録できないこと
    it "first_name_kanaが空では登録できないこと" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    # 15. last_name_kanaが空では登録できないこと
    it "last_name_kanaが空では登録できないこと" do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end

    # 16. birth_year_onが空では登録できないこと
    it "birth_year_onが空では登録できないこと" do
      user = build(:user, birth_year_on: nil)
      user.valid?
      expect(user.errors[:birth_year_on]).to include("can't be blank")
    end

    # 17. birth_year_onが空では登録できないこと
    it "birth_year_onが空では登録できないこと" do
      user = build(:user, birth_year_on: nil)
      user.valid?
      expect(user.errors[:birth_year_on]).to include("can't be blank")
    end

    # 18. birth_month_onが空では登録できないこと
    it "birth_month_onが空では登録できないこと" do
      user = build(:user, birth_month_on: nil)
      user.valid?
      expect(user.errors[:birth_month_on]).to include("can't be blank")
    end

    # 19. birth_day_onが空では登録できないこと
    it "birth_day_onが空では登録できないこと" do
      user = build(:user, birth_day_on: nil)
      user.valid?
      expect(user.errors[:birth_day_on]).to include("can't be blank")
    end 
  end
end