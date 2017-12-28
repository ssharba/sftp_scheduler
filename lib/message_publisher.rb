class MessagePublisher
  Client = Stomp::Client.open("stomp://localhost:61613")

  def initialize(queue)
    @queue = queue
  end

  def publish(message)
    Client.publish(@queue, message)
  end
end
