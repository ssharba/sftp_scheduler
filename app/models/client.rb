class Client < ApplicationRecord
  has_many :client_files

  def initials
    name.split(" ").first
  end
end
