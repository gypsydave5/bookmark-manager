API_KEY = ENV['MAILGUN_API_KEY']
API_URL = "https://api:#{API_KEY}@api.mailgun.net/v2/app29460727.mailgun.org/messages"

def send_email(email,token)
  RestClient.post API_URL,
  :from => "me@samples.mailgun.org",
  :to => email,
  :subject => "Bookmark Manager password reset",
  :text => "Please click on the following likn to reset your password : http://www.shrouded-island-5985.herokuapp.com/sessions/recovery/#{token}"
end
