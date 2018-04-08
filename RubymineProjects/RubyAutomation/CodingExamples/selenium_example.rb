#require_relative '../spec_helper'
#require 'rubygems'
#require 'selenium-webdriver'


#driver = Selenium::WebDriver.for :firefox
#driver.get "http://google.com"

element = @driver.find_element( :name => "q")
element.send_keys "Techkampus"
element.submit

puts "Page title is #{@driver.title}"

wait = Selenium::WebDriver::Wait.new(:timeout => 15)
wait.until { @driver.title.downcase.start_with? "techkampus" }

puts "Page title is #{@driver.title}"
