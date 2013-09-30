get '/' do
  # Look in app/views/index.erb
  erb :index
end



post '/posts' do
  p @user = User.find_or_create_by_username(params[:username].downcase)
  if @user.tweets.empty?
     @user.fetch_tweets!
  elsif @user.tweets_stale?
     @user.fetch_tweets!
  end

   erb :tweets, layout: false

end  

get '/yolo' do 
  @yolo = Twitter.search("yolo", :count => 1, :result_type => "recent").attrs[:statuses].first[:text]
  

  erb :yolo, layout: false

end  

post "/tweet" do
  p Twitter.update(params[:tweet])

end
