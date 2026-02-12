document.addEventListener("DOMContentLoaded", function () {
  if (typeof window.ggsegRoot === "undefined") return;
  var logo = document.getElementById("ggsegverse-logo");
  if (logo) logo.src = window.ggsegRoot + "ggsegverse-logo.png";
});
