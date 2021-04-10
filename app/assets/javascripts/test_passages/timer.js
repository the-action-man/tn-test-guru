document.addEventListener('turbolinks:load', function() {
  if(window.countdown && window.passage_finish) {
    timerHandler(window.countdown, window.passage_finish);
  }
});

function timerHandler(countdown, passage_finish) {
  const countDownDate = Date.parse(passage_finish.innerText);

  // Update the count down every 1 second
  const interval = setInterval(function() {
    // Get today's date and time
    let now = new Date().getTime();
    // Find the distance between now and the count down date
    let distance = countDownDate - now;

    // Time calculations for days, hours, minutes and seconds
    let days = Math.floor(distance / (1000 * 60 * 60 * 24));
    let hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    let seconds = Math.floor((distance % (1000 * 60)) / 1000);

    // Output the result in an element with id="demo"
    countdown.innerHTML = days + "d " + hours + "h "
      + minutes + "m " + seconds + "s ";

    // If the count down is over, write some text
    if (distance < 0) {
      clearInterval(interval);
      countdown.innerHTML = "EXPIRED !!!";
      redirectionHandler();
    }
  }, 1000);
}

function redirectionHandler() {
  current_test_passage_id = window.location.href.split("/").pop();
  window.location.replace("/test_passages/" + current_test_passage_id + "/result");
}
