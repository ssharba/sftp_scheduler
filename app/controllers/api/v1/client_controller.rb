class Api::V1::ClientController < ApplicationController

  def create


  file_key =params[:file_key]
  files_dir = HelperMethods.aws_download(file_key)
  HelperMethods.aws_upload(files_dir)

  end

end
