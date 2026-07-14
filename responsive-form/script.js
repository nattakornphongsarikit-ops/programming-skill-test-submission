const form = document.querySelector("#registerForm");
const message = document.querySelector("#formMessage");

const fields = {
  firstName: document.querySelector("#firstName"),
  lastName: document.querySelector("#lastName"),
  email: document.querySelector("#email"),
  password: document.querySelector("#password"),
  confirmPassword: document.querySelector("#confirmPassword"),
};

const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

function getFormValues() {
  return Object.fromEntries(
    Object.entries(fields).map(([name, field]) => [name, field.value.trim()])
  );
}

function setFieldInvalid(fieldName, isInvalid) {
  fields[fieldName].setAttribute("aria-invalid", isInvalid ? "true" : "false");
}

function resetValidationState() {
  Object.keys(fields).forEach((fieldName) => setFieldInvalid(fieldName, false));
  message.textContent = "";
  message.classList.remove("success");
}

function validateForm(values) {
  if (!values.firstName) {
    setFieldInvalid("firstName", true);
    return "Please enter your first name.";
  }

  if (!values.lastName) {
    setFieldInvalid("lastName", true);
    return "Please enter your last name.";
  }

  if (!emailPattern.test(values.email)) {
    setFieldInvalid("email", true);
    return "Please enter a valid email address.";
  }

  if (values.password.length < 8) {
    setFieldInvalid("password", true);
    return "Password must contain at least 8 characters.";
  }

  if (values.confirmPassword !== values.password) {
    setFieldInvalid("confirmPassword", true);
    return "Password and confirm password do not match.";
  }

  return "";
}

form.addEventListener("submit", (event) => {
  event.preventDefault();
  resetValidationState();

  const errorMessage = validateForm(getFormValues());
  if (errorMessage) {
    message.textContent = errorMessage;
    return;
  }

  form.reset();
  message.textContent = "Registration data is valid.";
  message.classList.add("success");
});
