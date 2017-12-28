class Worker
  Client = Stomp::Client.open("stomp://localhost:61613")

  def initialize(queue)
    @queue = queue
  end

  def subscribe
    Client.subscribe(@queue) do |message|
      puts message
   	end
  end
end
