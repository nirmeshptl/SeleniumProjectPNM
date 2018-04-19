module GenericHelper

  def wait_true(no_of_sec,&block)
    wait = Selenium::WebDriver::Wait.new(:timeout => no_of_sec)
    wait.until &block
  end

  def ramdom_num
     return Random.new.rand(100..999999)
  end

  def random_ac_num
    return Random.new.rand(1010101..99999999999)
  end

  def random_email_generator
    return "test+#{ramdom_num}@gmail.com"
  end


end