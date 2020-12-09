document.addEventListener('turbolinks:load', function() {
  if(user_password_confirmation) enablePasswordHandler(user_password_confirmation);
});

function enablePasswordHandler(field) {
    field.addEventListener('input', verifyPasswordConfirmation);
}

function verifyPasswordConfirmation() {
    user_password.value === user_password_confirmation.value ? hideAlertIcon() : showAlertIcon();
}

function showAlertIcon() {
    password_confirmation_alert_icon.classList.remove('hide');
}

function hideAlertIcon() {
    password_confirmation_alert_icon.classList.add('hide');
}
