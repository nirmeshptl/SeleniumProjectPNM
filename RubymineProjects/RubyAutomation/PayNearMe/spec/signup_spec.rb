require 'rspec'
require 'selenium-webdriver'
include WaitHelper

describe 'Signup : ' do

  it 'Should allow user to signup' do
    #step 1: Enter email or phone num
    wait_true(15) {@driver.find_element(:id,"input-email_or_phone").displayed?}
    @driver.find_element(:id,"input-email_or_phone").send_keys("test1@gmail.com")

    #step 2 : Enter password
    wait_true(15) { @driver.find_element(:id,"input-password").displayed?}
    @driver.find_element(:id,"input-password").send_keys("1qaz@WSX")

    #step 3: Enter zip code
    wait_true(15) {@driver.find_element(:id,'input-postalcode').displayed?}
    @driver.find_element(:id,'input-postalcode').send_keys("95035")

    wait_true(15) { @driver.find_element(:id,"button-sign-up").displayed?}
    @driver.find_element(:id,"button-sign-up").click

    sleep 10

  end


  it "Should throw error on entering wrong email format" do
    wait_true(15) {@driver.find_element(:id,"input-email_or_phone").displayed?}
    @driver.find_element(:id,"input-email_or_phone").send_keys("nir.gmail.com")

    wait_true(15) { @driver.find_element(:id,"input-password").displayed?}
    @driver.find_element(:id,"input-password").send_keys("1qaz@WSX")

    wait_true(15){ @driver.find_element(:id,"error-email_or_phone").displayed? }
    @driver.find_element(:id,"error-email_or_phone").text.should eq "Email or phone number is not valid."
    sleep 10

  end

  it "should throw error on entering wrong zip code" do

    wait_true(15) {@driver.find_element(:id,'input-postalcode').displayed?}
    @driver.find_element(:id,'input-postalcode').send_keys("9503")


    wait_true(15) { @driver.find_element(:id,"input-password").displayed?}
    @driver.find_element(:id,"input-password").click


    wait_true(15){ @driver.find_element(:id,"error-postalcode").displayed? }
    @driver.find_element(:id,"error-postalcode").text.should eq "Zip code is not valid"


  end

end