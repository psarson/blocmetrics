require 'rails_helper'

RSpec.describe RegisteredApplicationsController, type: :controller do

  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

 let(:my_registered_application) { FactoryGirl.create(:registered_application, user_id: @user.id)}


  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns RegisteredApplications.all to Registered Application" do
      get :index
      expect(assigns(:registered_applications)).to eq([my_registered_application])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, user_id: @user.id, id: my_registered_application.id
      expect(response).to have_http_status(:success)
    end

    it "renders the show view" do
      get :show, user_id: @user.id, id: my_registered_application.id
      expect(response).to render_template :show
    end

    it "assigns my_registered_application to @registered_applications" do
      get :show, user_id: @user.id, id: my_registered_application.id
      expect(assigns(:registered_applications)).to eq(my_registered_application)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @registered_applications" do
      get :new, user_id: @user.id
      expect(assigns(:registered_applications)).not_to be_nil
    end
  end

  describe "POST create" do
    it "returns http success" do
      get :create, user_id: @user.id, registered_application: { name: Faker::App.name, url: Faker::Internet.domain_name}
      expect(response).to redirect_to root_path
    end

    it "increases the number of Registered Applications by 1" do
      expect{ post :create, user_id: @user.id, registered_application: {name: Faker::App.name, url: Faker::Internet.domain_name} }.to change(RegisteredApplication,:count).by(1)
    end

    it "assigns RegisteredApplication.last to new Registered Application" do
      post :create, user_id: @user.id, registered_application: {name: Faker::App.name, url: Faker::Internet.domain_name}
      expect(assigns(:registered_applications)).to eq RegisteredApplication.last
    end

    it "redirects to root path" do
      post :create, user_id: @user.id, registered_application: {name: Faker::App.name, url: Faker::Internet.domain_name}
      expect(response).to redirect_to root_path
    end
  end

  describe "DELETE #destroy" do
    it "returns http success" do
      get :destroy, user_id: @user.id, id: my_registered_application.id
      expect(response).to redirect_to root_path
    end

    it "deletes the Registered Application" do
      delete :destroy, user_id: @user.id, id: my_registered_application.id
      count = RegisteredApplication.where({id: my_registered_application.id}).size
      expect(count).to eq 0
    end

    it "redirects to root path" do
      delete :destroy, user_id: @user.id, id: my_registered_application.id
      expect(response).to redirect_to root_path
    end
  end

end
