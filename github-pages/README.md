# VANTERA GitHub Pages 預覽

這是供作品集使用的純前端展示包。GitHub Pages 不會執行 JSP 或連接 MySQL，因此頁面會在後端資料端點不存在時切換到展示商品資料；登入、會員、購物車、結帳和管理功能不會執行。

## 發布

1. 在 GitHub 建立一個新的 **Public** repository。
2. 將此資料夾內的檔案與 `images/` 資料夾放到 repository 根目錄。
3. 到 repository 的 **Settings → Pages**，選擇 **Deploy from a branch**、`main` 分支與 `/(root)`，然後儲存。
4. Pages 建置完成後，網址格式會是 `https://<你的 GitHub 帳號>.github.io/<repository 名稱>/`。

這個包只包含靜態首頁與所需圖片，不包含 JSP 後端、SQL 備份、會員照片或資料庫帳密。所有資源路徑皆為相對路徑，支援 repository 子路徑部署。
