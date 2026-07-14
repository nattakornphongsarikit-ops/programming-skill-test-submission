const form = document.querySelector("#register-form");
const statusText = document.querySelector("#form-status");

const fields = {
  firstName: document.querySelector("#firstName"),
  lastName: document.querySelector("#lastName"),
  email: document.querySelector("#email"),
  password: document.querySelector("#password"),
  confirmPassword: document.querySelector("#confirmPassword"),
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
  event.preventDefault();
  statusText.classList.remove("success");

  const errorMessage = validateForm();
  if (errorMessage) {
    statusText.textContent = errorMessage;
    return;
  }

  form.reset();
  Object.keys(fields).forEach((key) => setInvalid(key, false));
  statusText.textContent = "Registration data is valid.";
  statusText.classList.add("success");
});
