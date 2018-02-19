module SessionsHelper

  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.curent_user = user
  end

  def curent_user=(user)
    @curent_user = user
  end

  def signed_in?
    !curent_user.nil?
  end

  def sign_out
    curent_user.update_attribute(:remember_token,
                                User.encrypt(User.new_remember_token))
    cookies.delete(:remember_token)
    self.curent_user = nil
  end

  def curent_user
    remember_token = User.encrypt(cookies[:remember_token])
    @curent_user ||= User.find_by(remember_token: remember_token)
  end

  
end
