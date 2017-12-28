class MessagePublisher
  Client = Stomp::Client.open("admin", "admin", "localhost", 61613)

  def initialize(queue)
    @queue = queue
  end

  def publish(message)
    marshalled_message = Marshal.dump(message)
    Client.publish(@queue, marshalled_message)
  end
end
