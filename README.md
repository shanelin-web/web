# 林良亘品牌網站

`index.html` 是網站原始頁面。頁尾的預約表單會直接將需求寫入 Supabase 專案的 `public.booking_requests` 資料表。

## 查看預約

登入 Supabase，開啟 **Table Editor → public → booking_requests**。訪客只可送出，不能讀取、修改或刪除預約資料。`database/booking_requests.sql` 保留資料表和權限設定。

表單送出代表收到需求，仍需人工聯絡確認日期與服務內容。目前沒有自動寄信通知；請定期到資料表查看新預約。公開表單可能收到垃圾訊息，若流量增加，建議再加入驗證或流量限制。
