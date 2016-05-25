$(document).ready(function() {
  $('.all').on("click", '#copy_btn', function() {
    var buttonClass  = $(this).attr("class");
    $('#' + buttonClass).select();
    document.execCommand('copy');
    $('.' + buttonClass).css('background-color', 'blue');
    $('.' + buttonClass).css('color', 'white');
  });
});
