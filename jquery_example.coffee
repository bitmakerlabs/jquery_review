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
# 4. How to use Events
# 5. AJAX
#   - url (only required parameter),
#   - type (default is get),
#   - success (RESPONSE SENT),
#   - dataType (usually json or jsonp),
#   - data (emulating a form submission - can pass it a JS object, THIS IS THE REQUEST)
# http://lcboapi.com/products?q=waupoos&callback=wordd

$ ->
  $drinksList = $(".drinks ul")


  # 4. How to use Events
  $drinksList.on "click", "li", ->
    $drinksList.find("li").not(@).removeClass("green")
    $(@).toggleClass "green"


  # 5.1 Basic AJAX
  # $.ajax "http://lcboapi.com/products?q=waupoos",
  #   type: "POST"
  #   dataType: "jsonp"
  #   success: (response) ->
  #     for item in response.result
  #       $drinksList.append("<li>#{item.name} - #{item.alcohol_content*1.0/100}%</li>")


# 5.2 Clean AJAX: Best Practices

class DrinksController
  constructor: ->
    @$el = $(".drinks")
    @$list = @$el.find("ul")
    @$filter = @$el.find(".filter").on "keyup", @_onFilterChange
    @get()

  _onFilterChange: (e) =>
    return if @$filter.val() == @previousVal
    @previousVal = @$filter.val()
    @get @$filter.val()

  get: (query="", page=1) ->
    @_request.abort() if @_request?
    url = "http://lcboapi.com/products?q=#{query}&page=#{page}"
    @_request = $.ajax url, dataType: "jsonp", success: @_onAjaxSuccess

  _onAjaxSuccess: (response) =>
    console.log response.result
    html = ""
    html += @_compileHtml(item) for item in response.result
    @$list.html html

  _compileHtml:(item) ->
    "<li>#{item.name} - #{item.alcohol_content*1.0/100}%</li>"

$ -> new DrinksController()

