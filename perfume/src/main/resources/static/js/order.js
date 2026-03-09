/**
 * 画面切り替え中のフラグ（連打防止用）
 */
let isTransitioning = false;

/**
 * 入力画面を隠して、確認画面（プレビュー）を表示する
 */
function showPreview() {
	if (isTransitioning) return;
	console.log("showPreview logic started");

	const inputSec = document.getElementById('inputSection');
	const previewArea = document.getElementById('previewArea');

	// 1. 各入力欄を取得
	const postCodeInput = document.getElementById('postCode');
	const phoneInput = document.getElementById('phoneNumber');
	const addressInput = document.getElementById('address');
	const nameInput = document.getElementById('userName');

	// バリデーション：未入力チェック
	if (!postCodeInput.value || !phoneInput.value || !addressInput.value || !nameInput.value) {
		alert("お届け先の情報をすべて入力してください");
		return;
	}

	// 2. 確認用ラベル（表示先：ddタグなど）を取得
	const displayPC = document.getElementById('displayPostCode');
	const displayPN = document.getElementById('displayPhoneNumber');
	const displayAD = document.getElementById('displayAddress');
	const displayNM = document.getElementById('displayName');

	// 3. ★追加★ サーバー送信用（hidden）を取得
	// Thymeleafの th:field で生成されたID（通常 field名 と同じ）を指定します
	const hiddenPC = document.getElementById('hiddenPostCode');
	const hiddenPN = document.getElementById('hiddenPhoneNumber');
	const hiddenAD = document.getElementById('hiddenAddress');
	const hiddenNM = document.getElementById('hiddenName');

	// 4. 値を反映する（表示用）
	if (displayPC) displayPC.innerText = postCodeInput.value;
	if (displayPN) displayPN.innerText = phoneInput.value;
	if (displayAD) displayAD.innerText = addressInput.value;
	if (displayNM) displayNM.innerText = nameInput.value;

	// 5. ★追加★ 値を反映する（送信用hidden）
	// これをしないと、JavaのControllerで住所が受け取れません
	if (hiddenPC) hiddenPC.value = postCodeInput.value;
	if (hiddenPN) hiddenPN.value = phoneInput.value;
	if (hiddenAD) hiddenAD.value = addressInput.value;
	if (hiddenNM) hiddenNM.value = nameInput.value;

	// 6. 画面切り替え演出
	isTransitioning = true;
	inputSec.classList.add('is-hidden');

	setTimeout(() => {
		inputSec.style.display = "none";
		previewArea.style.display = "block";

		setTimeout(() => {
			previewArea.classList.add('is-active');
			isTransitioning = false;
		}, 50);
	}, 600);
}

/**
 * 確認画面を隠して、入力画面に戻る
 */
function hidePreview() {
	if (isTransitioning) return;
	console.log("hidePreview logic started");

	const inputSec = document.getElementById('inputSection');
	const previewArea = document.getElementById('previewArea');

	isTransitioning = true;
	previewArea.classList.remove('is-active');

	setTimeout(() => {
		previewArea.style.display = "none";
		inputSec.style.display = "block";

		setTimeout(() => {
			inputSec.classList.remove('is-hidden');
			isTransitioning = false;
		}, 50);
	}, 600);
}
/**
 * 入力内容をチェックしてからプレビューを表示する
 */
function validateAndPreview() {
	const postCodeInput = document.getElementById('postCode');
	const phoneInput = document.getElementById('phoneNumber');
	const addressInput = document.getElementById('address');
	const nameInput = document.getElementById('userName');

	// ブラウザ標準のバリデーションチェックを実行
	// pattern属性に合っていない場合や、requiredが空の場合にfalseを返す
	if (!postCodeInput.checkValidity() || !phoneInput.checkValidity() ||
		!addressInput.checkValidity() || !nameInput.checkValidity()) {

		// ブラウザ標準のエラーメッセージを表示させる
		postCodeInput.reportValidity();
		phoneInput.reportValidity();
		addressInput.reportValidity();
		nameInput.reportValidity();
		return;
	}

	// すべてOKなら、既存のshowPreview()を実行
	showPreview();
}
document.addEventListener('DOMContentLoaded', () => {
	const addressForm = document.getElementById('addressForm');

	if (addressForm) {
		addressForm.addEventListener('keydown', (e) => {
			if (e.key === 'Enter') {
				e.preventDefault(); // 勝手な送信をストップ

				const currentId = e.target.id;

				// 入力欄ごとに次に移動する場所を指定
				if (currentId === 'postCode') {
					document.getElementById('address').focus();
				} else if (currentId === 'address') {
					document.getElementById('phoneNumber').focus();
				} else if (currentId === 'phoneNumber') {
					document.getElementById('userName').focus();
				} else if (currentId === 'userName') {
					// 最後の名前欄でEnterを押した時だけプレビューへ
					validateAndPreview();
				}
			}
		});
	}
});