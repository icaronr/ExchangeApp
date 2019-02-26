$(document).ready ->
 
  $('form').change ->
    if $('form').attr('action') == '/convert'
        make_conversion()
      return false;

  $('#switch_currency').click ->
    source_currency = $("#source_currency").val()
    target_currency = $("#target_currency").val()
    $("#source_currency").val(target_currency)
    $("#target_currency").val(source_currency)
    make_conversion()


  make_conversion = () =>
    conversion = '/convert'
    if ($("#source_currency").val() == "BTC") || ($("#target_currency").val() == "BTC")
      conversion = '/convert-btc'
    $.ajax conversion,
        type: 'GET'
        dataType: 'json'
        data: {
                source_currency: $("#source_currency").val(),
                target_currency: $("#target_currency").val(),
                amount: $("#amount").val()
              }
        error: (jqXHR, textStatus, errorThrown) ->
          alert textStatus
        success: (data, text, jqXHR) ->
          $('#result').val(data.value)