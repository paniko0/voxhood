Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://:cdQ2UksKNVmQlmV26M9Mj7HaoEETL5bC@127.0.0.1:6379/12' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://:cdQ2UksKNVmQlmV26M9Mj7HaoEETL5bC@127.0.0.1:6379/12' }
end
