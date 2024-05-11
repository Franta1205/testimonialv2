class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_locale
  helper_method :show_index_nav?

  def set_locale
    I18n.locale = :cz
  end

  def show_index_nav?
    controller_name == 'workspaces' && action_name == 'index'
  end
end
