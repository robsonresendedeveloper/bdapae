class WelcomeController < ApplicationController

	before_action :authenticate_user, only: [:new_user,:save_user]

	def index
	end

	def new_user
	end

	def save_user
		@user = User.new

		@email = params[:email]
		@password = params[:pass]
		@pass_confirm = params[:pass_confirm]

		if @password == @pass_confirm
			@user.email = @email[0]
			@user.password = @password[0]

			if @user.save
				flash[:notice] = "Usuário cadastrado com sucesso!"
				redirect_to patients_path
			else
				flash[:danger] = "Ocorreu um erro, tente novamente"
				flash[:error] = @user.errors.full_messages
				redirect_to new_user_path
			end
		else
			flash[:danger] = "As senhas digitadas não conferem!"
			redirect_to new_user_path
		end
	end

	private
	
	def authenticate_user
      if !user_signed_in?
        redirect_to root_path
        flash[:danger] = "Você não tem acesso a essa área"
      end
    end

end