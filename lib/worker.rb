class Worker
  Client = Stomp::Client.open("stomp://localhost:61613")

  def initialize(queue)
    @queue = queue
  end

  def subscribe
    Client.subscribe(@queue) do |marshalled_message|
    	original_message = Marshal.load(marshalled_message)
    	# process message
      puts original_message
   	end
  end
end
