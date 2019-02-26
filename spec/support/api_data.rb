RSpec.configure do |config|
    config.before(:each) do   
      # currencydatafeed stub
      stub_request(:get, /currencydatafeed.com/ )
      .with(headers: {
        'Accept'=>'*/*'
      }).to_return(status: 200, body: '
        {
          "status": true,
          "currency": [
              {
                  "currency": "USD/BRL",
                  "value": "3.41325",
                  "date": "2018-04-20 17:22:59",
                  "type": "original"
              }
          ]
        }', headers: {})

      # cryptocompare stub
      stub_request(:get, "https://min-api.cryptocompare.com/data/price?api_key=a25eb5cff8b5a0925fe92b66d9b4b028e1fabef9257b3643d3b19dae29507dae&fsym=BTC&tsyms=BRL").
      with(
        headers: {
       'Accept'=>'*/*',
       'Accept-Encoding'=>'gzip, deflate',
       'Host'=>'min-api.cryptocompare.com',
       'User-Agent'=>'rest-client/2.0.2 (linux-gnu x86_64) ruby/2.5.1p57'
        }).
      to_return(status: 200, body: '{"BRL":14431.8}', headers: {})
  
      
    end
  end