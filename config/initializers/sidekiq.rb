class SidekiqMiddleware
  def call(worker, msg, queue)
    worker.retry_count = msg['retry_count'] if worker.respond_to?(:retry_count)
    yield
  end
end

Sidekiq.configure_server do |config|
  config.server_middleware do |chain|
    chain.add SidekiqMiddleware
  end
end
