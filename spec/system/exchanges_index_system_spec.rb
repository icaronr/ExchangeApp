require 'rails_helper'
 
RSpec.describe "Exchange Currency Process", :type => :system, js: true do
  it "show exchanged value" do
    visit '/'
    within("#exchange_form") do
      select('EUR', from: 'source_currency')
      select('USD', from: 'target_currency')
      fill_in 'amount', with: '10'
    end
    #click_button 'CONVERTER' trocado para alterar ao entrar com input
    wait_for_ajax
    # save_and_open_page
    expect("#result").to change.by(1)
  end
end