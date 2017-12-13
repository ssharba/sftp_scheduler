class SftpDownload
  def self.process_file_for_download(client_id)
    client = Client.find(client_id)
    client_name = client.name
    Dir.mkdir "#{Rails.root}/public/#{client_name}/"
    DownloadJob.perform_async(client.id)
  end
end
