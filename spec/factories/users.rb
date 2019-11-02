FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    first_name            {"aaa"}
    last_name             {"aaa"}
    first_name_kana       {"aaa"}
    last_name_kana        {"a"}
    phone_number          {"00000000000"}
    birth_year_on         {"1111"}
    birth_month_on        {"00"}
    birth_day_on          {"00"}
  end

end