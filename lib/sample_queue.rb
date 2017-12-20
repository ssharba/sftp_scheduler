require 'aws-sdk-sqs'

class SampleQueue
  attr_reader :queue_name

  SQS = AwsClient::SQS

  def initialize(queue_name)
    @queue_name = queue_name
  end

  def create_queue
    SQS.create_queue(queue_name: queue_name)
  end

  def set_queue_attributes(**attributes)
    SQS.set_queue_attributes({ queue_url: queue_url, attributes: attributes })
  end

  def get_queue_attributes(*attribute_names)
    SQS.get_queue_attributes queue_url: queue_url, attribute_names: attribute_names
  end

  def queue_url
    @queue_url ||= SQS.get_queue_url(queue_name: queue_name).queue_url
  end

  def send_message(message, message_attributes = {})
    SQS.send_message(
      queue_url: queue_url,
      message_body: message,
      message_attributes: message_attributes
    )
  end

  def send_message_batch(messages)
    SQS.send_message_batch({
      queue_url: queue_url,
      entries:  messages
    })
  end

  def receive_message(number_of_messages = 1)#10 messages max
    SQS.receive_message({
      queue_url: queue_url,
      message_attribute_names: ["All"], # Receive all custom attributes.
      max_number_of_messages: number_of_messages,
      wait_time_seconds: 0, # Do not wait to check for the message.
      visibility_timeout: 0
    }).messages
  end

  def delete_message(receipt_handle)
    SQS.delete_message(queue_url: queue_url, receipt_handle: receipt_handle)
  end

  def self.list_queues
    SQS.list_queues
  end
end
