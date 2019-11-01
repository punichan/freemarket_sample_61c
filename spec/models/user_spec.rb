require 'rails_helper'

describe User do
  describe '#create' do
    # # 1. nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること
    # it "is valid with a nickname, email, password, password_confirmation" do
    #   user = build(:user)
    #   expect(user).to be_valid
    # end

    # 2. nicknameが空では登録できないこと
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    # 3. emailが空では登録できないこと
    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # 4. passwordが空では登録できないこと
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # 5. passwordが存在してもpassword_confirmationが空では登録できないこと
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    # 8. 重複したemailが存在する場合登録できないこと
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    # 9. passwordが7文字以上であれば登録できること
    it "is valid with a password that has more than 7 characters " do
      user = build(:user, password: "00000000", password_confirmation: "00000000")
      user.valid?
      binding.pry
      expect(user).to be_valid
    end

    # 10. passwordが6文字以下であれば登録できないこと
    it "is invalid with a password that has less than 6 characters " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
      
    end

    # 11. phone_numberが空では登録できないこと
    it "is invalid without a phone_number" do
      user = build(:user, phone_number: nil)
      user.valid?
      expect(user.errors[:phone_number]).to include("can't be blank")
    end

    # 11. 重複したphone_numberが存在する場合登録できないこと
    it "is invalid with a duplicate phone_number" do
      user = create(:user)
      another_user = build(:user, phone_number: user.phone_number)
      another_user.valid?
      expect(another_user.errors[:phone_number]).to include("has already been taken")
    end

    # 12. first_nameが空では登録できないこと
    it "is invalid without a first_name" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    # 13. last_nameが空では登録できないこと
    it "is invalid without a last_name" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    # 14. first_name_kanaが空では登録できないこと
    it "is invalid without a first_name_kana" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    # 15. last_name_kanaが空では登録できないこと
    it "is invalid without a last_name_kana" do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end

    # 16. birth_year_onが空では登録できないこと
    it "is invalid without a birth_year_on" do
      user = build(:user, birth_year_on: nil)
      user.valid?
      expect(user.errors[:birth_year_on]).to include("can't be blank")
    end

    # 17. birth_year_onが空では登録できないこと
    it "is invalid without a birth_year_on" do
      user = build(:user, birth_year_on: nil)
      user.valid?
      expect(user.errors[:birth_year_on]).to include("can't be blank")
    end

    # 18. birth_month_onが空では登録できないこと
    it "is invalid without a birth_year_on" do
      user = build(:user, birth_month_on: nil)
      user.valid?
      expect(user.errors[:birth_month_on]).to include("can't be blank")
    end

    # 19. birth_day_onが空では登録できないこと
    it "is invalid without a birth_day_on" do
      user = build(:user, birth_day_on: nil)
      user.valid?
      expect(user.errors[:birth_day_on]).to include("can't be blank")
    end 
  end
end