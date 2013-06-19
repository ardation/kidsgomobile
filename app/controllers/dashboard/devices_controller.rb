class Dashboard::DevicesController < Dashboard::BaseResourceController
  actions :index, :show, :new

  def new
    @token = current_user.get_device_token
  end

  protected

  def begin_of_association_chain
    current_user
  end
end
