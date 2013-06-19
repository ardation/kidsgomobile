class Dashboard::BaseResourceController < InheritedResources::Base
  respond_to :html, :json
  protect_from_forgery
  layout "dashboard"
end
