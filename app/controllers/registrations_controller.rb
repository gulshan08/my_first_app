class RegistrationsController < Devise::RegistrationsController
 def new
	@user = User.new
 end

 def create 
 	@user=User.new(sign_up_params)
 	@user.save
 	redirect_to root_path
 end


 private

 def sign_up_params
   params.require(:user).permit(:firstname, :lastname,:username,:mobile_number, :email, :password, :password_confirmation)
 end
end
