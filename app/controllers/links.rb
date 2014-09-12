post '/links' do
	url = params["url"]
	title = params["title"]
	tags = params["tags"].split(" ").map do |tag|
		#this will either find this tag or create it if it doesn't exist already
		Tag.first_or_create(text: tag)
	end
	Link.create(:url => url, :title => title, :tags => tags, :users => [User.first(:id => session[:user_id])] )
	redirect to('/')
end

