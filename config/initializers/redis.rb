require 'redis'

uri = URI.parse(ENV["REDISCLOUD_URL"])
#redis = Redis.new(url: "redis://rediscloud:password@localhost:6379")
REDIS = Redis.new(:host => uri.host, :port => uri.port)
