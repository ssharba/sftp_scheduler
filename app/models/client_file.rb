class ClientFile < ApplicationRecord
  belongs_to :client, optional: true

  def sftp_download(file_name)
  begin
    Net::SSH.start("test.rebex.net", "demo", password: ("password")) do |ssh|
      ssh.sftp.connect do |sftp|
        sftp.download! "/pub/example/#{file_name}", "#{Rails.root}/public/#{file_name}"
      end
    end
  rescue
    return false
  end
    true
  end
end
