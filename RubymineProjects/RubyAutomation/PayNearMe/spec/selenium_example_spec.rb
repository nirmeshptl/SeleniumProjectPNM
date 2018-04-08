require 'rubygems'
require 'selenium-webdriver'

wait = Selenium::WebDriver::Wait.new(:timeout => 10)
driver = Selenium::WebDriver.for :chrome
driver.get "http://google.com"

element = driver.find_element :id=>"lst-ib"
element.send_keys "Cheese!"
element.submit

puts "Page title is #{driver.title}"
wait.until { driver.title.downcase.start_with? "cheese!" }

puts "Page title is #{driver.title}"
driver.quit

