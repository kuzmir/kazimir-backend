class Admin::AdminController < ApplicationController

  protect_from_forgery with: :exception
  layout 'admin/layouts/application'
  http_basic_authenticate_with name: Rails.application.secrets.admin_login, password: Rails.application.secrets.admin_password

  def index

  end

end
