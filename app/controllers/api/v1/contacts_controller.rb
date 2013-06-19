class Api::V1::ContactsController < Api::V1::BaseController

  def get_access_token
    unless params[:token].exists?
      render json: {errors: ['Missing access token']}, status: :unauthorized, callback: params[:callback]
      return false
    end
    test = User.find_by_device_token(params[:token])
  end
end
