const token = document.getElementsByName(
    "csrf-token"
)[0].content;

$(document).ready(function(){
    $(".add-to-cart").click(function(event){
        event.preventDefault();
        let amount_field = $(this).closest("tr").find(".amount");
        let amount = amount_field.text();
        amount = parseInt(amount) + 1;
        amount_field.text(amount);
        let url = "cart_item/"+ this.dataset.id;
        $.ajax({
            url: url,
            type: 'POST',
            headers: {
                'X-CSRF-Token': token
            },
            success: function() {
                console.log('success')
            }
        });
        return false
    });

    let cart = $(".cart-modal");
    $("#btn-cart").click(function(event) {
        event.preventDefault();
        if (cart.hasClass("animation") || cart.hasClass("reverse-animation"))
            return;
        if (cart.hasClass("hide")){
            cart.addClass("animation").removeClass("hide");
            setTimeout(function(){
                cart.removeClass("animation")
            }, 1500);
        } else {
            cart.addClass("reverse-animation");
            setTimeout(function () {
                cart.addClass("hide").removeClass("reverse-animation")
            }, 1000);
        }
    });

    $('body').click(function(event){
        if(event.target.class === "cart-modal")
            return;
        if(event.target.id === "btn-cart")
            return;
        if($(event.target).closest('.cart-modal').length)
            return;
        if (cart.hasClass("animation") || cart.hasClass("reverse-animation"))
            return;
        cart.addClass("reverse-animation");
        setTimeout(function () {
            cart.addClass("hide").removeClass("reverse-animation")
        }, 1000);
    });
});
