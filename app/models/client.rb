class Client < ApplicationRecord
  has_many :client_files

  accepts_nested_attributes_for :client_files
end
