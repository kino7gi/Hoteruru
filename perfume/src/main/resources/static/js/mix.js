/**
 * 調合プレビューの更新処理
 */
function updatePreview() {
	// --- 1. ボトルのプレビュー更新 ---
	const selectedBottle = document.querySelector('input[name="bottleId"]:checked');
	const bottleImgElement = document.getElementById('img-bottle');

	if (selectedBottle && bottleImgElement) {
		const bottlePath = selectedBottle.getAttribute('data-bottle');
		if (bottlePath) {
			bottleImgElement.src = bottlePath;
			bottleImgElement.classList.remove('is-visible');
			requestAnimationFrame(() => {
				bottleImgElement.classList.add('is-visible');
			});
		}
	}

	// --- 2. 香りの選択状態の取得（複数対応） ---
	// name="scentIds" のチェックボックスのうち、チェックがついているものをすべて取得
	const selectedScents = document.querySelectorAll('input[name="scentIds"]:checked');

	if (selectedScents.length > 0) {
		const selectedData = Array.from(selectedScents).map(scent => {
			return {
				id: scent.value,
				name: scent.nextElementSibling ? scent.nextElementSibling.innerText : scent.value
			};
		});

		// デバッグ用にコンソール表示
		console.log("Selected Scents:", selectedData);

		// 必要であれば、ここで「2つ選ばれたら特別なエフェクトを出す」などの処理を追加できます
	}
}

/**
 * 香りの選択制限（2つまで）
 */
function handleScentSelection(checkbox) {
	const selectedScents = document.querySelectorAll('input[name="scentIds"]:checked');

	if (selectedScents.length > 2) {
		checkbox.checked = false;
		alert("香りは2種類までしか選べません。");
		return;
	}

	// プレビュー更新を呼ぶ
	updatePreview();
}

/**
 * ページ読み込み時の初期化
 */
document.addEventListener("DOMContentLoaded", () => {
	// 初期状態で選択されているものがあれば反映
	updatePreview();

	// ボトルのラジオボタンにイベントリスナーを設定
	const bottleRadios = document.querySelectorAll('input[name="bottleId"]');
	bottleRadios.forEach(radio => {
		radio.addEventListener('change', updatePreview);
	});

	// 香りのチェックボックスにイベントリスナーを設定
	const scentCheckboxes = document.querySelectorAll('input[name="scentIds"]');
	scentCheckboxes.forEach(checkbox => {
		checkbox.addEventListener('change', function() {
			handleScentSelection(this);
		});
	});
});