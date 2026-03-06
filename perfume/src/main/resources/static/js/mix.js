//調合画面用js

function updatePreview() {
	// 選択されている「香り（液体）」を取得
	const selectedScent = document.querySelector('input[name="scentId"]:checked');
	if (selectedScent) {
		const liquidPath = selectedScent.getAttribute('data-liquid');
		document.getElementById('img-liquid').src = liquidPath;
	}

	// 選択されている「ボトル」を取得
	const selectedBottle = document.querySelector('input[name="bottleId"]:checked');
	if (selectedBottle) {
		const bottlePath = selectedBottle.getAttribute('data-bottle');
		document.getElementById('img-bottle').src = bottlePath;
	}
}

// ページ読み込み時にも一度実行して初期状態を反映
document.addEventListener("DOMContentLoaded", updatePreview);