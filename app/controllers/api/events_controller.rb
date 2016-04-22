class API::EventsController < ApplicationController
   skip_before_filter :verify_authenticity_token
   skip_before_filter :authenticate_user!, only: [:create]
   before_filter :set_access_control_headers

   def set_access_control_headers

     headers['Access-Control-Allow-Origin'] = '*'

     headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'

     headers['Access-Control-Allow-Headers'] = 'Content-Type'
   end

   def preflight
     head 200
   end

   def create
     registered_applications = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])

     binding.pry
     if registered_applications.valid?
        registered_applications.save!
        render json: registered_applications.to_json, status: 201
     else
       render json: {error: "App is invalid", status: 400}, status: 400
     end
   end


   private

   def event_params
     params.require(:event).permit(:name)
   end
 end
