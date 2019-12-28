module CacheService
  def self.write(key, content)
    Rails.cache.write(
      key,
      content,
      expires_in: Rails.configuration.cache_expiry
    )
  end

  def self.get(key)
    Rails.cache.read(key)
  end
end
