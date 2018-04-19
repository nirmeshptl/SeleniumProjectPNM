require 'spec_helper'
require 'test/unit'
require 'test/unit/assertions'
include SignupHelper
include LoginHelper
include WaitHelper
include GenericHelper
include PredashHelper
include AddBillerHelper
include AcDetailsHelper
include ConfirmOrderHelper
include SetReminderHelper


describe 'Add Bill' do

  it 'should allow user to add bill and show up on dashboard' do
    email_add=random_email_generator
    ac_num=random_ac_num
    signup(email_add)
    wait_for_predash_to_load

    add_bill_btn=wait_true(10){
      element=@driver.find_element(:id,"btn-add-bill")
      element if element.displayed?
    }

    add_bill_btn.click
    wait_for_suggested_biller_list_to_load
    select_biller_from_suggested_list("GEICO")
    wait_for_order_intro_page_to_load
    click_add_account
    wait_for_account_details_pg_to_load("GEICO")
    enter_ac_field.send_keys(ac_num)
    reenter_ac_field.send_keys(ac_num)
    first_name_field.send_keys("abc")
    last_name_field.send_keys("xyz")
    ac_details_pg_continue_btn.click
    wait_for_order_confirm_pg_to_load
    ok_btn_order_confirm_pg.click
    wait_set_reminder_pg_to_load
    click_submit_btn
    sleep 5

  end

end