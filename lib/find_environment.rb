class FindEnvironment
  class << self
    def environment_for(client_id)
      environment = $ENVIRONMENTS.find do |client_environment|
        clients = client_environment[:clients]
        clients.find do |client|
          client[:client_id] == client_id
        end
      end
      return false unless environment
      environment[:env_id]
    end
  end
end
