get '/' do
  @url = Url.new
  # let user create new short URL, display a list of shortened URLs
  erb :index
end

post '/urls' do 
  @url = Url.new(params)

  if @url.valid? == false
    erb :index 
  else
    short_url = '' 
    6.times do 
       short_url << ('A'..'Z').to_a.sample 
    end
    @url.short_url = short_url
    @url.save
    erb :short_url
  end

end

# e.g., /q6bda
get '/:short_url' do
  @url = Url.find_by_short_url(params[:short_url])
  redirect "http://#{@url.long_url}"
  # redirect to appropriate "long" URL
end

get '/clicked/:id' do
  @url = Url.find(params[:id])
  @url.click_counter += 1
  @url.save
  redirect "http://#{@url.long_url}"
  # create a new Url
end

