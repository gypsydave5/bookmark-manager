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
	user.password_token = (1..9).map{ ('A'..'F').to_a.sample }.join
	puts user.password_token.inspect
	user.password_token_timestamp = Time.now
	user.save
	send_email(user.email,user.password_token)
	flash[:notice] = "Please check your email for a link to reset your password"
end

get '/sessions/recovery/:password_token' do
	
	erb :"sessions/recovery_reset"
end

post '/sessions/recovery_reset' do
	puts User.first.inspect
	puts params[:password_token]
	user = User.first( password_token: params[:password_token] )
	puts user.inspect
	unless user.email == params[:email]
		flash.now[:notice] = "Incorrect email. Please contact customer services or request a new new password email"
		user.password_token = nil
		user.save
		redirect to ('/')
	end

	user.password = params[:password]
	user.password_confirmation = params[:password_confirmation]

	if user.save
		flash[:notice] = "Password reset successfully!"
		session[:user_id] = user.id
		user.password_token = nil
		user.save
		redirect to('/')
	else
		flash.now[:errors] = user.errors.full_messages
		erb :"sessions/recovery_reset"
	end
end
