require 'spec_helper'
require 'rubygems'
require 'selenium-webdriver'
include LoginHelper
include GenericHelper

describe 'Login:' do

  it 'should allow user to login with correct username and password' do

    login_link=wait_true(10) {
      element= @driver.find_element(:css,'.login-footer > a:nth-child(1)')
      element if element.displayed?
    }
    login_link.click

    username_field=wait_true(15) {
      element=@driver.find_element(:id,'input-email')
      element if  element.displayed?
    }
    username_field.send_keys('test1@gmail.com')


    pswd_field=wait_true(15) {
      element=@driver.find_element(:id,'input-password')
      element if element.displayed?
    }
    pswd_field.send_keys("1qaz@WSX")

    login_btn=wait_true(15) {
      element= @driver.find_element(:css,'#button-login')
      element if element.displayed?
    }
    login_btn.click


  end


end