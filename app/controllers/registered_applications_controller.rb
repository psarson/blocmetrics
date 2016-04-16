class RegisteredApplicationsController < ApplicationController

  def index
    @registered_applications = RegisteredApplication.all
  end

  def show
    @registered_applications = RegisteredApplication.find(params[:id])
  end

  def new
    @registered_applications = RegisteredApplication.new
  end

  def create
    @user = current_user
    @registered_applications = RegisteredApplication.new(registered_applications_params)

      if @registered_applications.save
        flash[:notice] = "Application was saved."
        redirect_to root_path
      else
        flash.now[:alert] = "Error registering Application. Please try again."
        redirect_to root_path
      end
  end

  def destroy
    @user = current_user
    @registered_applications = RegisteredApplication.find(params[:id])

    if @registered_applications.destroy
      flash[:notice] = "\"#{@registered_applications.name}\" was deleted sucessfully"
      redirect_to root_path
    end
  end

  private
    def registered_applications_params
      params.require(:registered_application).permit(:name, :url)
    end
end
