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
			// 背景（modal自体）をクリックした時だけ閉じる
			if (e.target === modal) {
				closeModal();
			}
		});
	}
});

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