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

document.addEventListener('turbo:load', function(event) {
  if ($(event.target).find('#cart').length) {
    $('.cart-dropdown-toggle').off('click').on('click', function(event) {
      event.preventDefault();
      $('.dropdown-menu-cart').toggleClass('active');
    });
  }
});
