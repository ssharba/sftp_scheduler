class Api::V1::ClientController < ApplicationController

  def create
  file_key =params[:file_key]
  files_dir = HelperMethods.aws_download(file_key)
  end


  def update
      client_with_id = Client.find params[:id]
      if lock_status(client_with_id) == false
          lock_update(params[:id],true)
          puts "now is available_____+_+_+_+_+ "
        client_with_id.update_attribute(:name,"tareq111")
          sleep 30
          lock_update(params[:id],false)
       else
         puts "is======================> busy "
      end

  end
  def lock_update(id,status)
    client =Client.find id
    client.update_attribute(:busy,status)
  end

  def lock_status(client_with_id)
  if client_with_id.busy == false
    puts"============== the value false"
     return false
  else
    puts"============== the value true========"
    raise "the DB now available please wait"
    return true
  end
  end








  def upload_to_aws(files_dir)

    HelperMethods.aws_upload(files_dir)

  end

end
