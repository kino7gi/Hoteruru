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

	// 入力要素
	const addressInput = document.getElementById('address');
	const userNameInput = document.getElementById('userName');

	// 表示用要素
	const displayAddress = document.getElementById('displayAddress');
	const displayUserName = document.getElementById('displayUserName'); // 名前用を追加

	// 1. 入力チェック（空白文字のみの場合も考慮）
	if (!addressInput.value.trim() || !userNameInput.value.trim()) {
		alert("すべての項目を正しく入力してください");
		return;
	}

	isTransitioning = true;

	// 2. 値をプレビューに反映
	if (displayAddress) {
		displayAddress.innerText = addressInput.value;
	}
	if (displayUserName) {
		displayUserName.innerText = userNameInput.value;
	}

	// 3. 入力画面をフェードアウト
	inputSec.classList.add('is-hidden');

	// 4. 入力画面が消えきってから、確認画面を出す
	setTimeout(() => {
		inputSec.style.display = "none";
		previewArea.style.display = "block";

		// ブラウザの描画タイミングを待ってからアクティブ化
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