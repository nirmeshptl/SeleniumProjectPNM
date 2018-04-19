module AddBillerHelper


  def order_into_page_footnote
    wait_true(30){ @driver.find_element(:class,"footnote") }
  end

  def add_account_btn_order_intro_page
     wait_true(30){ @driver.find_element(:css,"button.primary") }
  end

  def suggested_biller_list_title
    @driver.find_element(:class,"header-title")
  end

  def wait_for_suggested_biller_list_to_load
      wait_true(30) { suggested_biller_list_title.displayed? }
      wait_true(30){ @driver.find_elements(:css,'div.list-item-title').count > 7  }
  end


  def select_biller_from_suggested_list(biller_name)
     biller_list=@driver.find_elements(:css,'div.list-item-title')
     biller_list.each do |suggested_biller|
       if suggested_biller.text == biller_name
         suggested_biller.click
         break
       end
     end
  end


  def wait_for_order_intro_page_to_load
    wait_true(30){ add_account_btn_order_intro_page.displayed? }
  end


  def click_add_account
    retry_count=0
    begin
      wait_true(10){@driver.find_element(:css,"button.primary").click}
    rescue
      unless retry_count == 1
        wait_true(10){@driver.find_element(:css,"button.primary").displayed? }
        retry_count += 1
        retry
      end
    end
  end


end