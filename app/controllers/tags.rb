get '/tags/:text' do
	tag = Tag.first(:text => params[:text])
	@links = tag ? tag.links.all(Link.users.id => session[:user_id]) : []
	erb :index
end









