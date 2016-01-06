web: bundle exec puma -p $PORT
cable: bundle exec puma -p $PORT cable/config.ru
redis: redis-server
worker: bundle exec sidekiq -C config/sidekiq.yml
