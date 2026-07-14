const form = document.querySelector("#pattern-form");
const output = document.querySelector("#pattern-output");
const message = document.querySelector("#message");

function renderPattern() {
  const data = new FormData(form);
  const character = String(data.get("character") || "1");
  const maxCount = parsePositiveInteger(data.get("maxCount"), 4, "Maximum count");
  const rounds = parsePositiveInteger(data.get("rounds"), 3, "Rounds");

  output.textContent = buildPattern(character, maxCount, rounds).join("\n");
  message.textContent = `Generated ${rounds} round(s), maximum ${maxCount} character(s).`;
}

form.addEventListener("submit", (event) => {
  event.preventDefault();

  try {
    renderPattern();
  } catch (error) {
    output.textContent = "";
    message.textContent = error.message;
  }
});

renderPattern();
