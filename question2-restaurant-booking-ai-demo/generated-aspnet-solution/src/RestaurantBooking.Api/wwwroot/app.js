const form = document.querySelector("#reservation-form");
const submitButton = document.querySelector("#submit-button");
const resultState = document.querySelector("#result-state");
const resultMessage = document.querySelector("#result-message");
const resultHttp = document.querySelector("#result-http");
const resultCode = document.querySelector("#result-code");

form.addEventListener("submit", async (event) => {
    event.preventDefault();

    const formData = new FormData(form);
    const payload = {
        reservationDate: formData.get("reservationDate"),
        tableType: formData.get("tableType"),
        deposit: Number(formData.get("deposit"))
    };

    setResult("loading", "กำลังตรวจสอบการจอง", "-", "-");
    submitButton.disabled = true;

    try {
        const response = await fetch("/reservations", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(payload)
        });

        const result = await response.json();
        const state = result.success ? "success" : "error";
        setResult(state, result.message, response.status, result.code);
    } catch {
        setResult("error", "ไม่สามารถเรียก API ได้", "-", "REQUEST_FAILED");
    } finally {
        submitButton.disabled = false;
    }
});

function setResult(state, message, httpStatus, code) {
    resultState.className = `result-state ${state}`;
    resultMessage.textContent = message;
    resultHttp.textContent = httpStatus;
    resultCode.textContent = code;
}
