const orderStatusSelect = document.getElementById("order-status");
orderStatusSelect.addEventListener("click", function() {
  const statusSelect = document.getElementById("order-status");
  const cancelReasonForm = document.getElementById("cancel-reason-form");
  function toggleCancelReasonForm() {
    if (statusSelect.value === "cancelled") {
      cancelReasonForm.classList.remove("hidden");
    } else {
      cancelReasonForm.classList.add("hidden");
    }
  }
  toggleCancelReasonForm();
  statusSelect.addEventListener("change", toggleCancelReasonForm);
});
