// --- 1. 香りの更新 (在庫 + 概要説明) ---
function updateScentStock(id, btn) {
	const row = btn.closest('tr');
	const stock = row.querySelector('.scent-stock').value;
	const description = row.querySelector('.scent-description').value; // テキストエリアから取得

	// 説明文も送るために FormData を使用（日本語や長文を安全に送るため）
	const formData = new FormData();
	formData.append('id', id);
	formData.append('stock', stock);
	formData.append('description', description);

	fetch('/admin/update-scent-stock', {
		method: 'POST',
		body: formData // URLSearchParamsではなくFormDataで送るのが無難です
	})
		.then(res => res.text())
		.then(data => {
			if (data === 'success') {
				alert('香りの情報を更新しました');
			} else {
				alert('更新に失敗しました');
			}
		});
}

// --- 2. ボトルの更新 ---
function updateBottleStock(id, btn) {
	const stock = btn.closest('tr').querySelector('.bottle-stock').value;

	// ボトルは在庫のみの更新なので共通関数を使用
	sendUpdate('/admin/update-bottle-stock', id, stock, 'ボトルの在庫を更新しました');
}

// 共通の送信処理 (在庫のみの更新用)
function sendUpdate(url, id, stock, successMsg) {
	fetch(url, {
		method: 'POST',
		headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
		body: `id=${id}&stock=${stock}`
	})
		.then(res => res.text())
		.then(data => {
			if (data === 'success') {
				alert(successMsg);
			} else {
				alert('更新に失敗しました');
			}
		});
}

// --- 3. 香りの新規追加 ---
function addScent() {
	const nameEl = document.getElementById('newScentName');
	const descEl = document.getElementById('newScentDescription');
	const stockEl = document.getElementById('newScentStock');
	const imageEl = document.getElementById('newScentImage'); // HTMLのid="newScentImage"に合わせる

	if (!nameEl.value) { alert("名前を入力してください"); return; }

	const formData = new FormData();
	formData.append('name', nameEl.value);
	formData.append('description', descEl.value);
	formData.append('stock', stockEl.value);

	// 画像がある場合のみ追加
	if (imageEl.files && imageEl.files[0]) {
		formData.append('image', imageEl.files[0]); // Controllerの引数名に合わせて'image'に変更
	}

	fetch('/admin/add-scent', {
		method: 'POST',
		body: formData
	})
		.then(res => res.text())
		.then(data => {
			if (data === 'success') {
				location.reload();
			} else {
				alert("追加に失敗しました");
			}
		})
		.catch(err => console.error("Error:", err));
}

// --- 4. ボトルの新規追加 ---
function addBottle() {
	const name = document.getElementById('newBottleName').value;
	const capacity = document.getElementById('newBottleCapacity').value;
	const stock = document.getElementById('newBottleStock').value;
	const imageEl = document.getElementById('newBottleImage'); // HTMLのidに合わせる

	if (!name || !capacity) { alert("全ての項目を入力してください"); return; }

	const formData = new FormData();
	formData.append('name', name);
	formData.append('capacity', capacity);
	formData.append('stock', stock);

	if (imageEl.files && imageEl.files[0]) {
		formData.append('image', imageEl.files[0]);
	}

	fetch('/admin/add-bottle', {
		method: 'POST',
		body: formData
	})
		.then(res => res.text())
		.then(data => {
			if (data === 'success') {
				location.reload();
			} else {
				alert("追加に失敗しました");
			}
		})
		.catch(err => console.error("Error:", err));
}

// --- 5. 削除処理 (既存のまま) ---
function deleteScent(id) {
	if (!confirm("この香りを削除してもよろしいですか？")) return;
	fetch('/admin/delete-scent', {
		method: 'POST',
		headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
		body: `id=${id}`
	})
		.then(res => res.text())
		.then(data => {
			if (data === 'success') location.reload();
			else alert("削除に失敗しました");
		});
}

function deleteBottle(id) {
	if (!confirm("このボトルを削除してもよろしいですか？")) return;
	fetch('/admin/delete-bottle', {
		method: 'POST',
		headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
		body: `id=${id}`
	})
		.then(res => res.text())
		.then(data => {
			if (data === 'success') location.reload();
			else alert("削除に失敗しました");
		});
}