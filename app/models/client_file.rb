class ClientFile < ApplicationRecord
  belongs_to :client

  before_save { save_regex }

  private

  def save_regex
    client_initial = client.initials
    file_name = File.basename(file_format).split(".").first
    file_extension = File.extname(file_format)
    self.file_format = "#{client_initial}_#{file_name}_#{Date.today}#{file_extension}"
  end
end
