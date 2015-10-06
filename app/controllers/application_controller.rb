class ApplicationController < ActionController::Base
  require 'verb'
  
  protect_from_forgery
  
  before_filter :set_locale
  
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
