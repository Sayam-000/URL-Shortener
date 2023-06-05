#THIS IS THE MAIN .rb FILE TO RUN :)
#local dir--> test_demo3.rb

require 'rubygems'
require 'sinatra'
require 'base64'
require 'pstore'

# get '/firstapp' do
#     "Welcome to my first Sinatra App !"
# end



get '/:url' do
    # "URL is #{params[:url]}"
    original = ShortURL.read(params[:url])
    # redirect "http://" + ShortURL.read(params[:url])
    if original
        redirect "http://" + original
    else
        "URL not found !!"
    end

end

# get '/:url' do
#     encoded_url = params[:url]
#     original = ShortURL.read(encoded_url)
  
#     if original
#       if url_valid?(original)
#         redirect "http://" + original
#       else
#         "Invalid URL!"
#       end
#     else 
#       "URL not found!"
#     end
# end
  
# def url_valid?(url)
#     uri = URI.parse(url)
#     uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS)
#  rescue URI::InvalidURIError
#     false
# end

# get '/' do
#     erb:index
# end

get '/' do
    "Enter your URL using a curl post request"
end 

post '/' do
    url = generate_short_url(params[:url])
    "Your shorten URL is: #{url}\n"
end

def generate_short_url(original)

    ShortURL.save(Base64.encode64(original)[0..6], original)


    "localhost:4567/"+Base64.encode64(original)[0..6] #encode the original url and return the first 7 characters

end

class ShortURL      #singleton class
    def self.save(encoded, original)
    #    store = PStore.new("shortened_urls.db")
       
       store.transaction {|t| store[encoded] = original} # kind of hash
    end

    def self.read(encoded)
        store.transaction { store[encoded]}
    end
    
    def self.store
        @store ||= PStore.new("shortened_urls.db") # ||= means if @store is nil then create a new PStore and we dont have to reopen the file
    end
end


# 1.Interactive form in front end to typ the long url --[in cmd..] curl http://localhost:4567/ --data "url=www.google.com" -X POST

# 2. List of all the urls that are stored in the database -- (not rqrd)

# 3. validity check for the url -- portion is in between comment
