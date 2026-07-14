# Question 1: Responsive Register Form

## What I built

I created a responsive registration form with HTML, CSS, and JavaScript.

Files:

- `index.html` creates the form structure.
- `styles.css` controls the layout, colors, spacing, desktop view, and mobile view.
- `script.js` validates user input before accepting the form.

## HTML explanation

The form has five input fields:

- First Name
- Last Name
- Email
- Password
- Confirm Password

The form uses `novalidate` because I want to handle validation with my own JavaScript logic. I also added hidden label text with the `sr-only` class so screen readers still understand each field.

## CSS explanation

The page is centered with CSS Grid using `.page-shell`.

The form card has a fixed maximum width, background color, padding, and shadow so it matches the sample register form style.

The first name and last name fields use a two-column grid on desktop:

```css
.name-row {
  grid-template-columns: 1fr 1fr;
}
```

On small screens, the media query changes them to one column:

```css
@media (max-width: 560px) {
  .name-row {
    grid-template-columns: 1fr;
  }
}
```

This is the main responsive behavior.

## JavaScript explanation

The script gets all input fields from the page and stores them in the `fields` object.

When the user submits the form:

1. `event.preventDefault()` stops the browser from refreshing.
2. `resetValidationState()` clears old error styles and messages.
3. `getFormValues()` reads the current input values.
4. `validateForm()` checks the business rules.
5. If there is an error, the form shows the message and marks that field invalid.
6. If everything is correct, the form resets and shows a success message.

Validation rules:

- First name is required.
- Last name is required.
- Email must match a simple email format.
- Password must be at least 8 characters.
- Confirm password must match password.

## Interview explanation

I separated the work into structure, style, and behavior.

HTML is responsible for the form content. CSS is responsible for the responsive layout and visual design. JavaScript is responsible for validation before submit.

For responsiveness, I used CSS Grid. On desktop, first name and last name are side by side. On mobile, the media query changes the grid to one column so the form is easier to read.

For validation, I check the simplest required rules first, then email format, password length, and password confirmation. When a field is invalid, I set `aria-invalid="true"` so the UI can show the red border and the form is clearer for accessibility.
