document.addEventListener('turbolinks:load', function() {
  var passConfirm = document.querySelector("#user_password_confirmation");

  if(passConfirm) { passConfirm.addEventListener('input', verifyPasswordConfirmation); }
});

function verifyPasswordConfirmation() {
  var pass = document.querySelector("#user_password").value;
  var passConfirm = document.querySelector("#user_password_confirmation").value;
  var alert = document.querySelector('.octicon-alert');

  if (pass === passConfirm) {
    alert.classList.add('hide');
  } else {
    alert.classList.remove('hide');
  }
}
