class ApplicationController < ActionController::Base
  def user_root_path
    home_index_path
  end
end