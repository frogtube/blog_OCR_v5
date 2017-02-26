class UsersController < ApplicationController
  
  def index
    if @current_user.try(:admin?)
      @users = User.all
    else
      flash[:error] = "Accès interdit"
      return redirect_to request.referrer || "/users/home"
    end
  end

  def home
  end

  def login
  end

  def check
  	@current_user = User.where(name: params[:name], password: params[:password]).first
  	if @current_user
  		session[:user_id] = @current_user.id
  		if @current_user.role == "admin"
	  		flash[:info] = "Bienvenue administrateur #{@current_user.name}"
  		else
	  		flash[:info] = "Bienvenue #{@current_user.name}"
  		end
  		redirect_to "/users/home"
  	else
  		session[:user_id] = nil
  		flash[:info] = "Echec de la connexion"
  		redirect_to "/users/login"
  	end
  end

  def logout
  	session[:user_id] = nil
  	flash[:info] = "Vous etes déconnecté"
  	redirect_to "/users/home"
  end
end
