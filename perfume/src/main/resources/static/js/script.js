// src/main/resources/static/js/script.js

document.addEventListener('DOMContentLoaded', function() {

	// --- 各種要素の取得 ---
	const welcomeScreen = document.getElementById('welcome-screen');
	const mainContent = document.getElementById('main-content');
	const perfumeForm = document.getElementById('perfumeForm');
	const bottleImage = document.getElementById('bottle-image');

	// モーダル関連
	const modal = document.getElementById('preview-modal');
	const confirmBtn = document.getElementById('confirm-order');
	const backBtn = document.getElementById('back-to-edit');

	// --- 1. Welcome画面の切り替え処理 ---
	if (welcomeScreen && mainContent) {
		welcomeScreen.addEventListener('click', function() {
			welcomeScreen.style.opacity = '0';
			welcomeScreen.style.visibility = 'hidden';
			mainContent.classList.remove('hidden');

			setTimeout(() => {
				welcomeScreen.style.display = 'none';
			}, 1000);
		});
	}

	// --- 2. 香りの選択制限（最大2つ） ---
	const checkboxes = document.querySelectorAll('.scent-check');
	const maxSelection = 2;

	checkboxes.forEach(checkbox => {
		checkbox.addEventListener('change', function() {
			const checkedCount = document.querySelectorAll('.scent-check:checked').length;
			if (checkedCount > maxSelection) {
				this.checked = false;
				alert("香料は最大2つまでしか選べません。");
			}
		});
	});

	// --- 3. 瓶の画像切り替えロジック ---
	const bottleRadios = document.querySelectorAll('input[name="bottleType"]');

	bottleRadios.forEach(radio => {
		radio.addEventListener('change', function() {
			if (!bottleImage) return;

			// 一瞬薄くして切り替え演出
			bottleImage.style.opacity = '0.3';

			setTimeout(() => {
				// valueに基づいて画像を切り替え
				if (this.value === 'Clear') {
					bottleImage.src = '/images/IMG_0289.JPG';
				} else if (this.value === 'Amber') {
					bottleImage.src = '/images/IMG_0290.JPG';
				}
				bottleImage.style.opacity = '1';
			}, 200);
		});
	});

	// --- 4. 確認モーダル表示ロジック ---
	if (perfumeForm && modal) {
		// 「BLEND MY PERFUME」ボタン（submit）が押されたとき
		perfumeForm.addEventListener('submit', function(e) {
			e.preventDefault(); // サーバー送信を一時停止

			// 選択された要素を取得
			const checkedScentElements = document.querySelectorAll('.scent-check:checked');

			// --- [新設] 金額計算ロジック ---
			const scentCount = checkedScentElements.length;
			let totalPrice = 0;
			if (scentCount === 1) {
				totalPrice = 8000;
			} else if (scentCount === 2) {
				totalPrice = 12000;
			}

			// 選択された香りを取得
			const selectedScents = Array.from(checkedScentElements)
				.map(el => el.value)
				.join(' & ');

			// 選択されたボトルを取得
			const checkedBottle = document.querySelector('input[name="bottleType"]:checked');
			const selectedBottleValue = checkedBottle ? checkedBottle.value : "未選択";

			// モーダル内のテキストを更新
			const previewScents = document.getElementById('preview-scents');
			const previewBottle = document.getElementById('preview-bottle');
			const previewPrice = document.getElementById('preview-price'); // HTML側に id="preview-price" が必要

			if (previewScents) previewScents.innerText = selectedScents || "未選択";
			if (previewBottle) previewBottle.innerText = selectedBottleValue;

			// 金額を表示（カンマ区切り形式）
			if (previewPrice) {
				previewPrice.innerText = "¥" + totalPrice.toLocaleString();
			}

			// モーダルを表示
			modal.classList.remove('modal-hidden');
		});

		// 「修正する」ボタン（以下、既存と同じ）
		if (backBtn) {
			backBtn.addEventListener('click', () => {
				modal.classList.add('modal-hidden');
			});
		}

		// 「YES, BLEND IT!」ボタン（以下、既存と同じ）
		if (confirmBtn) {
			confirmBtn.addEventListener('click', () => {
				perfumeForm.submit();
			});
		}
	}
});