class UsersController < ApplicationController
    # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
    allow_browser versions: :modern

    def index
        @users = User.all
        if @users
            render json: @users, each_serializer: UserSerializer
        else
            render json: {
                status: 500,
                errors: [ "no users found" ]
            }
        end
    end

    def show
        @user = User.find(params[:id])
        if @user
            render json: @user, serializer: UserSerializer
        else
            render json: {
                status: 500,
                errors: [ "user not found" ]
            }
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login!
            UserMailer.with(user: @user).welcome_email.deliver
            render json: @user, serializer: UserSerializer
        else
            render json: {
                status: 500,
                errors: @user.errors.full_messages
            }
        end
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        @user.avatar.attach(params[:avatar]) if params[:avatar]
        if authorized_user? && @user.save
            render json: @user, serializer: UserSerializer
        else
            render json: {
                status: 403,
                errors: [ "not authorized to update this user" ]
            }
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :avatar, :first_name, :last_name, :rsvp, :full_name)
    end
end
