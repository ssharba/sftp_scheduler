class TestRetryWorker
  include Sidekiq::Worker

  # create attribut called retry_count for sidekiq
  attr_accessor :retry_count

  # This will increase the count by 1, Note it's initial value is 0
  def retry_count
    @retry_count.nil? ? 0 : @retry_count+1
  end

  # To make the retry happend faster  for testing purposes
  sidekiq_retry_in do |count|
    1
  end


  def perform(*args)
    puts "Job ID => #{self.jid} == Count times ==> #{retry_count} = will stop in count less than 3 " if retry_count <3
    raise 'This is TEST ERROR'
  end
end
