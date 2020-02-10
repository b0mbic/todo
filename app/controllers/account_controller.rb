class AccountController < ApplicationController

  def index
    add_breadcrumb 'My account', :account_path
  end
end
