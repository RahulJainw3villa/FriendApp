class UsersController < ApplicationController
    def index
        @users = User.all
    end   

    def show
     @user = User.find(params[:id])
     @articles = @user.articles
    end

    def new
      @user = User.new
    end
    
    def create
      @user = User.new(user_params)
      # @article = User.new(name: "...", city: "...")

      if @user.save
        redirect_to @user
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @user = User.find(params[:id])
    end 

    def update
      @user = User.find(params[:id])

      if @user.update(user_params)
        redirect_to @user
      else
        render :edit,status: :unprocessable_entity
      end

    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to users_path

      # redirect_to root_path, status: :see_other
    end


    private
    def user_params
      params.require(:user).permit(:name,:city)
    end

end