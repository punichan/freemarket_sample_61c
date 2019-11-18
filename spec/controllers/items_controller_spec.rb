require 'rails_helper'

describe ItemsController, type: :controller do 

  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end
  
  redirect_to(article_path(article))
end 