module WaitHelper

  def wait_true(no_of_sec,&block)
    wait = Selenium::WebDriver::Wait.new(:timeout => no_of_sec)
    wait.until &block
  end

end