require 'rails_helper'

# describe ItemsController do
  
# end


describe ItemsController do
  describe 'delete #destroy' do
        it "deletes the item" do
          item = create(:item)
          expect{
            delete :destroy, id: item
          }.to change(Item,:count).by(-1)
        end
      end
      it 'redirects the :root' do
        expect(response).to redirect_to(root_path)
      end
end