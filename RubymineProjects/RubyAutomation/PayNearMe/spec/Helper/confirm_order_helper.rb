module ConfirmOrderHelper

  def ok_btn_order_confirm_pg
    @driver.find_element(:css,"button.btn.primary")
  end

  def order_num_field
    @driver.find_element(:css,"span.acct")
  end

  def wait_for_order_confirm_pg_to_load
    wait_true(30){ order_num_field.displayed? }
    wait_true(30){ expect(ok_btn_order_confirm_pg.displayed?).to be_truthy }
  end


end