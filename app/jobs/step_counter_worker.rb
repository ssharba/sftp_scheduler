class StepCounterWorker
  include Sidekiq::Worker

  # To make the retry happend faster  for testing purposes
  sidekiq_retry_in do |count|
    1
  end

  def perform(*args)

    if HelperMethods.step_counter == 1
      puts "1 +++++"
      raise "error number 1"
    end
    #HelperMethods.step_counter =3
    if HelperMethods.step_counter == 3
      puts "3 +++++"
      raise "error number 3"
    end

    if HelperMethods.step_counter == 6
      puts "6 +++++"
      raise "error number 6"
    end

    if HelperMethods.step_counter == 10
      puts "10 +++++"
      raise "error number 10"
    end
  end
=begin  THIS IS THE RESULT IN SIDEKIQ TERMINAL
1 +++++
3 +++++
6 +++++
10 +++++
=end
end
