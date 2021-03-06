class SessionsController < ApplicationController

    def new

    end

    def create
        @user = User.find_by(email: params[:login][:email])
        if @user && @user.authenticate(params[:login][:password])
            session[:user_id] = @user.id.to_s

            redirect_to posts_path
       else
       # If user's login doesn't work, send them back to the login form.
         redirect_to login_path
       end
     end

     def destroy
         session.delete(:user_id)
     end
end
