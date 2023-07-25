class RedisProvider
  def initialize()
    puts ENV['REDIS_HOST']
    @redis = Redis.new(host: 'localhost', port: 6379)
  end

  def save(key, value)
    redis.set(key, value)
  end

  def find(key)
    redis.get(key)
  end
  private

  attr_reader :redis
end
