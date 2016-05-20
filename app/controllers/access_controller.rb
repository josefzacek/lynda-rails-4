  before_action :confirm_logged_in, except: [:login, :attempt_login, :logout]
  layout 'admin'

  def index
  end

  def login
  end

