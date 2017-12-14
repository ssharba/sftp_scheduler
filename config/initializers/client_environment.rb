class ClientEnvironment

  $ENVIRONMENTS = YAML.load_file("#{Rails.root}/config/client.yml")
  
end
