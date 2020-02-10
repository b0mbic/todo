class SettingsController < ApplicationController

  def index
    add_breadcrumb "Settings", :settings_path
  end
end
