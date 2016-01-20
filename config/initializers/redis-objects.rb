Redis::Objects.redis = ConnectionPool.new(size: 5, timeout: 5) { Redis.new(url: ENV['REDIS_URL']) }
