$(function() {

  var onBotClick = function(e) {
    $(this).addClass("orange");
    $(this).on("click", onOrangeBotClick);
    e.stopPropagation();
    $(this).off("click", onBotClick)
  }

  var onOrangeBotClick = function (e) {
    $(this)
      .removeClass("orange")
      .addClass("green")
      .off("click", onOrangeBotClick)
      .on("click", onGreenBotClick);
    e.stopPropagation();
  }

  var onGreenBotClick = function () {
    alert("green was clicked.");
  }

  $(".change-color-bot").on("click", onBotClick);


  
});