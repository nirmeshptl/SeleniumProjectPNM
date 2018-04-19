module SetReminderHelper

  def set_reminder_header_text
    @driver.find_element(:css,"section#middle-tab-bar-section span")
  end

  def set_reminder_dyno_form
    @driver.find_element(:id,"create_reminder")
  end

  def set_reminder_submit_btn
    @driver.find_element(:css,"button.primary")
  end

  def set_reminder_notification
    @driver.find_element(:id,"notification-1")
  end

  def wait_set_reminder_pg_to_load

    wait_true(30){expect(set_reminder_dyno_form.displayed?).to be_truthy }
    puts set_reminder_dyno_form.displayed?

    wait_true(30){expect(set_reminder_notification.displayed?).to be_truthy }
    puts set_reminder_notification.displayed?

    wait_true(30){expect(set_reminder_submit_btn.displayed?).to be_truthy }
    puts set_reminder_submit_btn.displayed?

    puts @driver.find_elements(:class,"pnm-loading-overlay").count
  end

  def wait_for_overlay_to_disappear
    wait_true(60){ @driver.find_elements(:class,"pnm-loading-overlay").count == 0 }
  end



  def click_submit_btn
    if !@driver.find_element(:class,"pnm-loading-overlay").displayed?
      if set_reminder_submit_btn.displayed?
        wait_true(20){ set_reminder_submit_btn.click }
      end
   end
  end
end


