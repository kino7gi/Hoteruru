// script.js
// script.js
document.addEventListener("DOMContentLoaded", () => {
	// --- 1. スクロール監視 (Fade-in) ---
	const observer = new IntersectionObserver((entries) => {
		entries.forEach(entry => {
			if (entry.isIntersecting) {
				entry.target.classList.add('is-visible');
			}
		});
	}, { threshold: 0.2 });

	document.querySelectorAll('.fade-in').forEach(el => observer.observe(el));

	// --- 2. モーダル背景クリックで閉じる設定 ---
	const modal = document.getElementById('descriptionModal');
	if (modal) {
		modal.addEventListener('click', (e) => {
			if (e.target === modal) {
				closeModal();
			}
		});
	}

	// --- 3. 【追加】動的なモーダル起動処理 (Thymeleafセキュリティ対策) ---
	// img-wrapper（modal-trigger）をクリックした時の処理
	const modalTriggers = document.querySelectorAll('.modal-trigger');
	modalTriggers.forEach(trigger => {
		trigger.addEventListener('click', function() {
			// HTMLの data-name と data-description から値を取得
			const name = this.getAttribute('data-name');
			const description = this.getAttribute('data-description');

			// 既存の showModal 関数を呼び出す
			showModal(name, description);
		});
	});
});

/**
 * 写真をタップした時に説明を表示する
 */
function showModal(title, description) {
	const modal = document.getElementById('descriptionModal');
	const modalTitle = document.getElementById('modalTitle');
	const modalDesc = document.getElementById('modalDescription');

	if (!modal || !modalTitle || !modalDesc) return;

	// 内容をセット (nullやundefinedの場合は空文字にする)
	modalTitle.innerText = title || "";
	modalDesc.innerText = description || "説明はありません。";

	// 表示処理
	modal.style.display = 'flex';

	// ブラウザの描画タイミングを確保してからクラス付与
	requestAnimationFrame(() => {
		modal.classList.add('is-active');
	});
}

/**
 * モーダルを閉じる
 */
function closeModal() {
	const modal = document.getElementById('descriptionModal');
	if (!modal) return;

	modal.classList.remove('is-active');

	// CSSのtransition時間（0.5s）に合わせて非表示にする
	setTimeout(() => {
		if (!modal.classList.contains('is-active')) {
			modal.style.display = 'none';
		}
	}, 500);
}

/**
 * 写真をタップした時に説明を表示する
 */
function showModal(title, description) {
	const modal = document.getElementById('descriptionModal');
	const modalTitle = document.getElementById('modalTitle');
	const modalDesc = document.getElementById('modalDescription');

	if (!modal || !modalTitle || !modalDesc) return;

	// 内容をセット
	modalTitle.innerText = title;
	modalDesc.innerText = description;

	// 表示処理
	modal.style.display = 'flex';

	// ブラウザの描画タイミングを確保してからクラス付与（ふわっと出すため）
	requestAnimationFrame(() => {
		modal.classList.add('is-active');
	});
}

/**
 * モーダルを閉じる
 */
function closeModal() {
	const modal = document.getElementById('descriptionModal');
	if (!modal) return;

	modal.classList.remove('is-active');

	// CSSのtransition時間（0.5s）に合わせて非表示にする
	setTimeout(() => {
		if (!modal.classList.contains('is-active')) {
			modal.style.display = 'none';
		}
	}, 500);
}