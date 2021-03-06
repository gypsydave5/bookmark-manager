API_KEY = ENV['MAILGUN_API_KEY']
LOGIN = ENV['MAILGUN_SMTP_LOGIN'].split('@')[1]
API_URL = "https://api:#{API_KEY}@api.mailgun.net/v2/#{LOGIN}/messages"
APP_URL = ENV["APP_URL"]

def send_email(email,token)
  RestClient.post API_URL,
  :from => "me@samples.mailgun.org",
  :to => email,
  :subject => "Bookmark Manager password reset",
  :text => "Please click on the following link to reset your password : #{APP_URL}sessions/recovery/#{token}"
end
