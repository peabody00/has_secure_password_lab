class UsersController < ApplicationController

    def new
    end

    def create
        new = User.new(user_params)
          if new.password == new.password_confirmation
            user = User.create(user_params)
            session[:user_id] = user.id
            redirect_to '/'
          else  
            redirect_to new_user_path
        end 
    end 
    
      private
    
    def user_params 
        params.require(:user).permit(:name, :password, :password_confirmation)
     end 
    
end