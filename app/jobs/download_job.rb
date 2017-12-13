class DownloadJob
  include Sidekiq::Worker
  sidekiq_options queue:'download_file', retry: 3#10

  sidekiq_retry_in do |count|
     10#600
  end

  sidekiq_retries_exhausted do |msg, e|
    Rails.logger.warn "Failed #{msg['class']} with #{msg['args']}: #{msg['error_message']}"
  end

  def perform(client_id)
    client = Client.find(client_id)
    file_names = client.client_files.map(&:file_format)
    file_names.each do |file_name|
      file_properties = { file_name: file_name, client_name: client.name }
      SftpDownload.new(file_properties).call
    end
  end
end
