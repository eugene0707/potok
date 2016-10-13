ready = ->
  return if ($('#calculate_amount').length == 0)

  $('#calculator_form').on 'submit', (e)->
    e.preventDefault()
    e.stopPropagation()
    $('#calculate_amount').blur()

  $('#calculate_amount').on 'input', ->
    v = $(this).val()
    vc = v.replace(/[^0-9]/, '')
    $(this).val(vc) if (v != vc)
    amount = parseInt($(this).val()) || 0
    $('#investment_stats').toggle(amount > 0)
    calculate_stats(amount)

  calculate_stats = (amount) ->
    $('#expected_rate').text(parseInt(window.gon.investment_stats.interest_rate * 100))
    $('#expected_profit').text(parseInt(amount * window.gon.investment_stats.interest_rate * (window.gon.investment_stats.term / 12)))
    $('.investment_term').text(window.gon.investment_stats.term)
    $('#actual_rate').text(parseInt(window.gon.investment_stats.actual_rate * 100))
    $('#actual_profit').text(parseInt(amount * window.gon.investment_stats.actual_rate * (window.gon.investment_stats.term / 12)))

  $('#calculate_amount').val(window.gon.investment_stats.total_amount)
  calculate_stats(window.gon.investment_stats.total_amount)

$(document).ready(ready)
$(document).on('turbolinks:load', ready)