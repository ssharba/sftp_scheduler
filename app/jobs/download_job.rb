class DownloadJob
  include Sidekiq::Worker
  sidekiq_options queue:'download_file', retry: 10

  sidekiq_retry_in do |count|
     600
  end

  sidekiq_retries_exhausted do |msg, e|
    Rails.logger.warn "Failed #{msg['class']} with #{msg['args']}: #{msg['error_message']}"
  end

  def perform(client_id)
    client = Client.find(client_id)
    file_names = client.client_files.map(&:file_format)
    file_names.each do |file_name|
      download_file(file_name, client.name)
    end
  end

  private

  def download_file(file_name, client_name)
    file_path = "#{Rails.root}/public/#{client_name}/#{file_name}"
    Net::SFTP.start("test.rebex.net", "demo", password: ("password")) do |sftp|
      sftp.download! "/pub/example/#{file_name}", file_path
    end
  end
end
