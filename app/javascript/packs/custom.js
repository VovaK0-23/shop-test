const token = document.getElementsByName(
    "csrf-token"
)[0].content;

$(document).ready(() => {
  $(".add-to-cart").click(function(event) {
    event.preventDefault();
    let amount_field = $(this).closest("tr").find(".amount");
    let amount = amount_field.text();
    amount = parseInt(amount) + 1;
    amount_field.text(amount);
    let url = "cart_item/" + this.dataset.id;
    $.ajax({
      url: url,
      type: 'POST',
      headers: {
        'X-CSRF-Token': token
      },
      success: () => console.log('success')
    });
    return false
  });

  let cart = $(".cart-modal");
  $("#btn-cart").click(event => {
    event.preventDefault();
    if (cart.hasClass("animation") || cart.hasClass("reverse-animation"))
      return;
    if (cart.hasClass("hide")) {
      cart.addClass("animation").removeClass("hide");
      setTimeout(() => cart.removeClass("animation"), 1500);
    } else {
      cart.addClass("reverse-animation");
      setTimeout(() => cart.addClass("hide").removeClass("reverse-animation"), 1000);
    }
  });

  $('body').click(event => {
    if (event.target.class === "cart-modal" ||
        event.target.id === "btn-cart" ||
        $(event.target).closest('.cart-modal').length ||
        cart.hasClass("animation") ||
        cart.hasClass("reverse-animation") ||
        cart.hasClass("hide")) {
      return;
    }
    cart.addClass("reverse-animation");
    setTimeout(() => cart.addClass("hide").removeClass("reverse-animation"), 1000);
  });
});
