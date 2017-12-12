class Client < ApplicationRecord
  has_many :client_files, dependent: :destroy

  accepts_nested_attributes_for :client_files
end
