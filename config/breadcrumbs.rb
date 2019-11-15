crumb :root do
  link "メルカリ", root_path
end

crumb :users do
  link "マイページ", user_path(current_user.id)
end

crumb :profile do
  link "プロフィール", mypage_edit_users_path
  parent :users
end

crumb :payment do
  link "支払い方法", card_edit_users_path
  parent :users
end

crumb :selfinfo do
  link "本人情報", identification_users_path
  parent :users
end

crumb :logout do
  link "ログアウト", logout_users_path
  parent :users
end

crumb :exhibition do
  link "出品中", exhibition_user_path
  parent :users
end

crumb :selled do
  link "売却済み", selled_user_path
  parent :users
end