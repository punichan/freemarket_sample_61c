module SignupHelper
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
