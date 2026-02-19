
//今日の日付。宿泊日を選ぶ際のカレンダーを表示する
let maxDate = new Date();

//今日から3ヵ月後
maxDate = maxDate.setMonth(maxDate.getMonth() + 3);

flatpickr('#fromCheckinDateToCheckoutDate', {
	//日付けを期間選択にする
	mode: "range",
	//カレンダーを日本語表示にする
	locale: 'ja',
	//今日より前は選択できない
	minDate: 'today',
	maxDate: maxDate
});


