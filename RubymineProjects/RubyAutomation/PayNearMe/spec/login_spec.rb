require 'spec_helper'
require 'rubygems'
require 'selenium-webdriver'
include LoginHelper
include GenericHelper

describe 'Login:' do

  it 'should allow user to login with correct username and password' do

    signup
    login
    verifylogin
  end


end