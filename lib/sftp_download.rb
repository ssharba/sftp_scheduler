class SftpDownload
  def self.process_file_for_download(client_id)
    client = Client.find(client_id)
    client_name = client.name
    client_files = client.client_files.map(&:file_format)
    Dir.mkdir "#{Rails.root}/public/#{client_name}/"
    DownloadJob.perform_async(client_files, client_name)
  end
end
