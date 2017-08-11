class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def import
  	if request.get? 
  	else
  		messages = User.import(params[:file])
  		flash[:alert] = messages
  	end
  end

  def export
  	@users = User.all
		respond_to do |format|
		  format.html
		  format.csv { send_data @users.to_csv }
		end
  end
end
