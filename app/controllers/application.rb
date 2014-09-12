get '/' do
	@links = Link.all(Link.users.id => session[:user_id]) || []
	# p session[:user_id]
	# p @links
	# p "======="
	# puts Link.all(Link.users(:id => 1)
		# :users => [{:id => session[:user_id]},])|| []
	erb :index
end
