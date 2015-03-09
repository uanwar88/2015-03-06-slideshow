window.onload = function() {
  var projector = document.getElementById("projector");
  var currentSlide = document.getElementById("current_slide");
  var slide_title = document.getElementById("title");
  var slide_body = document.getElementById("body_text");
  var all_slides;

  var js_req = new XMLHttpRequest;
  js_req.addEventListener("load", function() {
    all_slides = JSON.parse(js_req.response);
    slide_title.innerHTML = all_slides[0].title;
    slide_body.innerHTML = all_slides[0].body;
  });
  js_req.open("get", "http://localhost:4567/all_slides");
  js_req.send();

  var i = 0;

  document.getElementById("forward_slide").onclick = function() {
    if (i < all_slides.length - 1) {
      i++;
      slide_title.innerHTML = all_slides[i].title;
      slide_body.innerHTML = all_slides[i].body;
    }
  }

  document.getElementById("back_slide").onclick = function() {
    if (i > 0) {
      i--;
      slide_title.innerHTML = all_slides[i].title;
      slide_body.innerHTML = all_slides[i].body;
    }
  }
}
