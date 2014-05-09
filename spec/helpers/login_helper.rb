def mock_login(user)
  session[:user_id] = user.id
end
