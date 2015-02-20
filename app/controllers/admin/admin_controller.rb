class Admin::AdminController < ApplicationController

  layout 'admin/layouts/application'

  protect_from_forgery with: :exception
  http_basic_authenticate_with name: Rails.application.secrets.admin_login,
                               password: Rails.application.secrets.admin_password

  def index

  end
  

end
