class SignupController < ApplicationController
  
  def new1st
    @user = User.new()
  end

  def new2nd
    @user = User.new()
    session[:nickname]              = user_params[:nickname]
    session[:email]                 = user_params[:email]
    session[:password]              = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:last_name]             = user_params[:last_name]
    session[:first_name]            = user_params[:first_name]
    session[:last_name_kana]        = user_params[:last_name_kana]
    session[:first_name_kana]       = user_params[:first_name_kana]
    session[:birth_year_on]         = user_params[:birth_year_on]
    session[:birth_month_on]        = user_params[:birth_month_on]
    session[:birth_day_on]          = user_params[:birth_day_on]
  end
  
  def new3rd
    @user = User.new()
    session[:phone_number] = user_params[:phone_number]
    @user.addresses.build
  end
  
  def new4th
  end
  
  def new5th
  end
  
  
  
  
  def create
    if session[:provider].present? && session[:uid].present?
      password = Devise.friendly_token.first(7)
      @user = User.new(
        nickname:               session[:nickname],
        email:                  session[:email],
        password:               "password",
        password_confirmation:  "password",
        last_name:              session[:last_name], 
        first_name:             session[:first_name], 
        last_name_kana:         session[:last_name_kana], 
        first_name_kana:        session[:first_name_kana], 
        birth_year_on:          session[:birth_year_on], 
        birth_month_on:         session[:birth_month_on], 
        birth_day_on:           session[:birth_day_on], 
        phone_number:           session[:phone_number],
        addresses_attributes: user_params[:addresses_attributes]
      )
    else
      @user = User.new(
        nickname:               session[:nickname],
        email:                  session[:email],
        password:               session[:password],
        password_confirmation:  session[:password_confirmation],
        last_name:              session[:last_name], 
        first_name:             session[:first_name], 
        last_name_kana:         session[:last_name_kana], 
        first_name_kana:        session[:first_name_kana], 
        birth_year_on:          session[:birth_year_on], 
        birth_month_on:         session[:birth_month_on], 
        birth_day_on:           session[:birth_day_on], 
        phone_number:           session[:phone_number],
        addresses_attributes: user_params[:addresses_attributes]
      )
    end
    user = User.new(user_params)

    @user.save!
    if @user.save
      session[:id] = @user.id
      redirect_to done_signup_index_path
    end

    def done
      sign_in User.find(session[:id]) unless user_signed_in?
    end
    
    #後ほど利用予定
    # if verify_recaptcha
    #   super
    # else
    #   self.resource = resource_class.new
    #   respond_with_navigational(resource) { render :new }
    # end
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
      :first_name, 
      :last_name, 
      :first_name_kana, 
      :last_name_kana, 
      :phone_number,
      :birth_year_on,
      :birth_month_on,
      :birth_day_on,
      addresses_attributes: [:postal_code, :prefecture, :city, :town, :building]
    )
  end
end

