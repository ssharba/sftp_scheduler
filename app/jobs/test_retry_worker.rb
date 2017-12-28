class TestRetryWorker
  include Sidekiq::Worker

  def step_counter
    @step.nil? ? @step = 1 : @step += 1
  end

  def perform(*args)
    puts "++++++++#{step_counter}++++++++"
    puts "++++++++#{step_counter}++++++++"
    puts "++++++++#{step_counter}++++++++"
    puts "++++++++#{step_counter}++++++++"
    puts "++++++++#{step_counter}++++++++"
    puts "++++++++#{step_counter}++++++++"
    puts ""
    raise 'This is TEST ERROR'
  end


=begin  THIS IS THE RESULT IN SIDEKIQ TERMINAL
++++++++1++++++++
++++++++2++++++++
++++++++3++++++++
++++++++4++++++++
++++++++5++++++++
++++++++6++++++++

++++++++1++++++++
++++++++2++++++++
++++++++3++++++++
++++++++4++++++++
++++++++5++++++++
++++++++6++++++++
=end
end
