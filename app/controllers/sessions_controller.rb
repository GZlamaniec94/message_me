class SessionsController < ApplicationController
    def new
    end
    
    def create
        user = User.find_by(username: params[:session][:username])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "Logged successfully."
            redirect_to root_path
        else  
            flash.now[:error] = "Your email or password was incorrect."
            render 'new'
        end    
    end    

    def destroy
        session[:user_id] = nil 
        flash[:success] = "You were logged out."
        redirect_to login_path
    end   

end