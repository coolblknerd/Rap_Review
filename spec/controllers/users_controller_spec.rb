require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:user) { FactoryGirl.create(:user, :admin)}

  describe "GET #index" do
    it "returns http success" do
      sign_in user
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE #destroy" do
    it "returns http success" do
      sign_in user
      delete :destroy
      expect(response).to have_http_status(:success)
    end
  end

end
