require 'zip'
require 'aws-sdk'
module HelperMethods
    class << self
     def aws_download(file_key)
         s3 = Aws::S3::Client.new(access_key_id: ENV['aws_access_key_id'], secret_access_key: ENV['aws_secret_access_key'], region: ENV['region'])
         files_dir = (FileUtils.mkdir_p "#{Dir.home}/test_downlaod/").join(",")
         File.open("#{files_dir}#{file_key}", "wb") do |file|
            s3.get_object({bucket:ENV['directory_primary'], key: file_key}, target: file)
         end
           unzip_file(files_dir)
      end

     def aws_upload(files_dir)
        s3 = Aws::S3::Resource.new(access_key_id: ENV['aws_access_key_id'], secret_access_key: ENV['aws_secret_access_key'], region: ENV['region'])
        files_dir.each do |file_path|
          file_name = File.basename(file_path)
          obj = s3.bucket(ENV['directory_secondary']).object(file_name)
          puts "Uploading file #{file_name}"
          obj.upload_file("#{file_path}")
        end
   end
     def unzip_file (files_dir)
          item_folder = []
          begin
          file = Dir.glob("#{files_dir}*.zip").first
           Zip::File.open(file) do |zip_file|
             zip_file.each do |entry|
               file_path="#{files_dir}#{entry.name}"
                  entry.extract(file_path)
                    if entry.compressed_size > 0
                      item_folder.push(file_path)
                    end
                 end
              end
           rescue  Exception=>e
            Rails.logger.error(" The file is #{e.message}")
           end
            return item_folder
      end

   end
end
