# This class corresponds to a table in the database
# We can use it to manipulate the data
class Link

	# this makes the instances of this class Datamapper resources
	include DataMapper::Resource

	#This block desribes what resources our model will have
	property :id, 		Serial #Serial means it will be auto-incremented for every record
	property :title,	String
	property :url,		String
	has n, :tags, :through => Resource
	has n, :users, :through => Resource

end