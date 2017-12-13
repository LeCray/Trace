require 'redis'

#uri = URI.parse(ENV["REDISCLOUD_URL"])
REDIS = Redis.new(url: ENV["REDISCLOUD_URL"])
#REDIS = Redis.new(:host => uri.host, :port => uri.port)
