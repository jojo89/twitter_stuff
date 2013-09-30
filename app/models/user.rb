class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :tweets

  def fetch_tweets!
    Twitter.user_timeline(self.username)[0..9].each do |tweet|
      self.tweets << Tweet.create(body: tweet.text)
    end
    p self.tweets
  end  

  def tweets_stale?
    self.tweets.last.created_at + 900 < Time.now()
  end  

end
