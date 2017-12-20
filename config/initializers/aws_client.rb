class AwsClient
  SQS = Aws::SQS::Client.new(
    access_key_id: ENV["access_key_id"],
    secret_access_key: ENV["secret_access_key"],
    region: ENV["region"]
  )
end
