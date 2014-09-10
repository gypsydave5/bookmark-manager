TOKEN_ELEMENTS = (1..9).to_a + ('a'..'z').to_a + ('A'..'Z').to_a

get '/sessions/new' do
	erb :"sessions/new"
end

post '/sessions' do
	email, password = params[:email], params[:password]
	user = User.authenticate(email, password)
	if user
		session[:user_id] = user.id
		redirect to('/')
	else
		flash[:errors] = ["The email or password is incorrect"]
		erb :"sessions/new"
	end
end

delete '/sessions' do
	session.delete(:user_id)
	flash[:notice] = "Good bye!"
	redirect to('/sessions/new')
end


get '/sessions/recovery' do
	erb :"sessions/recovery"
end

post '/sessions/recovery' do
	user = User.first( email: params[:email] )
	user.password_token = (1..64).map{ TOKEN_ELEMENTS.sample }.join
	user.password_token_timestamp = Time.now
	user.save
	flash[:notice] = "Please check your email for a link to reset your password"
end

get '/sessions/recovery/:password_token' do
	user = User.first( password_token: params[:password_token] )
	@user = user.email
	session[:user_id] = user.id
	erb :"sessions/recovery_reset"
end

post '/session/recovery_reset' do
	@user = User.first( id: sesssion[:user_id] )
	@user.password = params[:password]
	@user.password_token = params[:password_token]
	if @user.save
		flash[:notify] = "Password reset successfully!"
		redirect to('/')
	else
		flash.now[:errors] = @user.errors.full_messages
		erb :"sessions/recovery_reset"
	end
end
