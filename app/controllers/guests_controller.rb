class GuestsController < ApplicationController
    # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
    allow_browser versions: :modern

    def index
        @guests = User.all
        if @guests
            render json: @guests, each_serializer: GuestSerializer
        else
            render json: []
        end
    end

    def show
        @guest = User.find(params[:id])
        if @guest
            render json: @guest, serializer: GuestSerializer
        else
            render json: {
                status: 500,
                errors: [ "user not found" ]
            }
        end
    end

    def create
        @guest = Guest.new(guest_params)
        if @guest.save
            render json: @guest, serializer: GuestSerializer
        else
            render json: {
                status: 500,
                errors: @guest.errors.full_messages
            }
        end
    end

    def update
        @guest = Guest.find(params[:id])
        @guest.update(guest_params)
        if authorized_user? && @guest.save
            render json: @guest, serializer: GuestSerializer
        else
            render json: {
                status: 403,
                errors: [ "not authorized to update this guest" ]
            }
        end
    end

    def destroy
        @guest = Guest.find(params[:id]).destroy
        render json: {
            status: 200
        }
    end

    private

    def guest_params
        params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :rsvp)
    end
end