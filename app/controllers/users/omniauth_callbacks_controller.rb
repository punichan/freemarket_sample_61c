class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end


  def callback_for(provider)
    @omniauth = request.env['omniauth.auth']
    info = User.find_oauth(@omniauth)
    @user = info[:user]
    if @user.persisted? 
      sign_in_and_redirect @user, event: :authentication
    else 
      @sns = info[:sns]
      session[:provider] = @sns[:provider]
      session[:uid] = @sns[:uid]
      render template: "signup/new1st" 
    end
  end

  def failure
    redirect_to root_path and return
  end
end
