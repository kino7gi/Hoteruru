// 調合画面用js (mix.js)

function updatePreview() {
	// --- 1. ボトルのプレビュー更新 ---
	// 選択されている「ボトル」のラジオボタンを取得
	const selectedBottle = document.querySelector('input[name="bottleId"]:checked');
	const bottleImgElement = document.getElementById('img-bottle');

	if (selectedBottle && bottleImgElement) {
		// data-bottle属性がある場合のみパスを取得して反映
		const bottlePath = selectedBottle.getAttribute('data-bottle');
		if (bottlePath) {
			bottleImgElement.src = bottlePath;
			console.log("Bottle updated to: " + bottlePath);
		}
	}

	// --- 2. 香りの選択状態（画像変更なし） ---
	// もし将来的に香りの選択によって何か（文字の色など）を変えたい場合はここに書きます。
	const selectedScent = document.querySelector('input[name="scentId"]:checked');
	if (selectedScent) {
		console.log("Selected scent: " + selectedScent.value);
	}
}

/**
 * ページ読み込み時にも一度実行して初期状態を反映
 * ※Thymeleafで最初からcheckedが入っている場合、その画像を表示させるため
 */
document.addEventListener("DOMContentLoaded", () => {
	updatePreview();
});