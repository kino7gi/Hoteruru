const stripe = Stripe('mk_1SyiNeAKF64NSnzINTxL5DQf');
const paymentButton = document.querySelector('#paymentButton');

paymentButton.addEventListener('click', () => {
	stripe.redirectToCheckout({
		sessionId: sessionId
	});
});
