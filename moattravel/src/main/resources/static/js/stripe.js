const stripe = Stripe('pk_test_51SyiNdAKF64NSnzIEQp8H6Q4R68aeB4F13wA5UqkBHNEjXKvv4q9tRGCoKRShgHdZup577YU2dXYqfSrrdxFHMhn00xe7WdyWj');
const paymentButton = document.querySelector('#paymentButton');

paymentButton.addEventListener('click', () => {
	stripe.redirectToCheckout({
		sessionId: sessionId
	});
});
