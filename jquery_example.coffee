  # Toggle different classes on certain elements
  # $(function() {
  #   $('div.container ul.list li').on("click", function(){
  #     $(this).toggleClass('green')
  #   })
  # })

  # http://jqfundamentals.com/chapter/jquery-basics
  # AND http://learn.shayhowe.com/advanced-html-css/jquery
  
  # 1. Toggleclass, add, remove
  # 2. Chaining methods (closest, children, find)
  # 3. Getting and Setting (.attr, .data, .val)
  # 4. How to use events
  # 5. AJAX
  #   - url (only required parameter),
  #   - type (default is get),
  #   - success (RESPONSE SENT),
  #   - dataType (usually json or jsonp),
  #   - data (emulating a form submission - can pass it a JS object, THIS IS THE REQUEST)
  # http://lcboapi.com/products?q=waupoos&callback=wordd

$(document).ready ->
  console.log $('div.container ul.list li').length
  $('div.container ul.list li').on "click", ->
    $(@).toggleClass "green"

  $ ->
    $("#slider-vertical").slider
      orientation: "vertical"
      range: "min"
      min: 0
      max: 100
      value: 60
      slide: (event, ui) -> 
        $("#amount").val( ui.value )
    
    $("#amount").val $("#slider-vertical").slider("value")






