document.addEventListener("turbo:load", function () {
  let account = document.querySelector(".dropdown-toggle");
  account?.addEventListener("click", function (event) {
    event.preventDefault();
    let menu = document.querySelector(".dropdown-menu-user");
    menu.classList.toggle("active");
  });
});

document.addEventListener("turbo:load", function () {
  let admin = document.querySelector(".admin-dropdown-toggle");
  admin?.addEventListener("click", function (event) {
    event.preventDefault();
    let menu = document.querySelector(".dropdown-menu-admin");
    menu.classList.toggle("active");
  });
});
