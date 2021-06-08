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
            type: "get",
            success: function() {
                console.log('success')
            }
        });
        return false
    });
});
