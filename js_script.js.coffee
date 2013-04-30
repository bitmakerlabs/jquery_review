$(document).ready ->
  $('div.container ul.list li').on "click", ->
    $(@).toggleClass "green"