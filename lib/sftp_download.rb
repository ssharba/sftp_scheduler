class SftpDownload
  attr_reader :file_name, :client_name

  def initialize(file_name:, client_name:)
    @file_name = file_name
    @client_name = client_name
  end

  def call
    file_path = "#{Rails.root}/public/#{client_name}/#{file_name}"
    Net::SFTP.start("test.rebex.net", "demo", password: ("password")) do |sftp|
      sftp.download! "/pub/example/#{file_name}", file_path
    end
  end

  def self.process_file_for_download(client_id)
    client = Client.find(client_id)
    client_name = client.name
    Dir.mkdir "#{Rails.root}/public/#{client_name}/"
    DownloadJob.perform_async(client.id)
  end
end
