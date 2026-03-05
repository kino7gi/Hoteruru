document.addEventListener('DOMContentLoaded', function() {

	// --- 1. 要素の取得 ---
	const welcomeScreen = document.getElementById('welcome-screen');
	const mainContent = document.getElementById('main-content');
	const perfumeForm = document.getElementById('perfumeForm');
	const bottleImage = document.getElementById('bottle-image');
	const addressSection = document.getElementById('address-section');
	const selectionContainer = document.querySelector('.container');

	// モーダル関連
	const modal = document.getElementById('preview-modal');
	const confirmBtn = document.getElementById('confirm-order');
	const backBtn = document.getElementById('back-to-edit');

	// 初期化
	if (modal) modal.classList.add('modal-hidden');
	if (addressSection) addressSection.classList.add('hidden');

	// --- 2. 画面切り替え（Welcome -> Introduction & Main 表示） ---
	if (welcomeScreen && mainContent) {
		welcomeScreen.addEventListener('click', function() {
			welcomeScreen.style.transition = 'opacity 0.8s ease';
			welcomeScreen.style.opacity = '0';

			mainContent.classList.remove('hidden');
			mainContent.style.opacity = '0';

			setTimeout(() => {
				welcomeScreen.style.display = 'none';
				mainContent.style.transition = 'opacity 1s ease';
				mainContent.style.opacity = '1';

				// 画面が表示された後にスクロール位置をチェックしてアニメーションを発火
				revealOnScroll();
			}, 800);
		});
	}

	// --- 3. スクロール演出（Reveal）のロジック ---
	// フラグメント内の要素も document.querySelectorAll('.reveal') で取得可能
	const revealOnScroll = () => {
		const reveals = document.querySelectorAll('.reveal');
		reveals.forEach(el => {
			const windowHeight = window.innerHeight;
			const elementTop = el.getBoundingClientRect().top;
			const elementVisible = 100; // 100px見えたら表示
			if (elementTop < windowHeight - elementVisible) {
				el.classList.add('active');
			}
		});
	};
	window.addEventListener('scroll', revealOnScroll);

	// --- 4. スムーズスクロール（GO TO BLEND ボタン用） ---
	// introduction.html 内のリンクが押された時にゆっくり移動
	document.addEventListener('click', function(e) {
		if (e.target && e.target.classList.contains('scroll-link')) {
			e.preventDefault();
			const targetId = e.target.getAttribute('href');
			const targetElement = document.querySelector(targetId);
			if (targetElement) {
				targetElement.scrollIntoView({ behavior: 'smooth', block: 'start' });
			}
		}
	});

	// --- 5. 香りの選択制限（最大2つ） ---
	const checkboxes = document.querySelectorAll('.scent-check');
	const MAX_SELECTION = 2;
	checkboxes.forEach(checkbox => {
		checkbox.addEventListener('change', function() {
			const checkedCount = document.querySelectorAll('.scent-check:checked').length;
			if (checkedCount > MAX_SELECTION) {
				this.checked = false;
				alert(`香料は最大${MAX_SELECTION}つまで選択可能です。`);
			}
		});
	});

	// --- 6. 瓶の画像切り替え ---
	const bottleRadios = document.querySelectorAll('input[name="bottleType"]');
	bottleRadios.forEach(radio => {
		radio.addEventListener('change', function() {
			if (!bottleImage) return;
			bottleImage.style.transition = 'opacity 0.3s ease';
			bottleImage.style.opacity = '0';
			setTimeout(() => {
				bottleImage.src = (this.value === 'Clear') ? '/images/IMG_0289.JPG' : '/images/IMG_0290.JPG';
				bottleImage.style.opacity = '1';
			}, 300);
		});
	});

	// --- 7. 選択画面 -> 住所画面切り替え ---
	if (perfumeForm) {
		perfumeForm.addEventListener('submit', function(e) {
			e.preventDefault();
			const checkedScentElements = document.querySelectorAll('.scent-check:checked');
			if (checkedScentElements.length === 0) {
				alert("お好きな香りを1つ以上お選びください。");
				return;
			}

			// 香り選択を消す
			selectionContainer.style.opacity = '0';
			selectionContainer.style.transition = 'opacity 0.5s ease';

			setTimeout(() => {
				selectionContainer.classList.add('hidden');
				selectionContainer.style.display = 'none';

				// 紹介文もこのタイミングで非表示にしたい場合は以下を追加
				const introContainer = document.querySelector('.intro-container');
				if (introContainer) introContainer.style.display = 'none';

				addressSection.classList.remove('hidden');
				addressSection.style.display = 'flex';
				addressSection.style.opacity = '0';

				setTimeout(() => {
					addressSection.style.transition = 'opacity 0.6s ease';
					addressSection.style.opacity = '1';
					window.scrollTo(0, 0);
				}, 50);
			}, 500);
		});
	}

	// --- 8. 住所画面 -> モーダル表示 ---
	const toPreviewBtn = document.getElementById('to-preview-btn');
	if (toPreviewBtn) {
		toPreviewBtn.addEventListener('click', function() {
			const inputName = document.getElementById('userName')?.value.trim();
			const inputAddress = document.getElementById('userAddress')?.value.trim();

			if (!inputName || !inputAddress) {
				alert("お届け先情報をすべて入力してください。");
				return;
			}

			const checkedScentElements = document.querySelectorAll('.scent-check:checked');
			const scentCount = checkedScentElements.length;
			const selectedScents = Array.from(checkedScentElements).map(el => el.value).join(' & ');
			const selectedBottleValue = document.querySelector('input[name="bottleType"]:checked')?.value || "Clear";
			let totalPrice = (scentCount === 1) ? 8000 : 12000;

			updateText('preview-scents', selectedScents);
			updateText('preview-bottle', selectedBottleValue + " Bottle");
			updateText('preview-price', "¥" + totalPrice.toLocaleString());
			updateText('preview-name', inputName);
			updateText('preview-address', inputAddress);

			modal.classList.remove('modal-hidden');
		});
	}

	// --- 9. モーダル操作 ---
	if (backBtn) backBtn.addEventListener('click', () => modal.classList.add('modal-hidden'));
	if (confirmBtn) {
		confirmBtn.addEventListener('click', () => {
			confirmBtn.innerText = "BLENDING...";
			confirmBtn.style.pointerEvents = "none";
			perfumeForm.submit();
		});
	}

	function updateText(id, text) {
		const el = document.getElementById(id);
		if (el) el.innerText = text;
	}
});