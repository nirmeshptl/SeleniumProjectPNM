module AcDetailsHelper

  def account_name_in_header
    @driver.find_element(:css,"div#merchant-flow-header h4")
  end

  def enter_ac_field
    @driver.find_element(:css,"input.ng-valid-customer_identifier")
  end

  def reenter_ac_field
    @driver.find_element(:css,"input.ng-valid-confirm_customer_identifier")
  end

  def first_name_field
    @driver.find_element(:css,"input#input-customer_first_name")
  end

  def last_name_field
    @driver.find_element(:css,"input#input-customer_last_name")
  end

  def wait_for_account_details_pg_to_load(biller_name)
     wait_true(30) { expect(account_name_in_header.text).to eq biller_name }
     wait_true(30) { @driver.find_elements(:id,"input-customer_identifier").count > 2}
  end

  def ac_details_pg_continue_btn
     @driver.find_element(:css,"button.btn:nth-child(1)")
  end


end