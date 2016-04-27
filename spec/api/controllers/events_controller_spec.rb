require 'rails_helper'

  RSpec.describe API::EventsController, type: :controller do
    let(:my_user) { create(:user) }
    let(:my_registered_application) { create(:registered_application) }


    describe "POST create" do
      before { post :create, events: { name: @new_event } }

      it "returns http sucess" do
        expect(response).to have_http_status(:sucess)
      end

      it "returns json content type" do
        expect(response.content_type).to eq 'application/json'
      end

      it "creates an event with the correct attributes" do
        hashed_json = JSON.parse(response.name)
        expect(hashed_json["name"]).to eq(@new_event)
      end
    end

  end
