const stripe = Stripe("<%=ENV['STRIPE_PUBLIC_KEY']%>");
const checkoutButton = document.getElementById('checkout-button');

checkoutButton.addEventListener('click', function() {
    fetch('/payment/<%=@order.id%>', {
        method: 'POST',
    })
        .then(function(response) {
            return response.json();
        })
        .then(function(session) {
            return stripe.redirectToCheckout({ sessionId: session.id });
        })
        .then(function(result) {
            if (result.error) {
                alert(result.error.message);
            }
        })
        .catch(function(error) {
            console.error('Error:', error);
        });
});
