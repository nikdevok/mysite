# require "spec_helper"

module FeatureHelpers
  include Warden::Test::Helpers
  Warden.test_mode!

  def sign_out
    logout(:user)
  end

  alias_method :log_out, :sign_out

  def sign_in(user)
    login_as(user, scope: :user)
  end

  def sop
    save_and_open_page
  end

  def default_password
    "1234567a"
  end
end
