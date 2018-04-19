require 'spec_helper'
require 'selenium-webdriver'
require 'test/unit'
require 'test/unit/assertions'

include GenericHelper

describe 'Signup : ' do

  it 'Should allow user to signup' do

     email= random_email_generator

     signup(email)

     verify_signup()

  end


  it "Should throw error on entering wrong email format" do

    email_field_element=wait_true(10) {
      element = @driver.find_element(:id,"input-email_or_phone")
      element if element.displayed?
    }
    email_field_element.send_keys("nir.gmail.com")

    pswd_field_element=wait_true(10) {
      element = @driver.find_element(:id,"input-password")
      element if element.displayed?
    }
    pswd_field_element.send_keys("1qaz@WSX")

    email_err_msg=wait_true(15){
      element = @driver.find_element(:id,"error-email_or_phone")
      element if element.displayed?
    }
    assert ( email_err_msg.text == "Email or phone number is not valid" )

  end

  it "should throw error on entering wrong zip code" do

    zipcode_field_element=wait_true(15){
      element = @driver.find_element(:id,'input-postalcode')
      element if element.displayed?
    }
    zipcode_field_element.send_keys("9503")


    pswd_field_element=wait_true(10) {
      element = @driver.find_element(:id,"input-password")
      element if element.displayed?
    }
    pswd_field_element.click


    zip_code_error_msg=wait_true(15){
      element = @driver.find_element(:id,"error-postalcode")
      element if element.displayed?
    }
    assert ( zip_code_error_msg.text == "Zip code is not valid" )

  end

end