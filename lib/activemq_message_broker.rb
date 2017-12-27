class ActivemqMessageBroker
  Client = Stomp::Client.new("admin", "admin", "localhost", 61613)

  def initialize(queue)
    @queue = queue
  end

  def publish(message)
    marshalled_message = Marshal.dump(message)
    Client.publish(@queue, marshalled_message)
  end

  def subscribe
    Client.subscribe(@queue) do |marshalled_message|
    	original_message = Marshal.load(marshalled_message)
    	# process message
   	end
  end
end
