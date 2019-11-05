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

  end
  
  def new4th
  end
  
  def new5th
  end
  
  
  
  
  def create
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
      phone_number:           session[:phone_number]
    )
    @user.save!
    

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
      address_attributes: [:user_id, ]
    )
  end
end

