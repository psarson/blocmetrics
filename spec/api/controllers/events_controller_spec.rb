require 'rails_helper'

  RSpec.describe Api::EventsController, type: :controller do
    before(:each) do
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    describe "POST create" do
      it "returns http sucess" do
        expect(response).to have_http_status(:sucess)
      end

      it "returns json content type" do
        expect(response.content_type).to eq 'application/json'
      end

      it "creates an event with the correct attributes" do
        hashed_json = JSON.parse(response.name)
        expect(hashed_json["name"]).to eq(@new_event.name)
      end
    end
  end
