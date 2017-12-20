class Client < ApplicationRecord
  has_many :client_files, dependent: :destroy

  accepts_nested_attributes_for :client_files



  def change_busy
    if self.busy == false
       lock!
       update(busy: true)
       update(name:"tareq")
      sleep 60
      update(busy: false)
    else
      raise 'the client is busy'
    end
  end

end
