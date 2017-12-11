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
    Net::SSH.start("test.rebex.net", "demo", password: ("password")) do |ssh|
      ssh.sftp.connect do |sftp|
        client = Client.find(client_id)
        client.client_files.each do |file|
          Dir.mkdir "#{Rails.root}/public/#{client.name}/" unless Dir.exists? "#{Rails.root}/public/#{client.name}"
          file_name = file.file_format
          sftp.download! "/pub/example/#{file_name}", "#{Rails.root}/public/#{client.name}/#{file_name}"
        end
      end
    end
  end
end
