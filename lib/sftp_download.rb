class SftpDownload
  def self.process_file_for_download(client_id)
    client = Client.find(client_id)
    client_name = client.name
    Dir.mkdir "#{Rails.root}/public/#{client_name}/"
    client.client_files.each do |file|
      file_name = file.file_format
      DownloadJob.perform_async(file_name, client_name)
    end
  end
end
