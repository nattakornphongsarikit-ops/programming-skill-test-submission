const form = document.querySelector("#register-form");
const statusText = document.querySelector("#form-status");

const fields = {
  firstName: document.querySelector("#Input_FirstName"),
  lastName: document.querySelector("#Input_LastName"),
  email: document.querySelector("#Input_Email"),
  password: document.querySelector("#Input_Password"),
  confirmPassword: document.querySelector("#Input_ConfirmPassword"),
};

const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

function setInvalid(fieldName, invalid) {
  fields[fieldName].setAttribute("aria-invalid", invalid ? "true" : "false");
}

function validateForm() {
  const values = Object.fromEntries(
    Object.entries(fields).map(([key, field]) => [key, field.value.trim()])
  );

  Object.keys(fields).forEach((key) => setInvalid(key, false));

  if (!values.firstName) {
    setInvalid("firstName", true);
    return "Please enter your first name.";
  }

  if (!values.lastName) {
    setInvalid("lastName", true);
    return "Please enter your last name.";
  }

  if (!emailPattern.test(values.email)) {
    setInvalid("email", true);
    return "Please enter a valid email address.";
  }

  if (values.password.length < 8) {
    setInvalid("password", true);
    return "Password must contain at least 8 characters.";
  }

  if (values.confirmPassword !== values.password) {
    setInvalid("confirmPassword", true);
    return "Password and confirm password do not match.";
  }

  return "";
}

form.addEventListener("submit", (event) => {
  statusText.classList.remove("success");
  statusText.textContent = "";

  const errorMessage = validateForm();
  if (errorMessage) {
    event.preventDefault();
    statusText.textContent = errorMessage;
  }
});
