/**
 * 調合プレビューの更新処理
 */
function updatePreview() {
	// --- 1. ボトルのプレビュー更新 ---
	// Thymeleafの th:field="*{bottleId}" は name="bottleId" としてレンダリングされます
	const selectedBottle = document.querySelector('input[name="bottleId"]:checked');
	const bottleImgElement = document.getElementById('img-bottle');

	if (selectedBottle && bottleImgElement) {
		// th:data-bottle で設定したパスを取得
		const bottlePath = selectedBottle.getAttribute('data-bottle');

		if (bottlePath) {
			// 画像を差し替え
			bottleImgElement.src = bottlePath;

			// フェード演出を入れる（CSSに .fade-in クラスがある場合）
			bottleImgElement.classList.remove('is-visible');
			requestAnimationFrame(() => {
				bottleImgElement.classList.add('is-visible');
			});
		}
	}

	// --- 2. 香りの選択状態のログ（デバッグ用） ---
	const selectedScent = document.querySelector('input[name="scentId"]:checked');
	if (selectedScent) {
		// ラジオボタンの隣にある span テキストを取得して表示
		const scentName = selectedScent.nextElementSibling ? selectedScent.nextElementSibling.innerText : selectedScent.value;
		console.log("Selected Scent ID:", selectedScent.value, "Name:", scentName);
	}
}

/**
 * ページ読み込み時の初期化
 */
document.addEventListener("DOMContentLoaded", () => {
	// 初期状態で選択されているものがあれば反映
	updatePreview();

	// 全てのラジオボタンにイベントリスナーを一括設定（HTML側のonchange漏れ対策）
	const allRadios = document.querySelectorAll('input[type="radio"]');
	allRadios.forEach(radio => {
		radio.addEventListener('change', updatePreview);
	});
});