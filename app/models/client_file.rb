class ClientFile < ApplicationRecord
  belongs_to :client, optional: true
end
