class AccountsController < ApplicationController
	def new
		@account=Account.new
	end
	def create
		if current_user.account.blank? 
			@account = current_user.build_account(account_params)
			if @account.save 
					flash[:success] = "account created Successfully"
					  redirect_to root_url
				else
		      redirect_to root_url
		      @account.errors.messages.each do |key, val|
		      	flash[:error] = val.first
		      end
				end
		else
		 	flash[:alert] = "account is already exists"
		end
	end

	def edit
		@account = Account.find(params[:id])
	end
	def update
      if current_user.account.present?
		    @account=Account.find(params[:id])
		    @account.update(account_params)
		    flash[:success] = "account is  update"
		  else
		 	  flash[:error] = "account is not update"
		  end
	 	redirect_to root_url
  end
	private
  def account_params
     params.require(:account).permit(:address ,:mobile_number, :upload_photo,:upload_by_paperclip)
  end
end
