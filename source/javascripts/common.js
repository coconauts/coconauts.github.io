$(document).ready(function(){
   zoomImage();
});

function zoomImage(){
    
    $('.screenshot').click(function() {

      var $img = $(this).clone().removeClass("screenshot")
                                .click(function(){ closeImage(); });
      
      $('#image-container').html($img).fadeIn();
      $(".modal").fadeIn().click(function(){closeImage(); });
      
      var origWidth = $img.width(),
          origHeight = $img.height(),
          center = $(window).width()/2 - origWidth*2/3,
          imageHeight =  Math.min($(window).height(),origHeight)-50;
      
      //TODO center if image width is small
      //$('#image-container').css("margin-left",center+"px");
      //TODO adjust image width too
      $img.css("height",imageHeight+"px");

    });
    //TODO add title /over message "click to enlarge"
}

function closeImage(){
  $('#image-container').fadeOut();
  $(".modal").fadeOut();
}

