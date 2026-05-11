# アメニティ在庫管理アプリ

民泊運営のアメニティ・消耗品の在庫を複数人で共有管理するシンプルなアプリ。

- 公開URL: https://scissors-estate.github.io/zaiko-app/
- データ保存: Firebase Firestore (`minpaku-estate` プロジェクト / コレクション名 `zaiko_entries`)
- ホスティング: GitHub Pages

## 編集するとき（次に変更したくなった時の手順）

1. `zaiko_v1.html` を編集（Claude が編集）
2. このフォルダを開く
3. **`deploy.bat` をダブルクリック**（黒い画面が開く）
4. 自動で `index.html` にコピー → `git push`
5. 1〜2分後に公開URLに反映

## 注意点

- 認証なし。URLを知っている人なら誰でも閲覧・編集・削除できる。社外秘の運用ルールに注意。
- 在庫データは `zaiko_entries` コレクションに保存される（民泊アプリのデータとは別）

## トラブル時のチェック

- `deploy.bat` ダブルクリックで画面が真っ暗 → 文字コード問題（UTF-8 BOMなし + CRLF で書き直す）
- 「接続エラー」と画面に出る → Firestore のセキュリティルールが `zaiko_entries` を許可していない可能性
- push が失敗 → ネット切断 / GitHub 認証期限切れ
