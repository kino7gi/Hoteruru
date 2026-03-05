document.addEventListener('DOMContentLoaded', function() {

	// --- 1. 要素の取得 ---
	const welcomeScreen = document.getElementById('welcome-screen');
	const mainContent = document.getElementById('main-content');
	const perfumeForm = document.getElementById('perfumeForm');
	const bottleImage = document.getElementById('bottle-image');
	const addressSection = document.getElementById('address-section');
	const selectionArea = document.getElementById('selection-area');

	const modal = document.getElementById('preview-modal');
	const confirmBtn = document.getElementById('confirm-order');
	const backBtn = document.getElementById('back-to-edit');

	// 初期化
	if (modal) modal.classList.add('modal-hidden');
	if (addressSection) addressSection.classList.add('hidden');

	// --- 2. Welcome -> Introduction ---
	if (welcomeScreen && mainContent) {
		welcomeScreen.addEventListener('click', () => {
			welcomeScreen.style.opacity = '0';
			mainContent.classList.remove('hidden');
			mainContent.style.opacity = '0';
			setTimeout(() => {
				welcomeScreen.style.display = 'none';
				mainContent.style.transition = 'opacity 1s ease';
				mainContent.style.opacity = '1';
				revealOnScroll();
			}, 800);
		});
	}

	// --- 3. スクロール演出 ---
	const revealOnScroll = () => {
		document.querySelectorAll('.reveal').forEach(el => {
			const windowHeight = window.innerHeight;
			const elementTop = el.getBoundingClientRect().top;
			if (elementTop < windowHeight - 100) el.classList.add('active');
		});
	};
	window.addEventListener('scroll', revealOnScroll);

	// --- 4. Introduction -> Selection Area ---
	document.addEventListener('click', (e) => {
		const link = e.target.closest('.scroll-link');
		if (link) {
			e.preventDefault();
			const introSection = document.getElementById('intro-section');
			if (introSection && selectionArea) {
				introSection.style.transition = 'opacity 0.5s ease';
				introSection.style.opacity = '0';
				setTimeout(() => {
					introSection.style.display = 'none';
					selectionArea.classList.remove('hidden');
					selectionArea.style.display = 'block';
					selectionArea.style.opacity = '0';
					setTimeout(() => {
						selectionArea.style.transition = 'opacity 0.8s ease';
						selectionArea.style.opacity = '1';
						window.scrollTo({ top: 0, behavior: 'smooth' });
					}, 50);
				}, 500);
			}
		}
	});

	// --- 5. 香りの選択制限 ---
	const MAX_SELECTION = 2;
	document.querySelectorAll('.scent-check').forEach(checkbox => {
		checkbox.addEventListener('change', function() {
			const checkedCount = document.querySelectorAll('.scent-check:checked').length;
			if (checkedCount > MAX_SELECTION) {
				this.checked = false;
				alert(`香料は最大${MAX_SELECTION}つまで選択可能です。`);
			}
		});
	});

	// --- 6. 瓶の画像切り替え ---
	document.querySelectorAll('input[name="bottleType"]').forEach(radio => {
		radio.addEventListener('change', function() {
			if (!bottleImage) return;
			bottleImage.style.opacity = '0';
			setTimeout(() => {
				bottleImage.src = (this.value === 'Clear') ? '/images/IMG_0289.JPG' : '/images/IMG_0290.JPG';
				bottleImage.style.opacity = '1';
			}, 300);
		});
	});

	// --- 7. Selection -> Address (STEP2からSTEP3へ) ---
	if (perfumeForm) {
		perfumeForm.addEventListener('submit', (e) => {
			// ここではJavaに送信せず、住所入力欄を表示するだけ
			e.preventDefault();
			if (document.querySelectorAll('.scent-check:checked').length === 0) {
				alert("香りを1つ以上お選びください。");
				return;
			}
			selectionArea.style.opacity = '0';
			setTimeout(() => {
				selectionArea.style.display = 'none';
				addressSection.classList.remove('hidden');
				addressSection.style.display = 'flex';
				setTimeout(() => {
					addressSection.style.opacity = '1';
					window.scrollTo(0, 0);
				}, 50);
			}, 500);
		});
	}

	// --- 8. Address -> Preview Modal (住所入力後に確認画面を出す) ---
	const toPreviewBtn = document.getElementById('to-preview-btn');
	if (toPreviewBtn) {
		toPreviewBtn.addEventListener('click', () => {
			// IDの取得ミスを防ぐため、両方の可能性を考慮
			const nameInput = document.getElementById('userName');
			const addrInput = document.getElementById('userAddress') || document.getElementById('address');

			if (!nameInput || !addrInput) {
				console.error("入力要素（名前または住所）が見つかりません。IDを確認してください。");
				return;
			}

			const name = nameInput.value.trim();
			const addr = addrInput.value.trim();

			if (!name || !addr) {
				alert("お届け先をすべて入力してください。");
				return;
			}

			// プレビューテキストの更新
			updateText('preview-name', name);
			updateText('preview-address', addr);
			updateText('preview-scents', Array.from(document.querySelectorAll('.scent-check:checked')).map(el => el.value).join(' & '));

			const checkedBottle = document.querySelector('input[name="bottleType"]:checked');
			updateText('preview-bottle', checkedBottle ? checkedBottle.value : 'Clear');

			// モーダルを表示
			if (modal) {
				modal.classList.remove('modal-hidden');
			}
		});
	}

	// --- 9. Modal Control (最終確認ボタン) ---
	if (backBtn) {
		backBtn.addEventListener('click', () => modal.classList.add('modal-hidden'));
	}

	if (confirmBtn) {
		confirmBtn.addEventListener('click', () => {
			confirmBtn.innerText = "BLENDING...";
			confirmBtn.style.pointerEvents = "none";

			// 最後に本物のフォームをJavaへ送信
			if (perfumeForm) {
				perfumeForm.submit();
			}
		});
	}

	// --- 10. 共通関数 ---
	function updateText(id, text) {
		const el = document.getElementById(id);
		if (el) el.innerText = text;
	}
});