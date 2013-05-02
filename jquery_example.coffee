# http://jqfundamentals.com/chapter/jquery-basics
# AND http://learn.shayhowe.com/advanced-html-css/jquery

# JQuery Topics 
# ----------------------------------------------

# 1. Toggleclass, add, remove
# 2. Chaining methods (closest, children, find)
# 3. Getting and Setting (.attr, .data, .val)
# 4. How to use Events
# 5. AJAX











# -----------------------------------------------------------------------

# AJAX
# ---------
#   - url (only required parameter),
#   - type (default is get),
#   - success (RESPONSE SENT),
#   - dataType (usually json or jsonp),
#   - data (emulating a form submission - can pass it a JS object, THIS IS THE REQUEST)


basic = false

$ ->
  $drinksList = $(".drinks ul")


  # 4. How to use Events
  $drinksList.on "click", "li", ->
    $drinksList.find("li").not(@).removeClass("green")
    $(@).toggleClass "green"


  # 5.1 Basic AJAX
  return unless basic
  $.ajax "http://lcboapi.com/products?q=waupoos",
    type: "POST"
    dataType: "jsonp"
    success: (response) ->
      for item in response.result
        $drinksList.append("<li>#{item.name} - #{item.alcohol_content*1.0/100}%</li>")


# 5.2 Clean AJAX: Best Practices

class DrinksController
  # Synonomous to initialize in ruby
  constructor: ->
    @$el = $(".drinks")
    @$list = @$el.find("ul")
    @$filter = @$el.find(".filter")

    # Binding the list update functionality the filter input
    @$filter.on "keyup", @_onFilterChange

    # Get the intial, unfiltered list of beers
    @get()

  _onFilterChange: (e) =>
    return if @$filter.val() == @previousVal
    @previousVal = @$filter.val()
    @get()

  get: (page=1) ->
    # we only want the latest filtered request to be rendered so kill the previous request
    @_request.abort() if @_request?

    query = @$filter.val()
    url = "http://lcboapi.com/products?q=#{query}&page=#{page}"
    @_request = $.ajax url, dataType: "jsonp", success: @_onAjaxSuccess

  _onAjaxSuccess: (response) =>
    console.log response.result
    html = ""
    html += @_compileHtml(item) for item in response.result
    @$list.html html

  _compileHtml:(item) ->
    "<li>#{item.name} - #{item.alcohol_content*1.0/100}%</li>"

$ -> new DrinksController() unless basic

