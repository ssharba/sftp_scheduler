class FindEnvironment
  class << self
    def environment_for(client_id)
      $ENVIRONMENTS["client#{client_id}"]
    end
  end
end
