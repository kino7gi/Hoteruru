/**
 * 画面切り替え中のフラグ（連打防止用）
 */
let isTransitioning = false;

/**
 * 入力画面を隠して、確認画面（プレビュー）を表示する
 */
function showPreview() {
	if (isTransitioning) return; // アニメーション中は処理しない
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

	// 2. 確認用ラベル（表示先）を取得
	const displayPC = document.getElementById('displayPostCode');
	const displayPN = document.getElementById('displayPhoneNumber');
	const displayAD = document.getElementById('displayAddress');
	const displayNM = document.getElementById('displayName');

	// 3. 値を反映する
	if (displayPC) displayPC.innerText = postCodeInput.value;
	if (displayPN) displayPN.innerText = phoneInput.value;
	if (displayAD) displayAD.innerText = addressInput.value;
	if (displayNM) displayNM.innerText = nameInput.value;

	// 4. 画面切り替え演出
	isTransitioning = true;

	// 入力画面をフェードアウト
	inputSec.classList.add('is-hidden');

	// 入力画面が消えきってから（600ms後）、確認画面を出す
	setTimeout(() => {
		inputSec.style.display = "none";
		previewArea.style.display = "block";

		// 少し待ってからアクティブ化（フェードイン開始）
		setTimeout(() => {
			previewArea.classList.add('is-active');
			isTransitioning = false; // アニメーション終了
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

	// 1. 確認画面をフェードアウト
	previewArea.classList.remove('is-active');

	setTimeout(() => {
		previewArea.style.display = "none";
		inputSec.style.display = "block";

		// 2. 入力画面をフェードイン
		setTimeout(() => {
			inputSec.classList.remove('is-hidden');
			isTransitioning = false;
		}, 50);
	}, 600);
}