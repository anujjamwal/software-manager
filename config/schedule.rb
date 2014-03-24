set :output, "log/cron.log"

every 1.day do
  rake 'files:sync'
end