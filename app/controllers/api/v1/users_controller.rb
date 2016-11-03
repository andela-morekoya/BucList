module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: [ :show, :edit, :update, :destroy]

      def new
        @user = User.new
      end

      def edit
      end

      def create
        @user = User.new(user_params)

        if @user.save
          redirect_to @user, notice: 'User was successfully created.'
        else
          render :new
        end
      end

      def update
        if @user.update(user_params)
          redirect_to @user, notice: 'User was successfully updated.'
        else
          render :edit
        end
      end

      def destroy
        @user.destroy
        redirect_to users_url, notice: 'User was successfully destroyed.'
      end

<<<<<<< HEAD
  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:email, :password_digest)
    end
>>>>>>> change user controller
=======
      private

      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:email, :password_digest)
      end
    end
  end
>>>>>>> fix rubocop issues
end
