// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
addEventListener("direct-upload:error", event => {
  event.preventDefault()
  const { id, error } = event.detail
  console.log(error);
  // const element = document.getElementById(`direct-upload-${id}`)
  // element.classList.add("direct-upload--error")
  // element.setAttribute("title", error)
});