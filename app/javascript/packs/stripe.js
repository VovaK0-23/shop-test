const publicKey = $('meta[name="stripe-key"]').attr('content');
const orderId = $('meta[name="order-id"]').attr('content');
const stripe = Stripe(publicKey);
const checkoutButton = document.getElementById('checkout-button');
const token = document.getElementsByName(
  "csrf-token"
)[0].content;

checkoutButton.addEventListener('click', function() {
  fetch('/payment/' + orderId, {
      method: 'POST',
      headers: {
        'X-CSRF-Token': token
      }
    })
    .then(function(response) {
      return response.json();
    })
    .then(function(session) {
      return stripe.redirectToCheckout({
        sessionId: session.id
      });
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
