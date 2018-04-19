module PredashHelper

  def wait_for_predash_to_load

     pay_bill_btn=wait_true(10){
       element=@driver.find_element(:id,"btn-add-bill")
       element if element.displayed?
     }
     pay_bill_btn.displayed?

  end



end