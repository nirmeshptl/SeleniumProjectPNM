module SignupHelper

  def signup (email,pswd="1qaz@WSX",zipcode=95035)
    #step 1: Enter email or phone num
    email_field_element= wait_true(15){
      element = @driver.find_element(:id,"input-email_or_phone")
      element if element.displayed?
    }
    email_field_element.send_keys(email)

    #step 2 : Enter password
    pswd_field_element=wait_true(15) {
      element=@driver.find_element(:id,"input-password")
      element if element.displayed?
    }
    pswd_field_element.send_keys(pswd)

    #step 3: Enter zip code
    zip_code_field_element=wait_true(15) {
      element = @driver.find_element(:id,'input-postalcode')
      element if element.displayed?
    }
    zip_code_field_element.send_keys(zipcode)

    signup_btn_element = wait_true(15) {
      element= @driver.find_element(:id,"button-sign-up")
      element if element.displayed?
    }
    signup_btn_element.click
  end


end