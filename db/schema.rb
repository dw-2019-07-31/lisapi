# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "battles", id: false, force: :cascade do |t|
    t.string "epoch_millisecounds", limit: 20
    t.date "access_date"
    t.string "action", limit: 80
    t.string "operation_user", limit: 30
    t.string "matter", limit: 50
    t.string "name_hash", limit: 200
    t.string "email", limit: 30
    t.string "resource_url", limit: 100
    t.string "query_string", limit: 500
    t.string "domain", limit: 50
    t.string "detail", limit: 300
  end

  create_table "battles_181023", id: false, force: :cascade do |t|
    t.string "epoch_millisecounds", limit: 20
    t.date "access_date"
    t.string "action", limit: 80
    t.string "operation_user", limit: 30
    t.string "matter", limit: 50
    t.string "name_hash", limit: 200
    t.string "email", limit: 30
    t.string "resource_url", limit: 100
    t.string "query_string", limit: 500
    t.string "domain", limit: 50
    t.string "detail", limit: 300
  end

  create_table "log_access", id: false, force: :cascade do |t|
    t.date "log_date"
    t.string "userid", limit: 10
    t.string "name", limit: 20
    t.string "note", limit: 100
  end

  create_table "log_update", primary_key: ["data_date", "sirial"], force: :cascade do |t|
    t.string "sec", limit: 10, comment: "商品:ITM"
    t.string "data_date", limit: 8, null: false, comment: "データ日付"
    t.integer "sirial", limit: 2, precision: 2, null: false, comment: "シリアル番号"
    t.string "item_code", limit: 25, comment: "商品コード"
    t.string "note", limit: 200, comment: "備考（内容）"
    t.string "wrtite_user", limit: 10
  end

  create_table "maker_zaiko_bk", id: false, comment: "メーカー在庫CSV取り込み用", force: :cascade do |t|
    t.string "hincd", limit: 25, null: false
    t.decimal "relzaisu", precision: 19, scale: 4, default: "0.0"
  end

  create_table "mst_barcode", id: false, comment: "バーコードマスタ", force: :cascade do |t|
    t.string "item_code", limit: 25, null: false, comment: "品目コード"
    t.binary "barcode", comment: "バーコードイメージ"
    t.index ["item_code"], name: "idx_mst_barcode", unique: true
  end

  create_table "mst_brand", primary_key: "brand_code", id: :string, limit: 6, force: :cascade do |t|
    t.string "brand_name", limit: 20
  end

  create_table "mst_brand_limit", primary_key: ["nhscd", "brandcd"], comment: "販路制限_ブランド制限マスタ", force: :cascade do |t|
    t.string "nhscd", limit: 11, null: false, comment: "納品先コード"
    t.string "brandcd", limit: 6, null: false, comment: "ブランドコード"
  end

  create_table "mst_brand_limit_160525_053251", id: false, force: :cascade do |t|
    t.string "nhscd", limit: 11, null: false
    t.string "brandcd", limit: 6, null: false
  end

  create_table "mst_brand_limit_160630_125105", id: false, force: :cascade do |t|
    t.string "nhscd", limit: 11, null: false
    t.string "brandcd", limit: 6, null: false
  end

  create_table "mst_brand_limit_170524_032450", id: false, force: :cascade do |t|
    t.string "nhscd", limit: 11, null: false
    t.string "brandcd", limit: 6, null: false
  end

  create_table "mst_carrency", primary_key: "currency_code", id: :string, limit: 3, comment: "通貨コード", comment: "通貨マスタ", force: :cascade do |t|
    t.string "currency_name", limit: 10, comment: "通貨名"
    t.decimal "currency_rate", precision: 6, scale: 3, comment: "レート"
  end

  create_table "mst_client_limit", id: false, comment: "販路制限_得意先制限マスタ", force: :cascade do |t|
    t.string "tokcd", null: false, comment: "得意先コード"
    t.index ["tokcd"], name: "pk_mst_client_limit", unique: true
  end

  create_table "mst_client_limit_170524_032513", id: false, force: :cascade do |t|
    t.string "tokcd", null: false
  end

  create_table "mst_corp_rate", id: false, comment: "実績単価_社内レートマスタ", force: :cascade do |t|
    t.string "currency_code", limit: 2, null: false, comment: "通貨コード"
    t.string "currency_name", limit: 10, comment: "通貨名"
    t.decimal "rate", precision: 6, scale: 2, comment: "社内レート"
    t.index ["currency_code"], name: "pk_mst_corp_rate", unique: true
  end

  create_table "mst_direct_item", id: false, comment: "直営店商品マスタ", force: :cascade do |t|
    t.string "item_code", limit: 25, null: false, comment: "商品コード"
    t.string "item_name", limit: 80, comment: "商品名"
    t.string "jan_code", limit: 15, comment: "JANコード"
    t.decimal "retail", precision: 8, scale: 2, comment: "上代（販売価格）"
    t.string "start_selling", limit: 8, comment: "販売開始日"
    t.string "supplier_code", limit: 10, comment: "仕入先コード"
    t.string "age", limit: 14, comment: "対象年齢"
    t.string "category", limit: 20, comment: "カテゴリー"
    t.string "note1", limit: 20, comment: "備考１"
    t.string "note2", limit: 20, comment: "備考２"
    t.string "global_note", limit: 200, comment: "大備考"
    t.string "image_file_path1", limit: 100, comment: "イメージファイル１"
    t.string "image_file_path2", limit: 100, comment: "イメージファイル２"
  end

  create_table "mst_direct_supplier", id: false, comment: "直営店仕入先マスタ", force: :cascade do |t|
    t.string "supplier_code", limit: 10, null: false, comment: "仕入先コード"
    t.string "name", limit: 80, comment: "社名"
    t.string "contact_person", limit: 20, comment: "仕入先担当者"
    t.string "address", limit: 100, comment: "住所"
    t.string "tel", limit: 15, comment: "電話番号"
    t.string "fax", limit: 15, comment: "FAX番号"
  end

  create_table "mst_ergo", id: false, comment: "実績単価_エルゴマスタ（加工・検品）", force: :cascade do |t|
    t.string "ergo_code", limit: 10, null: false, comment: "エルゴ加工検品コード"
    t.string "ergo_name", limit: 100, comment: "加工検品名"
    t.decimal "price", precision: 6, scale: 2, comment: "加工検品単価"
    t.string "note", limit: 100, comment: "備考"
    t.index ["ergo_code"], name: "pk_mst_ergo", unique: true
  end

  create_table "mst_exclusion_web_stock", id: false, comment: "EC在庫転送除外品マスタ", force: :cascade do |t|
    t.string "item_code", limit: 25, null: false, comment: "商品コード"
    t.index ["item_code"], name: "mst_exclusion_web_stock_idx", unique: true
  end

  create_table "mst_factory", primary_key: "factory_code", id: :string, limit: 4, comment: "ファクトリーコード", comment: "ファクトリーマスタ", force: :cascade do |t|
    t.string "name", limit: 50, comment: "ファクトリー名"
    t.string "address", limit: 150, comment: "ファクトリー住所"
    t.string "tel", limit: 15, comment: "ファクトリー電話番号"
    t.string "fax", limit: 15, comment: "ファクトリーFAX番号"
  end

  create_table "mst_import_apparel", id: false, comment: "実績単価_輸入アパレルマスタ", force: :cascade do |t|
    t.string "imp_app_code", limit: 5, null: false, comment: "輸入アパレルコード"
    t.string "imp_app_name", limit: 50, comment: "輸入アパレル名"
    t.decimal "price", precision: 6, scale: 2, comment: "輸入アパレル単価"
    t.string "note", limit: 100, comment: "備考"
    t.index ["imp_app_code"], name: "pk_mst_import_apparel", unique: true
  end

  create_table "mst_incoterms", id: false, comment: "実績単価_インコタームズマスタ", force: :cascade do |t|
    t.string "inc_code", limit: 3, null: false, comment: "インコタームズコード"
    t.string "inc_name", limit: 50, comment: "インコタームズ輸送手段名"
    t.string "currency_code", limit: 2, comment: "通貨コード（MST_CORP_RATE）"
    t.decimal "ttm_rate", precision: 6, scale: 2, comment: "TTMレート"
    t.decimal "buying_exchange_rate", precision: 6, scale: 2, comment: "実仕入レート"
    t.index ["inc_code"], name: "pk_incoterms", unique: true
  end

  create_table "mst_incoterms_161114_031842", id: false, force: :cascade do |t|
    t.string "inc_code", limit: 2, null: false
    t.string "inc_name", limit: 50
    t.string "currency_code", limit: 2
    t.decimal "ttm_rate", precision: 6, scale: 2
    t.decimal "buying_exchange_rate", precision: 6, scale: 2
  end

  create_table "mst_incoterms_170209_054632", id: false, force: :cascade do |t|
    t.string "inc_code", limit: 3, null: false
    t.string "inc_name", limit: 50
    t.string "currency_code", limit: 2
    t.decimal "ttm_rate", precision: 6, scale: 2
    t.decimal "buying_exchange_rate", precision: 6, scale: 2
  end

  create_table "mst_item", primary_key: "item_code", id: :string, limit: 25, comment: "商品コード", comment: "商品基本情報", force: :cascade do |t|
    t.string "genre_code", limit: 2, comment: "ジャンルコード"
    t.string "item_name", limit: 100, comment: "商品名"
    t.string "standard", limit: 100, comment: "規格"
    t.string "kana_name", limit: 100, comment: "カナ名称"
    t.string "eng_name", limit: 100, comment: "英語表記名"
    t.string "jan1", limit: 15, comment: "JAN_1"
    t.string "jan2", limit: 15, comment: "JAN_2"
    t.string "maker_item_code", limit: 30, comment: "メーカー品番"
    t.string "vender", limit: 100, comment: "ベンダー"
    t.decimal "retail", precision: 8, scale: 2, comment: "定価（上代）"
    t.string "moq", limit: 20, comment: "最小発注数"
    t.string "currency_code1", limit: 3, comment: "情報1_通貨コード"
    t.string "shipping_term_fob1", limit: 20, comment: "情報1_FOB対象国"
    t.decimal "shipping_term_price1", precision: 8, scale: 2, comment: "情報1_通貨（FOB）"
    t.decimal "price1", precision: 8, scale: 2, comment: "情報1_仕入値"
    t.decimal "cost_rate1", precision: 4, scale: 3, comment: "情報1_原価率"
    t.string "currency_code2", limit: 3, comment: "情報2_通貨コード"
    t.string "shipping_term_fob2", limit: 20, comment: "情報2_FOB対象国"
    t.decimal "shipping_term_price2", precision: 8, scale: 2, comment: "情報2_通貨（FOB）"
    t.decimal "price2", precision: 8, scale: 2, comment: "情報2_仕入値"
    t.decimal "cost_rate2", precision: 4, scale: 3, comment: "情報2_原価率"
    t.string "oem", limit: 30, comment: "OEM"
    t.string "order_note", limit: 50, comment: "発注コメント"
    t.string "supplier_code", limit: 10, comment: "仕入先コード"
    t.string "supplier_name", limit: 60, comment: "仕入先名"
    t.string "launch_schedule", limit: 14, comment: "展開時期"
    t.string "maker_code", limit: 5, comment: "メーカーコード"
    t.string "maker_location", limit: 5, comment: "場所"
    t.string "brand_code", limit: 6, comment: "ブランドコード"
    t.string "age", limit: 100, comment: "商品仕様_対象年齢"
    t.string "accessories", limit: 250, comment: "商品仕様_アクセサリー"
    t.string "award", limit: 250, comment: "商品仕様_受賞記録"
    t.string "factory", limit: 100, comment: "商品仕様_製造"
    t.string "other", limit: 100, comment: "商品仕様_その他"
    t.string "material", limit: 500, comment: "商品仕様_材質"
    t.string "origin", limit: 20, comment: "商品仕様_原産国"
    t.integer "read_time", limit: 3, precision: 3, comment: "リードタイム（日）"
    t.string "status", limit: 10, comment: "ステータス"
    t.string "change_note", limit: 200, comment: "変更リマーク"
    t.string "ch_end_date", limit: 8, comment: "不明"
    t.string "all_kana_name", limit: 100, comment: "カナ名（全）"
    t.string "package", limit: 200, comment: "パッケージ"
    t.string "catchcopy_main", limit: 400, comment: "消費者向けコピー"
    t.string "catchcopy_sub1", limit: 60, comment: "箇条書き消費者向けコピーA"
    t.string "catchcopy_sub2", limit: 60, comment: "箇条書き消費者向けコピーB"
    t.string "catchcopy_sub3", limit: 60, comment: "箇条書き消費者向けコピーC"
    t.boolean "cataloged", comment: "カタログ掲載有無"
    t.string "catalog_copy", limit: 500, comment: "カタログコピー"

  end

  add_context_index "mst_item", ["item_name"], name: "i_l_item_name"
  add_context_index "mst_item", ["standard"], name: "i_l_item_stan"

  create_table "mst_item_170706", id: false, comment: "商品基本情報", force: :cascade do |t|
    t.string "item_code", limit: 25, null: false, comment: "商品コード"
    t.string "genre_code", limit: 2, comment: "ジャンルコード"
    t.string "item_name", limit: 100, comment: "商品名"
    t.string "standard", limit: 100, comment: "規格"
    t.string "kana_name", limit: 100, comment: "カナ名称"
    t.string "eng_name", limit: 100, comment: "英語表記名"
    t.string "jan1", limit: 15, comment: "JAN_1"
    t.string "jan2", limit: 15, comment: "JAN_2"
    t.string "maker_item_code", limit: 30, comment: "メーカー品番"
    t.string "vender", limit: 100, comment: "ベンダー"
    t.decimal "retail", precision: 8, scale: 2, comment: "定価（上代）"
    t.string "moq", limit: 20, comment: "最小発注数"
    t.string "currency_code1", limit: 3, comment: "情報1_通貨コード"
    t.string "shipping_term_fob1", limit: 20, comment: "情報1_FOB対象国"
    t.decimal "shipping_term_price1", precision: 8, scale: 2, comment: "情報1_通貨（FOB）"
    t.decimal "price1", precision: 8, scale: 2, comment: "情報1_仕入値"
    t.decimal "cost_rate1", precision: 4, scale: 3, comment: "情報1_原価率"
    t.string "currency_code2", limit: 3, comment: "情報2_通貨コード"
    t.string "shipping_term_fob2", limit: 20, comment: "情報2_FOB対象国"
    t.decimal "shipping_term_price2", precision: 8, scale: 2, comment: "情報2_通貨（FOB）"
    t.decimal "price2", precision: 8, scale: 2, comment: "情報2_仕入値"
    t.decimal "cost_rate2", precision: 4, scale: 3, comment: "情報2_原価率"
    t.string "oem", limit: 30, comment: "OEM"
    t.string "order_note", limit: 50, comment: "発注コメント"
    t.string "supplier_code", limit: 10, comment: "仕入先コード"
    t.string "supplier_name", limit: 60, comment: "仕入先名"
    t.string "launch_schedule", limit: 10, comment: "展開時期"
    t.string "maker_code", limit: 5, comment: "メーカーコード"
    t.string "maker_location", limit: 5, comment: "場所"
    t.string "brand_code", limit: 6, comment: "ブランドコード"
    t.string "age", limit: 100, comment: "商品仕様_対象年齢"
    t.string "accessories", limit: 250, comment: "商品仕様_アクセサリー"
    t.string "award", limit: 250, comment: "商品仕様_受賞記録"
    t.string "factory", limit: 100, comment: "商品仕様_製造"
    t.string "other", limit: 100, comment: "商品仕様_その他"
    t.string "material", limit: 500, comment: "商品仕様_材質"
    t.string "origin", limit: 20, comment: "商品仕様_原産国"
    t.integer "read_time", limit: 3, precision: 3, comment: "リードタイム（日）"
    t.string "status", limit: 10, comment: "ステータス"
    t.string "change_note", limit: 200, comment: "変更リマーク"
    t.string "ch_end_date", limit: 8, comment: "不明"
    t.string "all_kana_name", limit: 100, comment: "カナ名（全）"
    t.string "package", limit: 200, comment: "パッケージ"
  end

  create_table "mst_item_170710", id: false, comment: "商品基本情報", force: :cascade do |t|
    t.string "item_code", limit: 25, null: false, comment: "商品コード"
    t.string "genre_code", limit: 2, comment: "ジャンルコード"
    t.string "item_name", limit: 100, comment: "商品名"
    t.string "standard", limit: 100, comment: "規格"
    t.string "kana_name", limit: 100, comment: "カナ名称"
    t.string "eng_name", limit: 100, comment: "英語表記名"
    t.string "jan1", limit: 15, comment: "JAN_1"
    t.string "jan2", limit: 15, comment: "JAN_2"
    t.string "maker_item_code", limit: 30, comment: "メーカー品番"
    t.string "vender", limit: 100, comment: "ベンダー"
    t.decimal "retail", precision: 8, scale: 2, comment: "定価（上代）"
    t.string "moq", limit: 20, comment: "最小発注数"
    t.string "currency_code1", limit: 3, comment: "情報1_通貨コード"
    t.string "shipping_term_fob1", limit: 20, comment: "情報1_FOB対象国"
    t.decimal "shipping_term_price1", precision: 8, scale: 2, comment: "情報1_通貨（FOB）"
    t.decimal "price1", precision: 8, scale: 2, comment: "情報1_仕入値"
    t.decimal "cost_rate1", precision: 4, scale: 3, comment: "情報1_原価率"
    t.string "currency_code2", limit: 3, comment: "情報2_通貨コード"
    t.string "shipping_term_fob2", limit: 20, comment: "情報2_FOB対象国"
    t.decimal "shipping_term_price2", precision: 8, scale: 2, comment: "情報2_通貨（FOB）"
    t.decimal "price2", precision: 8, scale: 2, comment: "情報2_仕入値"
    t.decimal "cost_rate2", precision: 4, scale: 3, comment: "情報2_原価率"
    t.string "oem", limit: 30, comment: "OEM"
    t.string "order_note", limit: 50, comment: "発注コメント"
    t.string "supplier_code", limit: 10, comment: "仕入先コード"
    t.string "supplier_name", limit: 60, comment: "仕入先名"
    t.string "launch_schedule", limit: 10, comment: "展開時期"
    t.string "maker_code", limit: 5, comment: "メーカーコード"
    t.string "maker_location", limit: 5, comment: "場所"
    t.string "brand_code", limit: 6, comment: "ブランドコード"
    t.string "age", limit: 100, comment: "商品仕様_対象年齢"
    t.string "accessories", limit: 250, comment: "商品仕様_アクセサリー"
    t.string "award", limit: 250, comment: "商品仕様_受賞記録"
    t.string "factory", limit: 100, comment: "商品仕様_製造"
    t.string "other", limit: 100, comment: "商品仕様_その他"
    t.string "material", limit: 500, comment: "商品仕様_材質"
    t.string "origin", limit: 20, comment: "商品仕様_原産国"
    t.integer "read_time", limit: 3, precision: 3, comment: "リードタイム（日）"
    t.string "status", limit: 10, comment: "ステータス"
    t.string "change_note", limit: 200, comment: "変更リマーク"
    t.string "ch_end_date", limit: 8, comment: "不明"
    t.string "all_kana_name", limit: 100, comment: "カナ名（全）"
    t.string "package", limit: 200, comment: "パッケージ"
  end

  create_table "mst_item_170718", id: false, comment: "商品基本情報", force: :cascade do |t|
    t.string "item_code", limit: 25, null: false, comment: "商品コード"
    t.string "genre_code", limit: 2, comment: "ジャンルコード"
    t.string "item_name", limit: 100, comment: "商品名"
    t.string "standard", limit: 100, comment: "規格"
    t.string "kana_name", limit: 100, comment: "カナ名称"
    t.string "eng_name", limit: 100, comment: "英語表記名"
    t.string "jan1", limit: 15, comment: "JAN_1"
    t.string "jan2", limit: 15, comment: "JAN_2"
    t.string "maker_item_code", limit: 30, comment: "メーカー品番"
    t.string "vender", limit: 100, comment: "ベンダー"
    t.decimal "retail", precision: 8, scale: 2, comment: "定価（上代）"
    t.string "moq", limit: 20, comment: "最小発注数"
    t.string "currency_code1", limit: 3, comment: "情報1_通貨コード"
    t.string "shipping_term_fob1", limit: 20, comment: "情報1_FOB対象国"
    t.decimal "shipping_term_price1", precision: 8, scale: 2, comment: "情報1_通貨（FOB）"
    t.decimal "price1", precision: 8, scale: 2, comment: "情報1_仕入値"
    t.decimal "cost_rate1", precision: 4, scale: 3, comment: "情報1_原価率"
    t.string "currency_code2", limit: 3, comment: "情報2_通貨コード"
    t.string "shipping_term_fob2", limit: 20, comment: "情報2_FOB対象国"
    t.decimal "shipping_term_price2", precision: 8, scale: 2, comment: "情報2_通貨（FOB）"
    t.decimal "price2", precision: 8, scale: 2, comment: "情報2_仕入値"
    t.decimal "cost_rate2", precision: 4, scale: 3, comment: "情報2_原価率"
    t.string "oem", limit: 30, comment: "OEM"
    t.string "order_note", limit: 50, comment: "発注コメント"
    t.string "supplier_code", limit: 10, comment: "仕入先コード"
    t.string "supplier_name", limit: 60, comment: "仕入先名"
    t.string "launch_schedule", limit: 10, comment: "展開時期"
    t.string "maker_code", limit: 5, comment: "メーカーコード"
    t.string "maker_location", limit: 5, comment: "場所"
    t.string "brand_code", limit: 6, comment: "ブランドコード"
    t.string "age", limit: 100, comment: "商品仕様_対象年齢"
    t.string "accessories", limit: 250, comment: "商品仕様_アクセサリー"
    t.string "award", limit: 250, comment: "商品仕様_受賞記録"
    t.string "factory", limit: 100, comment: "商品仕様_製造"
    t.string "other", limit: 100, comment: "商品仕様_その他"
    t.string "material", limit: 500, comment: "商品仕様_材質"
    t.string "origin", limit: 20, comment: "商品仕様_原産国"
    t.integer "read_time", limit: 3, precision: 3, comment: "リードタイム（日）"
    t.string "status", limit: 10, comment: "ステータス"
    t.string "change_note", limit: 200, comment: "変更リマーク"
    t.string "ch_end_date", limit: 8, comment: "不明"
    t.string "all_kana_name", limit: 100, comment: "カナ名（全）"
    t.string "package", limit: 200, comment: "パッケージ"
  end

  create_table "mst_item_170725", id: false, comment: "商品基本情報", force: :cascade do |t|
    t.string "item_code", limit: 25, null: false, comment: "商品コード"
    t.string "genre_code", limit: 2, comment: "ジャンルコード"
    t.string "item_name", limit: 100, comment: "商品名"
    t.string "standard", limit: 100, comment: "規格"
    t.string "kana_name", limit: 100, comment: "カナ名称"
    t.string "eng_name", limit: 100, comment: "英語表記名"
    t.string "jan1", limit: 15, comment: "JAN_1"
    t.string "jan2", limit: 15, comment: "JAN_2"
    t.string "maker_item_code", limit: 30, comment: "メーカー品番"
    t.string "vender", limit: 100, comment: "ベンダー"
    t.decimal "retail", precision: 8, scale: 2, comment: "定価（上代）"
    t.string "moq", limit: 20, comment: "最小発注数"
    t.string "currency_code1", limit: 3, comment: "情報1_通貨コード"
    t.string "shipping_term_fob1", limit: 20, comment: "情報1_FOB対象国"
    t.decimal "shipping_term_price1", precision: 8, scale: 2, comment: "情報1_通貨（FOB）"
    t.decimal "price1", precision: 8, scale: 2, comment: "情報1_仕入値"
    t.decimal "cost_rate1", precision: 4, scale: 3, comment: "情報1_原価率"
    t.string "currency_code2", limit: 3, comment: "情報2_通貨コード"
    t.string "shipping_term_fob2", limit: 20, comment: "情報2_FOB対象国"
    t.decimal "shipping_term_price2", precision: 8, scale: 2, comment: "情報2_通貨（FOB）"
    t.decimal "price2", precision: 8, scale: 2, comment: "情報2_仕入値"
    t.decimal "cost_rate2", precision: 4, scale: 3, comment: "情報2_原価率"
    t.string "oem", limit: 30, comment: "OEM"
    t.string "order_note", limit: 50, comment: "発注コメント"
    t.string "supplier_code", limit: 10, comment: "仕入先コード"
    t.string "supplier_name", limit: 60, comment: "仕入先名"
    t.string "launch_schedule", limit: 10, comment: "展開時期"
    t.string "maker_code", limit: 5, comment: "メーカーコード"
    t.string "maker_location", limit: 5, comment: "場所"
    t.string "brand_code", limit: 6, comment: "ブランドコード"
    t.string "age", limit: 100, comment: "商品仕様_対象年齢"
    t.string "accessories", limit: 250, comment: "商品仕様_アクセサリー"
    t.string "award", limit: 250, comment: "商品仕様_受賞記録"
    t.string "factory", limit: 100, comment: "商品仕様_製造"
    t.string "other", limit: 100, comment: "商品仕様_その他"
    t.string "material", limit: 500, comment: "商品仕様_材質"
    t.string "origin", limit: 20, comment: "商品仕様_原産国"
    t.integer "read_time", limit: 3, precision: 3, comment: "リードタイム（日）"
    t.string "status", limit: 10, comment: "ステータス"
    t.string "change_note", limit: 200, comment: "変更リマーク"
    t.string "ch_end_date", limit: 8, comment: "不明"
    t.string "all_kana_name", limit: 100, comment: "カナ名（全）"
    t.string "package", limit: 200, comment: "パッケージ"
  end

  create_table "mst_item_171108143310", id: false, comment: "商品基本情報", force: :cascade do |t|
    t.string "item_code", limit: 25, null: false, comment: "商品コード"
    t.string "genre_code", limit: 2, comment: "ジャンルコード"
    t.string "item_name", limit: 100, comment: "商品名"
    t.string "standard", limit: 100, comment: "規格"
    t.string "kana_name", limit: 100, comment: "カナ名称"
    t.string "eng_name", limit: 100, comment: "英語表記名"
    t.string "jan1", limit: 15, comment: "JAN_1"
    t.string "jan2", limit: 15, comment: "JAN_2"
    t.string "maker_item_code", limit: 30, comment: "メーカー品番"
    t.string "vender", limit: 100, comment: "ベンダー"
    t.decimal "retail", precision: 8, scale: 2, comment: "定価（上代）"
    t.string "moq", limit: 20, comment: "最小発注数"
    t.string "currency_code1", limit: 3, comment: "情報1_通貨コード"
    t.string "shipping_term_fob1", limit: 20, comment: "情報1_FOB対象国"
    t.decimal "shipping_term_price1", precision: 8, scale: 2, comment: "情報1_通貨（FOB）"
    t.decimal "price1", precision: 8, scale: 2, comment: "情報1_仕入値"
    t.decimal "cost_rate1", precision: 4, scale: 3, comment: "情報1_原価率"
    t.string "currency_code2", limit: 3, comment: "情報2_通貨コード"
    t.string "shipping_term_fob2", limit: 20, comment: "情報2_FOB対象国"
    t.decimal "shipping_term_price2", precision: 8, scale: 2, comment: "情報2_通貨（FOB）"
    t.decimal "price2", precision: 8, scale: 2, comment: "情報2_仕入値"
    t.decimal "cost_rate2", precision: 4, scale: 3, comment: "情報2_原価率"
    t.string "oem", limit: 30, comment: "OEM"
    t.string "order_note", limit: 50, comment: "発注コメント"
    t.string "supplier_code", limit: 10, comment: "仕入先コード"
    t.string "supplier_name", limit: 60, comment: "仕入先名"
    t.string "launch_schedule", limit: 10, comment: "展開時期"
    t.string "maker_code", limit: 5, comment: "メーカーコード"
    t.string "maker_location", limit: 5, comment: "場所"
    t.string "brand_code", limit: 6, comment: "ブランドコード"
    t.string "age", limit: 100, comment: "商品仕様_対象年齢"
    t.string "accessories", limit: 250, comment: "商品仕様_アクセサリー"
    t.string "award", limit: 250, comment: "商品仕様_受賞記録"
    t.string "factory", limit: 100, comment: "商品仕様_製造"
    t.string "other", limit: 100, comment: "商品仕様_その他"
    t.string "material", limit: 500, comment: "商品仕様_材質"
    t.string "origin", limit: 20, comment: "商品仕様_原産国"
    t.integer "read_time", limit: 3, precision: 3, comment: "リードタイム（日）"
    t.string "status", limit: 10, comment: "ステータス"
    t.string "change_note", limit: 200, comment: "変更リマーク"
    t.string "ch_end_date", limit: 8, comment: "不明"
    t.string "all_kana_name", limit: 100, comment: "カナ名（全）"
    t.string "package", limit: 200, comment: "パッケージ"
  end

  create_table "mst_item_171116154700", id: false, comment: "商品基本情報", force: :cascade do |t|
    t.string "item_code", limit: 25, null: false, comment: "商品コード"
    t.string "genre_code", limit: 2, comment: "ジャンルコード"
    t.string "item_name", limit: 100, comment: "商品名"
    t.string "standard", limit: 100, comment: "規格"
    t.string "kana_name", limit: 100, comment: "カナ名称"
    t.string "eng_name", limit: 100, comment: "英語表記名"
    t.string "jan1", limit: 15, comment: "JAN_1"
    t.string "jan2", limit: 15, comment: "JAN_2"
    t.string "maker_item_code", limit: 30, comment: "メーカー品番"
    t.string "vender", limit: 100, comment: "ベンダー"
    t.decimal "retail", precision: 8, scale: 2, comment: "定価（上代）"
    t.string "moq", limit: 20, comment: "最小発注数"
    t.string "currency_code1", limit: 3, comment: "情報1_通貨コード"
    t.string "shipping_term_fob1", limit: 20, comment: "情報1_FOB対象国"
    t.decimal "shipping_term_price1", precision: 8, scale: 2, comment: "情報1_通貨（FOB）"
    t.decimal "price1", precision: 8, scale: 2, comment: "情報1_仕入値"
    t.decimal "cost_rate1", precision: 4, scale: 3, comment: "情報1_原価率"
    t.string "currency_code2", limit: 3, comment: "情報2_通貨コード"
    t.string "shipping_term_fob2", limit: 20, comment: "情報2_FOB対象国"
    t.decimal "shipping_term_price2", precision: 8, scale: 2, comment: "情報2_通貨（FOB）"
    t.decimal "price2", precision: 8, scale: 2, comment: "情報2_仕入値"
    t.decimal "cost_rate2", precision: 4, scale: 3, comment: "情報2_原価率"
    t.string "oem", limit: 30, comment: "OEM"
    t.string "order_note", limit: 50, comment: "発注コメント"
    t.string "supplier_code", limit: 10, comment: "仕入先コード"
    t.string "supplier_name", limit: 60, comment: "仕入先名"
    t.string "launch_schedule", limit: 10, comment: "展開時期"
    t.string "maker_code", limit: 5, comment: "メーカーコード"
    t.string "maker_location", limit: 5, comment: "場所"
    t.string "brand_code", limit: 6, comment: "ブランドコード"
    t.string "age", limit: 100, comment: "商品仕様_対象年齢"
    t.string "accessories", limit: 250, comment: "商品仕様_アクセサリー"
    t.string "award", limit: 250, comment: "商品仕様_受賞記録"
    t.string "factory", limit: 100, comment: "商品仕様_製造"
    t.string "other", limit: 100, comment: "商品仕様_その他"
    t.string "material", limit: 500, comment: "商品仕様_材質"
    t.string "origin", limit: 20, comment: "商品仕様_原産国"
    t.integer "read_time", limit: 3, precision: 3, comment: "リードタイム（日）"
    t.string "status", limit: 10, comment: "ステータス"
    t.string "change_note", limit: 200, comment: "変更リマーク"
    t.string "ch_end_date", limit: 8, comment: "不明"
    t.string "all_kana_name", limit: 100, comment: "カナ名（全）"
    t.string "package", limit: 200, comment: "パッケージ"
  end

  create_table "mst_item_171117", id: false, comment: "商品基本情報", force: :cascade do |t|
    t.string "item_code", limit: 25, null: false, comment: "商品コード"
    t.string "genre_code", limit: 2, comment: "ジャンルコード"
    t.string "item_name", limit: 100, comment: "商品名"
    t.string "standard", limit: 100, comment: "規格"
    t.string "kana_name", limit: 100, comment: "カナ名称"
    t.string "eng_name", limit: 100, comment: "英語表記名"
    t.string "jan1", limit: 15, comment: "JAN_1"
    t.string "jan2", limit: 15, comment: "JAN_2"
    t.string "maker_item_code", limit: 30, comment: "メーカー品番"
    t.string "vender", limit: 100, comment: "ベンダー"
    t.decimal "retail", precision: 8, scale: 2, comment: "定価（上代）"
    t.string "moq", limit: 20, comment: "最小発注数"
    t.string "currency_code1", limit: 3, comment: "情報1_通貨コード"
    t.string "shipping_term_fob1", limit: 20, comment: "情報1_FOB対象国"
    t.decimal "shipping_term_price1", precision: 8, scale: 2, comment: "情報1_通貨（FOB）"
    t.decimal "price1", precision: 8, scale: 2, comment: "情報1_仕入値"
    t.decimal "cost_rate1", precision: 4, scale: 3, comment: "情報1_原価率"
    t.string "currency_code2", limit: 3, comment: "情報2_通貨コード"
    t.string "shipping_term_fob2", limit: 20, comment: "情報2_FOB対象国"
    t.decimal "shipping_term_price2", precision: 8, scale: 2, comment: "情報2_通貨（FOB）"
    t.decimal "price2", precision: 8, scale: 2, comment: "情報2_仕入値"
    t.decimal "cost_rate2", precision: 4, scale: 3, comment: "情報2_原価率"
    t.string "oem", limit: 30, comment: "OEM"
    t.string "order_note", limit: 50, comment: "発注コメント"
    t.string "supplier_code", limit: 10, comment: "仕入先コード"
    t.string "supplier_name", limit: 60, comment: "仕入先名"
    t.string "launch_schedule", limit: 10, comment: "展開時期"
    t.string "maker_code", limit: 5, comment: "メーカーコード"
    t.string "maker_location", limit: 5, comment: "場所"
    t.string "brand_code", limit: 6, comment: "ブランドコード"
    t.string "age", limit: 100, comment: "商品仕様_対象年齢"
    t.string "accessories", limit: 250, comment: "商品仕様_アクセサリー"
    t.string "award", limit: 250, comment: "商品仕様_受賞記録"
    t.string "factory", limit: 100, comment: "商品仕様_製造"
    t.string "other", limit: 100, comment: "商品仕様_その他"
    t.string "material", limit: 500, comment: "商品仕様_材質"
    t.string "origin", limit: 20, comment: "商品仕様_原産国"
    t.integer "read_time", limit: 3, precision: 3, comment: "リードタイム（日）"
    t.string "status", limit: 10, comment: "ステータス"
    t.string "change_note", limit: 200, comment: "変更リマーク"
    t.string "ch_end_date", limit: 8, comment: "不明"
    t.string "all_kana_name", limit: 100, comment: "カナ名（全）"
    t.string "package", limit: 200, comment: "パッケージ"
  end

  create_table "mst_item_direct", id: false, comment: "TenpoViser商品マスタ", force: :cascade do |t|
    t.string "corp_code", limit: 10, comment: "会社コード"
    t.string "store_code", limit: 10, comment: "店舗コード"
    t.string "section_code", limit: 5, comment: "部門No"
    t.string "item_code", limit: 15, comment: "商品コード"
    t.string "jan_code", limit: 15, comment: "ＪＡＮコード"
    t.string "barcode", limit: 15, comment: "バーコード"
    t.string "instore_code", limit: 15, comment: "インストアコード"
    t.integer "junne_sub", limit: 3, precision: 3, comment: "ジャンルサブ"
    t.string "item_name", limit: 100, comment: "商品名"
    t.string "item_name_kana", limit: 100, comment: "商品名カナ"
    t.string "item_name_sub", limit: 100, comment: "商品名サブ"
    t.string "item_name_sub_kana", limit: 100, comment: "商品名サブカナ"
    t.string "model_no1", limit: 15, comment: "型番１"
    t.string "model_no2", limit: 15, comment: "型番２"
    t.string "tana_no", limit: 3, comment: "棚番"
    t.string "release_date", limit: 20, comment: "発売日"
    t.string "reg_date", limit: 20, comment: "登録日"
    t.string "price_setting_date", limit: 20, comment: "価格設定日"
    t.decimal "price1", precision: 8, scale: 2, comment: "金額１（定価）"
    t.decimal "price2", precision: 8, scale: 2, comment: "金額２"
    t.decimal "price3", precision: 8, scale: 2, comment: "金額３（仕入値）"
    t.decimal "price4", precision: 8, scale: 2, comment: "金額４（売値_税抜）"
    t.decimal "price5", precision: 8, scale: 2, comment: "金額５"
    t.decimal "price6", precision: 8, scale: 2, comment: "金額６"
    t.decimal "price7", precision: 8, scale: 2, comment: "金額７"
    t.decimal "price8", precision: 8, scale: 2, comment: "金額８"
    t.decimal "price9", precision: 8, scale: 2, comment: "金額９"
    t.decimal "price10", precision: 8, scale: 2, comment: "金額１０（売値_税込）"
    t.decimal "nulti_price", precision: 8, scale: 2, comment: "複数単価数"
    t.string "condition", limit: 20, comment: "品状態"
    t.decimal "capacity", precision: 8, scale: 2, comment: "容量"
    t.string "maker", limit: 50, comment: "メーカー"
    t.string "item_rank", limit: 10, comment: "ランク"
    t.integer "barcodes_issue", limit: 3, precision: 3, comment: "バーコード発行数"
    t.string "union_flag", limit: 1, comment: "合併フラグ"
    t.string "zei_syunetu", limit: 3, comment: "税種別"
    t.integer "unique_point", limit: 8, precision: 8, comment: "固有ポイント"
    t.string "product_source", limit: 50, comment: "仕入先"
    t.string "property", limit: 10, comment: "使用属性"
    t.string "unit", limit: 10, comment: "単位"
    t.string "stock_flag", limit: 1, comment: "単位管理フラグ"
    t.string "reserve_flag", limit: 1, comment: "予備フラグ"
    t.string "point_flag", limit: 1, comment: "ポイント付加フラグ"
    t.string "order_flag", limit: 1, comment: "発注フラグ"
    t.integer "order_point", limit: 4, precision: 4, comment: "発注点"
    t.string "deal", limit: 50, comment: "条件"
    t.string "reserve1", limit: 50, comment: "予備１"
    t.string "operation", limit: 50, comment: "操作処理"
    t.string "kiridashi_date", limit: 20, comment: "切出日時"
    t.string "update_date", limit: 20, comment: "更新日時"
    t.string "shop_code", limit: 20, comment: "店コード"
    t.string "category1", limit: 20, comment: "カテゴリー１"
    t.string "category2", limit: 20, comment: "カテゴリー２"
    t.string "category3", limit: 20, comment: "カテゴリー３"
    t.string "category4", limit: 20, comment: "カテゴリー４"
    t.string "category5", limit: 20, comment: "カテゴリー５"
    t.string "category6", limit: 20, comment: "カテゴリー６"
  end

  create_table "mst_item_incidental1", primary_key: "item_code", id: :string, limit: 25, comment: "商品コード", comment: "商品仕様", force: :cascade do |t|
    t.string "item_size", limit: 25, comment: "サイズ（Ｗ×Ｄ×Ｈ）"
    t.decimal "weight", precision: 8, scale: 2, default: "0.0", comment: "重量（ｇ）"
    t.string "package_size", limit: 25, comment: "パッケージサイズ（Ｗ×Ｄ×Ｈ）"
    t.decimal "package_weight", precision: 8, scale: 2, default: "0.0", comment: "パッケージ重量（ｇ）"
    t.string "size_note", limit: 700, comment: "サイズ追記（備考）"
    t.string "p_box_window_open", limit: 2, comment: "BOX WINDOW OPEN(0:× 1:○)"
    t.string "p_box_window_closed", limit: 2, comment: "BOX WINDOW CLOSED(0:× 1:○)"
    t.string "p_huck", limit: 2, comment: "ホック(0:× 1:○)"
    t.string "p_tag", limit: 2, comment: "タグ(0:× 1:○)"
    t.string "p_hanger", limit: 2, comment: "ハンガー(0:× 1:○)"
    t.string "p_board", limit: 2, comment: "台紙(0:× 1:○)"
    t.string "p_pvc_bag", limit: 2, comment: "PVC バッグ(0:× 1:○)"
    t.string "p_pp", limit: 2, comment: "PP袋(0:× 1:○)"
    t.string "p_seal", limit: 2, comment: "パッケージシール(0:× 1:○)"
    t.string "p_blister_bag", limit: 2, comment: "ブリスターバッグ(0:× 1:○)"
    t.string "p_clear_box", limit: 2, comment: "クリアーボックス(0:× 1:○)"
    t.string "p_header_book", limit: 2, comment: "ヘッダーブック(0:× 1:○)"
    t.string "p_shrink", limit: 2, comment: "シュリンクパッケージ(0:× 1:○)"
    t.string "p_insulating_tape", limit: 2, comment: "絶縁テープ(0:× 1:○)"
    t.string "p_other", limit: 40, comment: "その他"
    t.string "p_header", limit: 2, comment: "ヘッダ(0:× 1:○)"
    t.string "battery1", limit: 50, comment: "使用電池型1(国内仕様)&個数"
    t.string "battery2", limit: 20, comment: "使用電池型2(国内仕様)&個数"
    t.string "item_discription", limit: 4000, comment: "本体説明"
    t.string "usage", limit: 4000, comment: "使用方法"
    t.string "care", limit: 4000, comment: "お手入れ方法"
    t.string "detailed_item_description", limit: 1500, comment: "その他説明"
    t.string "caution", limit: 4000, comment: "注意事項"
    t.string "description_path", limit: 100, comment: "取説等のファイルパス"
    t.string "description_path2", limit: 100, comment: "取説等のファイルパス2"
    t.integer "inner_carton", limit: 3, precision: 3, default: 0, comment: "入数：個装（内箱）"
    t.decimal "outer_carton", precision: 7, scale: 4, default: "0.0", comment: "入数：内箱（外箱）"
    t.string "inner_size", limit: 12, comment: "内箱サイズ(Ｗ×Ｄ×Ｈ) カートン"
    t.decimal "inner_weight", precision: 8, scale: 2, default: "0.0", comment: "内箱サイズ(ｇ) カートン"
    t.string "outer_size", limit: 25, comment: "外箱サイズ(Ｗ×Ｄ×Ｈ) カートン"
    t.decimal "outer_weight", precision: 8, scale: 2, default: "0.0", comment: "外箱サイズ(Ｇ) カートン"
    t.string "arreangement", limit: 20, comment: "国内パッケージ対応"
    t.string "pkg_pvc", limit: 12, comment: "PVCパッケージ使用状況"
    t.string "sales_point", limit: 200, comment: "セールスポイント"
  end

  create_table "mst_item_incidental1_170221", id: false, comment: "商品仕様", force: :cascade do |t|
    t.string "item_code", limit: 25, null: false, comment: "商品コード"
    t.string "item_size", limit: 25, comment: "サイズ（Ｗ×Ｄ×Ｈ）"
    t.decimal "weight", precision: 8, scale: 2, default: "0.0", comment: "重量（ｇ）"
    t.string "package_size", limit: 25, comment: "パッケージサイズ（Ｗ×Ｄ×Ｈ）"
    t.decimal "package_weight", precision: 8, scale: 2, default: "0.0", comment: "パッケージ重量（ｇ）"
    t.string "size_note", limit: 350, comment: "サイズ追記（備考）"
    t.string "p_box_window_open", limit: 2, comment: "BOX WINDOW OPEN(0:× 1:○)"
    t.string "p_box_window_closed", limit: 2, comment: "BOX WINDOW CLOSED(0:× 1:○)"
    t.string "p_huck", limit: 2, comment: "ホック(0:× 1:○)"
    t.string "p_tag", limit: 2, comment: "タグ(0:× 1:○)"
    t.string "p_hanger", limit: 2, comment: "ハンガー(0:× 1:○)"
    t.string "p_board", limit: 2, comment: "台紙(0:× 1:○)"
    t.string "p_pvc_bag", limit: 2, comment: "PVC バッグ(0:× 1:○)"
    t.string "p_pp", limit: 2, comment: "PP袋(0:× 1:○)"
    t.string "p_seal", limit: 2, comment: "パッケージシール(0:× 1:○)"
    t.string "p_blister_bag", limit: 2, comment: "ブリスターバッグ(0:× 1:○)"
    t.string "p_clear_box", limit: 2, comment: "クリアーボックス(0:× 1:○)"
    t.string "p_header_book", limit: 2, comment: "ヘッダーブック(0:× 1:○)"
    t.string "p_shrink", limit: 2, comment: "シュリンクパッケージ(0:× 1:○)"
    t.string "p_insulating_tape", limit: 2, comment: "絶縁テープ(0:× 1:○)"
    t.string "p_other", limit: 40, comment: "その他"
    t.string "p_header", limit: 2, comment: "ヘッダ(0:× 1:○)"
    t.string "battery1", limit: 20, comment: "使用電池型1(国内仕様)&個数"
    t.string "battery2", limit: 20, comment: "使用電池型2(国内仕様)&個数"
    t.string "item_discription", limit: 4000, comment: "本体説明"
    t.string "usage", limit: 4000, comment: "使用方法"
    t.string "care", limit: 4000, comment: "お手入れ方法"
    t.string "detailed_item_description", limit: 1100, comment: "その他説明"
    t.string "caution", limit: 4000, comment: "注意事項"
    t.string "description_path", limit: 100, comment: "取説等のファイルパス"
    t.string "description_path2", limit: 100, comment: "取説等のファイルパス2"
    t.integer "inner_carton", limit: 3, precision: 3, default: 0, comment: "入数：個装（内箱）"
    t.integer "outer_carton", limit: 3, precision: 3, default: 0, comment: "入数：内箱（外箱）"
    t.string "inner_size", limit: 12, comment: "内箱サイズ(Ｗ×Ｄ×Ｈ) カートン"
    t.decimal "inner_weight", precision: 8, scale: 2, default: "0.0", comment: "内箱サイズ(ｇ) カートン"
    t.string "outer_size", limit: 15, comment: "外箱サイズ(Ｗ×Ｄ×Ｈ) カートン"
    t.decimal "outer_weight", precision: 8, scale: 2, default: "0.0", comment: "外箱サイズ(Ｇ) カートン"
    t.string "arreangement", limit: 20, comment: "国内パッケージ対応"
    t.string "pkg_pvc", limit: 12, comment: "PVCパッケージ使用状況"
    t.string "sales_point", limit: 200, comment: "セールスポイント"
  end

  create_table "mst_item_incidental1_170317", id: false, force: :cascade do |t|
    t.string "item_code", limit: 25, null: false
    t.string "item_size", limit: 25
    t.decimal "weight", precision: 8, scale: 2
    t.string "package_size", limit: 25
    t.decimal "package_weight", precision: 8, scale: 2
    t.string "size_note", limit: 350
    t.string "p_box_window_open", limit: 2
    t.string "p_box_window_closed", limit: 2
    t.string "p_huck", limit: 2
    t.string "p_tag", limit: 2
    t.string "p_hanger", limit: 2
    t.string "p_board", limit: 2
    t.string "p_pvc_bag", limit: 2
    t.string "p_pp", limit: 2
    t.string "p_seal", limit: 2
    t.string "p_blister_bag", limit: 2
    t.string "p_clear_box", limit: 2
    t.string "p_header_book", limit: 2
    t.string "p_shrink", limit: 2
    t.string "p_insulating_tape", limit: 2
    t.string "p_other", limit: 40
    t.string "p_header", limit: 2
    t.string "battery1", limit: 20
    t.string "battery2", limit: 20
    t.string "item_discription", limit: 4000
    t.string "usage", limit: 4000
    t.string "care", limit: 4000
    t.string "detailed_item_description", limit: 1100
    t.string "caution", limit: 4000
    t.string "description_path", limit: 100
    t.string "description_path2", limit: 100
    t.integer "inner_carton", limit: 3, precision: 3
    t.integer "outer_carton", limit: 3, precision: 3
    t.string "inner_size", limit: 12
    t.decimal "inner_weight", precision: 8, scale: 2
    t.string "outer_size", limit: 15
    t.decimal "outer_weight", precision: 8, scale: 2
    t.string "arreangement", limit: 20
    t.string "pkg_pvc", limit: 12
    t.string "sales_point", limit: 200
  end

  create_table "mst_item_incidental1_170725", id: false, comment: "商品仕様", force: :cascade do |t|
    t.string "item_code", limit: 25, null: false, comment: "商品コード"
    t.string "item_size", limit: 25, comment: "サイズ（Ｗ×Ｄ×Ｈ）"
    t.decimal "weight", precision: 8, scale: 2, default: "0.0", comment: "重量（ｇ）"
    t.string "package_size", limit: 25, comment: "パッケージサイズ（Ｗ×Ｄ×Ｈ）"
    t.decimal "package_weight", precision: 8, scale: 2, default: "0.0", comment: "パッケージ重量（ｇ）"
    t.string "size_note", limit: 350, comment: "サイズ追記（備考）"
    t.string "p_box_window_open", limit: 2, comment: "BOX WINDOW OPEN(0:× 1:○)"
    t.string "p_box_window_closed", limit: 2, comment: "BOX WINDOW CLOSED(0:× 1:○)"
    t.string "p_huck", limit: 2, comment: "ホック(0:× 1:○)"
    t.string "p_tag", limit: 2, comment: "タグ(0:× 1:○)"
    t.string "p_hanger", limit: 2, comment: "ハンガー(0:× 1:○)"
    t.string "p_board", limit: 2, comment: "台紙(0:× 1:○)"
    t.string "p_pvc_bag", limit: 2, comment: "PVC バッグ(0:× 1:○)"
    t.string "p_pp", limit: 2, comment: "PP袋(0:× 1:○)"
    t.string "p_seal", limit: 2, comment: "パッケージシール(0:× 1:○)"
    t.string "p_blister_bag", limit: 2, comment: "ブリスターバッグ(0:× 1:○)"
    t.string "p_clear_box", limit: 2, comment: "クリアーボックス(0:× 1:○)"
    t.string "p_header_book", limit: 2, comment: "ヘッダーブック(0:× 1:○)"
    t.string "p_shrink", limit: 2, comment: "シュリンクパッケージ(0:× 1:○)"
    t.string "p_insulating_tape", limit: 2, comment: "絶縁テープ(0:× 1:○)"
    t.string "p_other", limit: 40, comment: "その他"
    t.string "p_header", limit: 2, comment: "ヘッダ(0:× 1:○)"
    t.string "battery1", limit: 20, comment: "使用電池型1(国内仕様)&個数"
    t.string "battery2", limit: 20, comment: "使用電池型2(国内仕様)&個数"
    t.string "item_discription", limit: 4000, comment: "本体説明"
    t.string "usage", limit: 4000, comment: "使用方法"
    t.string "care", limit: 4000, comment: "お手入れ方法"
    t.string "detailed_item_description", limit: 1100, comment: "その他説明"
    t.string "caution", limit: 4000, comment: "注意事項"
    t.string "description_path", limit: 100, comment: "取説等のファイルパス"
    t.string "description_path2", limit: 100, comment: "取説等のファイルパス2"
    t.integer "inner_carton", limit: 3, precision: 3, default: 0, comment: "入数：個装（内箱）"
    t.integer "outer_carton", limit: 3, precision: 3, default: 0, comment: "入数：内箱（外箱）"
    t.string "inner_size", limit: 12, comment: "内箱サイズ(Ｗ×Ｄ×Ｈ) カートン"
    t.decimal "inner_weight", precision: 8, scale: 2, default: "0.0", comment: "内箱サイズ(ｇ) カートン"
    t.string "outer_size", limit: 15, comment: "外箱サイズ(Ｗ×Ｄ×Ｈ) カートン"
    t.decimal "outer_weight", precision: 8, scale: 2, default: "0.0", comment: "外箱サイズ(Ｇ) カートン"
    t.string "arreangement", limit: 20, comment: "国内パッケージ対応"
    t.string "pkg_pvc", limit: 12, comment: "PVCパッケージ使用状況"
    t.string "sales_point", limit: 200, comment: "セールスポイント"
  end

  create_table "mst_item_incidental1_171116", id: false, comment: "商品仕様", force: :cascade do |t|
    t.string "item_code", limit: 25, null: false, comment: "商品コード"
    t.string "item_size", limit: 25, comment: "サイズ（Ｗ×Ｄ×Ｈ）"
    t.decimal "weight", precision: 8, scale: 2, default: "0.0", comment: "重量（ｇ）"
    t.string "package_size", limit: 25, comment: "パッケージサイズ（Ｗ×Ｄ×Ｈ）"
    t.decimal "package_weight", precision: 8, scale: 2, default: "0.0", comment: "パッケージ重量（ｇ）"
    t.string "size_note", limit: 350, comment: "サイズ追記（備考）"
    t.string "p_box_window_open", limit: 2, comment: "BOX WINDOW OPEN(0:× 1:○)"
    t.string "p_box_window_closed", limit: 2, comment: "BOX WINDOW CLOSED(0:× 1:○)"
    t.string "p_huck", limit: 2, comment: "ホック(0:× 1:○)"
    t.string "p_tag", limit: 2, comment: "タグ(0:× 1:○)"
    t.string "p_hanger", limit: 2, comment: "ハンガー(0:× 1:○)"
    t.string "p_board", limit: 2, comment: "台紙(0:× 1:○)"
    t.string "p_pvc_bag", limit: 2, comment: "PVC バッグ(0:× 1:○)"
    t.string "p_pp", limit: 2, comment: "PP袋(0:× 1:○)"
    t.string "p_seal", limit: 2, comment: "パッケージシール(0:× 1:○)"
    t.string "p_blister_bag", limit: 2, comment: "ブリスターバッグ(0:× 1:○)"
    t.string "p_clear_box", limit: 2, comment: "クリアーボックス(0:× 1:○)"
    t.string "p_header_book", limit: 2, comment: "ヘッダーブック(0:× 1:○)"
    t.string "p_shrink", limit: 2, comment: "シュリンクパッケージ(0:× 1:○)"
    t.string "p_insulating_tape", limit: 2, comment: "絶縁テープ(0:× 1:○)"
    t.string "p_other", limit: 40, comment: "その他"
    t.string "p_header", limit: 2, comment: "ヘッダ(0:× 1:○)"
    t.string "battery1", limit: 20, comment: "使用電池型1(国内仕様)&個数"
    t.string "battery2", limit: 20, comment: "使用電池型2(国内仕様)&個数"
    t.string "item_discription", limit: 4000, comment: "本体説明"
    t.string "usage", limit: 4000, comment: "使用方法"
    t.string "care", limit: 4000, comment: "お手入れ方法"
    t.string "detailed_item_description", limit: 1100, comment: "その他説明"
    t.string "caution", limit: 4000, comment: "注意事項"
    t.string "description_path", limit: 100, comment: "取説等のファイルパス"
    t.string "description_path2", limit: 100, comment: "取説等のファイルパス2"
    t.integer "inner_carton", limit: 3, precision: 3, default: 0, comment: "入数：個装（内箱）"
    t.integer "outer_carton", limit: 3, precision: 3, default: 0, comment: "入数：内箱（外箱）"
    t.string "inner_size", limit: 12, comment: "内箱サイズ(Ｗ×Ｄ×Ｈ) カートン"
    t.decimal "inner_weight", precision: 8, scale: 2, default: "0.0", comment: "内箱サイズ(ｇ) カートン"
    t.string "outer_size", limit: 15, comment: "外箱サイズ(Ｗ×Ｄ×Ｈ) カートン"
    t.decimal "outer_weight", precision: 8, scale: 2, default: "0.0", comment: "外箱サイズ(Ｇ) カートン"
    t.string "arreangement", limit: 20, comment: "国内パッケージ対応"
    t.string "pkg_pvc", limit: 12, comment: "PVCパッケージ使用状況"
    t.string "sales_point", limit: 200, comment: "セールスポイント"
  end

  create_table "mst_item_incidental1_180206", id: false, comment: "商品仕様", force: :cascade do |t|
    t.string "item_code", limit: 25, null: false, comment: "商品コード"
    t.string "item_size", limit: 25, comment: "サイズ（Ｗ×Ｄ×Ｈ）"
    t.decimal "weight", precision: 8, scale: 2, default: "0.0", comment: "重量（ｇ）"
    t.string "package_size", limit: 25, comment: "パッケージサイズ（Ｗ×Ｄ×Ｈ）"
    t.decimal "package_weight", precision: 8, scale: 2, default: "0.0", comment: "パッケージ重量（ｇ）"
    t.string "size_note", limit: 350, comment: "サイズ追記（備考）"
    t.string "p_box_window_open", limit: 2, comment: "BOX WINDOW OPEN(0:× 1:○)"
    t.string "p_box_window_closed", limit: 2, comment: "BOX WINDOW CLOSED(0:× 1:○)"
    t.string "p_huck", limit: 2, comment: "ホック(0:× 1:○)"
    t.string "p_tag", limit: 2, comment: "タグ(0:× 1:○)"
    t.string "p_hanger", limit: 2, comment: "ハンガー(0:× 1:○)"
    t.string "p_board", limit: 2, comment: "台紙(0:× 1:○)"
    t.string "p_pvc_bag", limit: 2, comment: "PVC バッグ(0:× 1:○)"
    t.string "p_pp", limit: 2, comment: "PP袋(0:× 1:○)"
    t.string "p_seal", limit: 2, comment: "パッケージシール(0:× 1:○)"
    t.string "p_blister_bag", limit: 2, comment: "ブリスターバッグ(0:× 1:○)"
    t.string "p_clear_box", limit: 2, comment: "クリアーボックス(0:× 1:○)"
    t.string "p_header_book", limit: 2, comment: "ヘッダーブック(0:× 1:○)"
    t.string "p_shrink", limit: 2, comment: "シュリンクパッケージ(0:× 1:○)"
    t.string "p_insulating_tape", limit: 2, comment: "絶縁テープ(0:× 1:○)"
    t.string "p_other", limit: 40, comment: "その他"
    t.string "p_header", limit: 2, comment: "ヘッダ(0:× 1:○)"
    t.string "battery1", limit: 20, comment: "使用電池型1(国内仕様)&個数"
    t.string "battery2", limit: 20, comment: "使用電池型2(国内仕様)&個数"
    t.string "item_discription", limit: 4000, comment: "本体説明"
    t.string "usage", limit: 4000, comment: "使用方法"
    t.string "care", limit: 4000, comment: "お手入れ方法"
    t.string "detailed_item_description", limit: 1100, comment: "その他説明"
    t.string "caution", limit: 4000, comment: "注意事項"
    t.string "description_path", limit: 100, comment: "取説等のファイルパス"
    t.string "description_path2", limit: 100, comment: "取説等のファイルパス2"
    t.integer "inner_carton", limit: 3, precision: 3, default: 0, comment: "入数：個装（内箱）"
    t.integer "outer_carton", limit: 3, precision: 3, default: 0, comment: "入数：内箱（外箱）"
    t.string "inner_size", limit: 12, comment: "内箱サイズ(Ｗ×Ｄ×Ｈ) カートン"
    t.decimal "inner_weight", precision: 8, scale: 2, default: "0.0", comment: "内箱サイズ(ｇ) カートン"
    t.string "outer_size", limit: 15, comment: "外箱サイズ(Ｗ×Ｄ×Ｈ) カートン"
    t.decimal "outer_weight", precision: 8, scale: 2, default: "0.0", comment: "外箱サイズ(Ｇ) カートン"
    t.string "arreangement", limit: 20, comment: "国内パッケージ対応"
    t.string "pkg_pvc", limit: 12, comment: "PVCパッケージ使用状況"
    t.string "sales_point", limit: 200, comment: "セールスポイント"
  end

  create_table "mst_item_incidental2", primary_key: "item_code", id: :string, limit: 25, comment: "商品コード", comment: "検品結果及び基準", force: :cascade do |t|
    t.string "safe_standerd_jpn1", limit: 100, comment: "適合規格国内１"
    t.string "safe_standerd_jpn2", limit: 100, comment: "適合規格国内２"
    t.string "safe_standerd_ext1", limit: 100, comment: "適合規格海外１"
    t.string "safe_standerd_ext2", limit: 100, comment: "適合規格海外２"
    t.string "chk_foods_flag", limit: 1, comment: "(非表示)食品検査必要・不要(0:不要 1:必要)"
    t.string "chk_foods_date", limit: 10, comment: "食品検査完了日"
    t.string "chk_formalin", limit: 1, comment: "(非表示)ホルマリン必要・不要(0:不要 1:必要)"
    t.string "inspection_standard", limit: 20, comment: "(廃止)検品方法(廃止→海外検品、国内検品に移行)"
    t.string "needle_detection", limit: 300, comment: "検針方法"
    t.string "chk_formalin_date", limit: 10, comment: "ホルマリン検査完了日"
    t.string "kaigai_kenpin", limit: 300, comment: "海外検品"
    t.string "kokunai_kenpin", limit: 300, comment: "国内検品"
    t.string "tokkijikou", limit: 500, comment: "検品・検針・特記事項"
    t.string "kobetu_kakunin_01", limit: 250, comment: "個別確認01"
    t.string "kobetu_kakunin_02", limit: 250, comment: "個別確認02"
    t.string "kobetu_kakunin_03", limit: 250, comment: "個別確認03"
    t.string "kobetu_kakunin_04", limit: 250, comment: "個別確認04"
    t.string "kobetu_kakunin_05", limit: 250, comment: "個別確認05"
    t.string "kobetu_kakunin_06", limit: 250, comment: "個別確認06"
    t.string "kobetu_kakunin_07", limit: 250, comment: "個別確認07"
    t.string "kobetu_kakunin_08", limit: 250, comment: "個別確認08"
    t.string "kobetu_kakunin_09", limit: 250, comment: "個別確認09"
    t.string "kobetu_kakunin_10", limit: 250, comment: "個別確認10"
    t.string "kakunin_houhou_01", limit: 30, comment: "確認方法01"
    t.string "kakunin_houhou_02", limit: 30, comment: "確認方法02"
    t.string "kakunin_houhou_03", limit: 30, comment: "確認方法03"
    t.string "kakunin_houhou_04", limit: 30, comment: "確認方法04"
    t.string "kakunin_houhou_05", limit: 30, comment: "確認方法05"
    t.string "kakunin_houhou_06", limit: 30, comment: "確認方法06"
    t.string "kakunin_houhou_07", limit: 30, comment: "確認方法07"
    t.string "kakunin_houhou_08", limit: 30, comment: "確認方法08"
    t.string "kakunin_houhou_09", limit: 30, comment: "確認方法09"
    t.string "kakunin_houhou_10", limit: 30, comment: "確認方法10"
    t.string "kaiji_flg_01", limit: 10, comment: "開示フラグ"
    t.string "logi_memo", limit: 500, comment: "Logiメモ"
    t.string "kpn_update_date", limit: 10, comment: "検品基準書_更新日付"
    t.string "kobetu_kakunin_eng_01", limit: 500, comment: "個別確認(英語)01"
    t.string "kobetu_kakunin_eng_02", limit: 500, comment: "個別確認(英語)02"
    t.string "kobetu_kakunin_eng_03", limit: 500, comment: "個別確認(英語)03"
    t.string "kobetu_kakunin_eng_04", limit: 500, comment: "個別確認(英語)04"
    t.string "kobetu_kakunin_eng_05", limit: 500, comment: "個別確認(英語)05"
    t.string "kobetu_kakunin_eng_06", limit: 500, comment: "個別確認(英語)06"
    t.string "kobetu_kakunin_eng_07", limit: 500, comment: "個別確認(英語)07"
    t.string "kobetu_kakunin_eng_08", limit: 500, comment: "個別確認(英語)08"
    t.string "kobetu_kakunin_eng_09", limit: 500, comment: "個別確認(英語)09"
    t.string "kobetu_kakunin_eng_10", limit: 500, comment: "個別確認(英語)10"
    t.string "kakunin_houhou_eng_01", limit: 100, comment: "確認方法(英語)01"
    t.string "kakunin_houhou_eng_02", limit: 100, comment: "確認方法(英語)02"
    t.string "kakunin_houhou_eng_03", limit: 100, comment: "確認方法(英語)03"
    t.string "kakunin_houhou_eng_04", limit: 100, comment: "確認方法(英語)04"
    t.string "kakunin_houhou_eng_05", limit: 100, comment: "確認方法(英語)05"
    t.string "kakunin_houhou_eng_06", limit: 100, comment: "確認方法(英語)06"
    t.string "kakunin_houhou_eng_07", limit: 100, comment: "確認方法(英語)07"
    t.string "kakunin_houhou_eng_08", limit: 100, comment: "確認方法(英語)08"
    t.string "kakunin_houhou_eng_09", limit: 100, comment: "確認方法(英語)09"
    t.string "kakunin_houhou_eng_10", limit: 100, comment: "確認方法(英語)10"
    t.string "kaigai_kenpin_eng", limit: 300, comment: "海外検品(英語)"
    t.string "kokunai_kenpin_eng", limit: 300, comment: "国内検品(英語)"
    t.string "needle_detection_eng", limit: 300, comment: "検針方法(英語)"
    t.string "tokkijikou_eng", limit: 500, comment: "検品・検針・特記事項(英語)"
    t.string "kpn_update_date_eng", limit: 10, comment: "検品基準書_更新日付(英語)"
    t.string "kenshin_id", limit: 15, comment: "検針ID"
    t.string "kenpin_id", limit: 15, comment: "検品ID"
  end

  create_table "mst_item_incidental2_160817", id: false, comment: "検品結果及び基準", force: :cascade do |t|
    t.string "item_code", limit: 25, null: false, comment: "商品コード"
    t.string "safe_standerd_jpn1", limit: 30, comment: "適合規格国内１"
    t.string "safe_standerd_jpn2", limit: 30, comment: "適合規格国内２"
    t.string "safe_standerd_ext1", limit: 30, comment: "適合規格海外１"
    t.string "safe_standerd_ext2", limit: 30, comment: "適合規格海外２"
    t.string "chk_foods_flag", limit: 1, comment: "(非表示)食品検査必要・不要(0:不要 1:必要)"
    t.string "chk_foods_date", limit: 10, comment: "食品検査完了日"
    t.string "chk_formalin", limit: 1, comment: "(非表示)ホルマリン必要・不要(0:不要 1:必要)"
    t.string "inspection_standard", limit: 20, comment: "(廃止)検品方法(廃止→海外検品、国内検品に移行)"
    t.string "needle_detection", limit: 300, comment: "検針方法"
    t.string "chk_formalin_date", limit: 10, comment: "ホルマリン検査完了日"
    t.string "kaigai_kenpin", limit: 300, comment: "海外検品"
    t.string "kokunai_kenpin", limit: 300, comment: "国内検品"
    t.string "tokkijikou", limit: 500, comment: "検品・検針・特記事項"
    t.string "kobetu_kakunin_01", limit: 250, comment: "個別確認01"
    t.string "kobetu_kakunin_02", limit: 250, comment: "個別確認02"
    t.string "kobetu_kakunin_03", limit: 250, comment: "個別確認03"
    t.string "kobetu_kakunin_04", limit: 250, comment: "個別確認04"
    t.string "kobetu_kakunin_05", limit: 250, comment: "個別確認05"
    t.string "kobetu_kakunin_06", limit: 250, comment: "個別確認06"
    t.string "kobetu_kakunin_07", limit: 250, comment: "個別確認07"
    t.string "kobetu_kakunin_08", limit: 250, comment: "個別確認08"
    t.string "kobetu_kakunin_09", limit: 250, comment: "個別確認09"
    t.string "kobetu_kakunin_10", limit: 250, comment: "個別確認10"
    t.string "kakunin_houhou_01", limit: 30, comment: "確認方法01"
    t.string "kakunin_houhou_02", limit: 30, comment: "確認方法02"
    t.string "kakunin_houhou_03", limit: 30, comment: "確認方法03"
    t.string "kakunin_houhou_04", limit: 30, comment: "確認方法04"
    t.string "kakunin_houhou_05", limit: 30, comment: "確認方法05"
    t.string "kakunin_houhou_06", limit: 30, comment: "確認方法06"
    t.string "kakunin_houhou_07", limit: 30, comment: "確認方法07"
    t.string "kakunin_houhou_08", limit: 30, comment: "確認方法08"
    t.string "kakunin_houhou_09", limit: 30, comment: "確認方法09"
    t.string "kakunin_houhou_10", limit: 30, comment: "確認方法10"
    t.string "kaiji_flg_01", limit: 10, comment: "開示フラグ"
    t.string "logi_memo", limit: 500, comment: "Logiメモ"
    t.string "kpn_update_date", limit: 10, comment: "検品基準書_更新日付"
    t.string "kobetu_kakunin_eng_01", limit: 500, comment: "個別確認(英語)01"
    t.string "kobetu_kakunin_eng_02", limit: 500, comment: "個別確認(英語)02"
    t.string "kobetu_kakunin_eng_03", limit: 500, comment: "個別確認(英語)03"
    t.string "kobetu_kakunin_eng_04", limit: 500, comment: "個別確認(英語)04"
    t.string "kobetu_kakunin_eng_05", limit: 500, comment: "個別確認(英語)05"
    t.string "kobetu_kakunin_eng_06", limit: 500, comment: "個別確認(英語)06"
    t.string "kobetu_kakunin_eng_07", limit: 500, comment: "個別確認(英語)07"
    t.string "kobetu_kakunin_eng_08", limit: 500, comment: "個別確認(英語)08"
    t.string "kobetu_kakunin_eng_09", limit: 500, comment: "個別確認(英語)09"
    t.string "kobetu_kakunin_eng_10", limit: 500, comment: "個別確認(英語)10"
    t.string "kakunin_houhou_eng_01", limit: 100, comment: "確認方法(英語)01"
    t.string "kakunin_houhou_eng_02", limit: 100, comment: "確認方法(英語)02"
    t.string "kakunin_houhou_eng_03", limit: 100, comment: "確認方法(英語)03"
    t.string "kakunin_houhou_eng_04", limit: 100, comment: "確認方法(英語)04"
    t.string "kakunin_houhou_eng_05", limit: 100, comment: "確認方法(英語)05"
    t.string "kakunin_houhou_eng_06", limit: 100, comment: "確認方法(英語)06"
    t.string "kakunin_houhou_eng_07", limit: 100, comment: "確認方法(英語)07"
    t.string "kakunin_houhou_eng_08", limit: 100, comment: "確認方法(英語)08"
    t.string "kakunin_houhou_eng_09", limit: 100, comment: "確認方法(英語)09"
    t.string "kakunin_houhou_eng_10", limit: 100, comment: "確認方法(英語)10"
    t.string "kaigai_kenpin_eng", limit: 300, comment: "海外検品(英語)"
    t.string "kokunai_kenpin_eng", limit: 300, comment: "国内検品(英語)"
    t.string "needle_detection_eng", limit: 300, comment: "検針方法(英語)"
    t.string "tokkijikou_eng", limit: 500, comment: "検品・検針・特記事項(英語)"
    t.string "kpn_update_date_eng", limit: 10, comment: "検品基準書_更新日付(英語)"
    t.string "kenshin_id", limit: 15, comment: "検針ID"
    t.string "kenpin_id", limit: 15, comment: "検品ID"
  end

  create_table "mst_item_incidental2_170317", id: false, force: :cascade do |t|
    t.string "item_code", limit: 25, null: false
    t.string "safe_standerd_jpn1", limit: 100
    t.string "safe_standerd_jpn2", limit: 100
    t.string "safe_standerd_ext1", limit: 100
    t.string "safe_standerd_ext2", limit: 100
    t.string "chk_foods_flag", limit: 1
    t.string "chk_foods_date", limit: 10
    t.string "chk_formalin", limit: 1
    t.string "inspection_standard", limit: 20
    t.string "needle_detection", limit: 300
    t.string "chk_formalin_date", limit: 10
    t.string "kaigai_kenpin", limit: 300
    t.string "kokunai_kenpin", limit: 300
    t.string "tokkijikou", limit: 500
    t.string "kobetu_kakunin_01", limit: 250
    t.string "kobetu_kakunin_02", limit: 250
    t.string "kobetu_kakunin_03", limit: 250
    t.string "kobetu_kakunin_04", limit: 250
    t.string "kobetu_kakunin_05", limit: 250
    t.string "kobetu_kakunin_06", limit: 250
    t.string "kobetu_kakunin_07", limit: 250
    t.string "kobetu_kakunin_08", limit: 250
    t.string "kobetu_kakunin_09", limit: 250
    t.string "kobetu_kakunin_10", limit: 250
    t.string "kakunin_houhou_01", limit: 30
    t.string "kakunin_houhou_02", limit: 30
    t.string "kakunin_houhou_03", limit: 30
    t.string "kakunin_houhou_04", limit: 30
    t.string "kakunin_houhou_05", limit: 30
    t.string "kakunin_houhou_06", limit: 30
    t.string "kakunin_houhou_07", limit: 30
    t.string "kakunin_houhou_08", limit: 30
    t.string "kakunin_houhou_09", limit: 30
    t.string "kakunin_houhou_10", limit: 30
    t.string "kaiji_flg_01", limit: 10
    t.string "logi_memo", limit: 500
    t.string "kpn_update_date", limit: 10
    t.string "kobetu_kakunin_eng_01", limit: 500
    t.string "kobetu_kakunin_eng_02", limit: 500
    t.string "kobetu_kakunin_eng_03", limit: 500
    t.string "kobetu_kakunin_eng_04", limit: 500
    t.string "kobetu_kakunin_eng_05", limit: 500
    t.string "kobetu_kakunin_eng_06", limit: 500
    t.string "kobetu_kakunin_eng_07", limit: 500
    t.string "kobetu_kakunin_eng_08", limit: 500
    t.string "kobetu_kakunin_eng_09", limit: 500
    t.string "kobetu_kakunin_eng_10", limit: 500
    t.string "kakunin_houhou_eng_01", limit: 100
    t.string "kakunin_houhou_eng_02", limit: 100
    t.string "kakunin_houhou_eng_03", limit: 100
    t.string "kakunin_houhou_eng_04", limit: 100
    t.string "kakunin_houhou_eng_05", limit: 100
    t.string "kakunin_houhou_eng_06", limit: 100
    t.string "kakunin_houhou_eng_07", limit: 100
    t.string "kakunin_houhou_eng_08", limit: 100
    t.string "kakunin_houhou_eng_09", limit: 100
    t.string "kakunin_houhou_eng_10", limit: 100
    t.string "kaigai_kenpin_eng", limit: 300
    t.string "kokunai_kenpin_eng", limit: 300
    t.string "needle_detection_eng", limit: 300
    t.string "tokkijikou_eng", limit: 500
    t.string "kpn_update_date_eng", limit: 10
    t.string "kenshin_id", limit: 15
    t.string "kenpin_id", limit: 15
  end

  create_table "mst_item_incidental3", primary_key: "item_code", id: :string, limit: 25, comment: "商品コード", comment: "商品付帯情報２", force: :cascade do |t|
    t.string "vender_code", limit: 4, comment: "ベンダーコード"
    t.string "facotry_code", limit: 4, comment: "ファクトリーコード"
    t.string "toy_test", limit: 8, comment: "おもちゃ試験自主検査完了日"
    t.string "food_sanitation_test", limit: 8, comment: "容器包装試験自主検査完了日"
    t.string "test_item_registry_number", limit: 15, comment: "品目登録番号"
    t.string "hs_code", limit: 18, comment: "税番"
    t.decimal "tax_rate", precision: 6, scale: 5, comment: "税率"
    t.integer "total_qty_outer_carton", limit: 4, precision: 4, comment: "トータル入り数/アウター"
    t.decimal "m3", precision: 5, scale: 4, comment: "M3"
  end

  create_table "mst_item_incidental3_170317", id: false, force: :cascade do |t|
    t.string "item_code", limit: 25, null: false
    t.string "vender_code", limit: 4
    t.string "facotry_code", limit: 4
    t.string "toy_test", limit: 8
    t.string "food_sanitation_test", limit: 8
    t.string "test_item_registry_number", limit: 15
    t.string "hs_code", limit: 18
    t.decimal "tax_rate", precision: 6, scale: 5
    t.integer "total_qty_outer_carton", limit: 4, precision: 4
    t.decimal "m3", precision: 5, scale: 4
  end

  create_table "mst_item_limit", primary_key: ["nhscd", "hincd"], comment: "販路制限_品目制限マスタ", force: :cascade do |t|
    t.string "nhscd", limit: 11, null: false, comment: "納品先コード"
    t.string "hincd", limit: 25, null: false, comment: "品目コード"
  end

  create_table "mst_item_limit_170524_032521", id: false, force: :cascade do |t|
    t.string "nhscd", limit: 11, null: false
    t.string "hincd", limit: 25, null: false
  end

  create_table "mst_kpn_hantei", comment: "判定方法マスタ(検品基準書)", force: :cascade do |t|
    t.string "hantei_houhou", limit: 30, comment: "判定方法"
    t.string "hantei_houhou_eng", limit: 100, comment: "判定方法(英語)"
  end

  create_table "mst_kpn_item_temporary", primary_key: "item_code", id: :string, limit: 25, comment: "商品コード", comment: "LISに登録されていない商品をQAGで仮登録するためのテーブル", force: :cascade do |t|
    t.string "kana_name", limit: 100, comment: "商品名(カナ)"
    t.string "brand_name", limit: 20, comment: "ブランド名"
    t.string "age", limit: 100, comment: "対象年齢"
    t.string "origin", limit: 20, comment: "原産国"
    t.string "maker_item_code", limit: 30, comment: "メーカー品番"
    t.string "eng_name", limit: 100, comment: "商品名称(英)"
    t.string "package", limit: 200, comment: "パッケージ"
    t.string "material", limit: 500, comment: "材質"
  end

  create_table "mst_kpn_kaigai", comment: "【廃止】海外検品方法マスタ(検品基準書)", force: :cascade do |t|
    t.string "kaigai_kenpin_houhou", limit: 100, comment: "海外検品方法"
    t.string "kaigai_kenpin_houhou_eng", limit: 100, comment: "海外検品方法(英語)"
  end

  create_table "mst_kpn_kaiji", comment: "【廃止】開示フラグマスタ(検品基準書)", force: :cascade do |t|
    t.string "kaiji_flg", limit: 10, comment: "開示フラグ"
  end

  create_table "mst_kpn_kakunin", comment: "確認方法マスタ(検品基準書)", force: :cascade do |t|
    t.string "kakunin_houhou", limit: 30, comment: "確認方法"
    t.string "kakunin_houhou_eng", limit: 100, comment: "確認方法(英語)"
  end

  create_table "mst_kpn_kenpin", primary_key: "kenpin_id", id: :string, limit: 15, comment: "検品ID", comment: "検品マスタ(検品基準書)", force: :cascade do |t|
    t.string "kenpin_houhou", limit: 50, comment: "検品方法"
    t.string "kenpin_houhou_eng", limit: 50, comment: "検品方法(英語)"
    t.string "kenpin_basho", limit: 50, comment: "検品場所"
    t.string "kenpin_basho_eng", limit: 50, comment: "検品場所(英語)"
    t.integer "kenpin_cost", limit: 5, precision: 5, comment: "検品コスト"
  end

  create_table "mst_kpn_kenshin", comment: "【廃止】検針方法マスタ(検品基準書)", force: :cascade do |t|
    t.string "kenshin_houhou", limit: 100, comment: "検針方法"
    t.string "kenshin_houhou_eng", limit: 100, comment: "検診方法(英語)"
  end

  create_table "mst_kpn_kenshin2", primary_key: "kenshin_id", id: :string, limit: 15, comment: "検針ID", comment: "検針マスタ(検品基準書)", force: :cascade do |t|
    t.string "kenshin_houhou", limit: 50, comment: "検針方法"
    t.string "kenshin_houhou_eng", limit: 50, comment: "検針方法(英語)"
    t.string "kenshin_basho", limit: 50, comment: "検針場所"
    t.string "kenshin_basho_eng", limit: 50, comment: "検針場所(英語)"
    t.integer "kenshin_cost", limit: 5, precision: 5, comment: "検針コスト(\\)"
  end

  create_table "mst_kpn_kijun", primary_key: "item_type", id: :string, limit: 2, comment: "品目種別(品目コードの頭2桁)", comment: "検品基準マスタ(検品基準書)", force: :cascade do |t|
    t.string "kenpin_kijun_01", limit: 250, comment: "検品基準01"
    t.string "kenpin_kijun_02", limit: 250, comment: "検品基準02"
    t.string "kenpin_kijun_03", limit: 250, comment: "検品基準03"
    t.string "kenpin_kijun_04", limit: 250, comment: "検品基準04"
    t.string "kenpin_kijun_05", limit: 250, comment: "検品基準05"
    t.string "kenpin_kijun_06", limit: 250, comment: "検品基準06"
    t.string "kenpin_kijun_07", limit: 250, comment: "検品基準07"
    t.string "kenpin_kijun_08", limit: 250, comment: "検品基準08"
    t.string "kenpin_kijun_09", limit: 250, comment: "検品基準09"
    t.string "kenpin_kijun_10", limit: 250, comment: "検品基準10"
    t.string "kenpin_kijun_11", limit: 250, comment: "検品基準11"
    t.string "kenpin_kijun_12", limit: 250, comment: "検品基準12"
    t.string "kenpin_kijun_13", limit: 250, comment: "検品基準13"
    t.string "kenpin_kijun_14", limit: 250, comment: "検品基準14"
    t.string "kenpin_kijun_15", limit: 250, comment: "検品基準15"
    t.string "hantei_houhou_01", limit: 30, comment: "判定方法01"
    t.string "hantei_houhou_02", limit: 30, comment: "判定方法02"
    t.string "hantei_houhou_03", limit: 30, comment: "判定方法03"
    t.string "hantei_houhou_04", limit: 30, comment: "判定方法04"
    t.string "hantei_houhou_05", limit: 30, comment: "判定方法05"
    t.string "hantei_houhou_06", limit: 30, comment: "判定方法06"
    t.string "hantei_houhou_07", limit: 30, comment: "判定方法07"
    t.string "hantei_houhou_08", limit: 30, comment: "判定方法08"
    t.string "hantei_houhou_09", limit: 30, comment: "判定方法09"
    t.string "hantei_houhou_10", limit: 30, comment: "判定方法10"
    t.string "hantei_houhou_11", limit: 30, comment: "判定方法11"
    t.string "hantei_houhou_12", limit: 30, comment: "判定方法12"
    t.string "hantei_houhou_13", limit: 30, comment: "判定方法13"
    t.string "hantei_houhou_14", limit: 30, comment: "判定方法14"
    t.string "hantei_houhou_15", limit: 30, comment: "判定方法15"
    t.string "kenpin_kijun_eng_01", limit: 250, comment: "検品基準(英語)01"
    t.string "kenpin_kijun_eng_02", limit: 250, comment: "検品基準(英語)02"
    t.string "kenpin_kijun_eng_03", limit: 250, comment: "検品基準(英語)03"
    t.string "kenpin_kijun_eng_04", limit: 250, comment: "検品基準(英語)04"
    t.string "kenpin_kijun_eng_05", limit: 250, comment: "検品基準(英語)05"
    t.string "kenpin_kijun_eng_06", limit: 250, comment: "検品基準(英語)06"
    t.string "kenpin_kijun_eng_07", limit: 250, comment: "検品基準(英語)07"
    t.string "kenpin_kijun_eng_08", limit: 250, comment: "検品基準(英語)08"
    t.string "kenpin_kijun_eng_09", limit: 250, comment: "検品基準(英語)09"
    t.string "kenpin_kijun_eng_10", limit: 250, comment: "検品基準(英語)10"
    t.string "kenpin_kijun_eng_11", limit: 250, comment: "検品基準(英語)11"
    t.string "kenpin_kijun_eng_12", limit: 250, comment: "検品基準(英語)12"
    t.string "kenpin_kijun_eng_13", limit: 250, comment: "検品基準(英語)13"
    t.string "kenpin_kijun_eng_14", limit: 250, comment: "検品基準(英語)14"
    t.string "kenpin_kijun_eng_15", limit: 250, comment: "検品基準(英語)15"
    t.string "hantei_houhou_eng_01", limit: 100, comment: "判定方法(英語)01"
    t.string "hantei_houhou_eng_02", limit: 100, comment: "判定方法(英語)02"
    t.string "hantei_houhou_eng_03", limit: 100, comment: "判定方法(英語)03"
    t.string "hantei_houhou_eng_04", limit: 100, comment: "判定方法(英語)04"
    t.string "hantei_houhou_eng_05", limit: 100, comment: "判定方法(英語)05"
    t.string "hantei_houhou_eng_06", limit: 100, comment: "判定方法(英語)06"
    t.string "hantei_houhou_eng_07", limit: 100, comment: "判定方法(英語)07"
    t.string "hantei_houhou_eng_08", limit: 100, comment: "判定方法(英語)08"
    t.string "hantei_houhou_eng_09", limit: 100, comment: "判定方法(英語)09"
    t.string "hantei_houhou_eng_10", limit: 100, comment: "判定方法(英語)10"
    t.string "hantei_houhou_eng_11", limit: 100, comment: "判定方法(英語)11"
    t.string "hantei_houhou_eng_12", limit: 100, comment: "判定方法(英語)12"
    t.string "hantei_houhou_eng_13", limit: 100, comment: "判定方法(英語)13"
    t.string "hantei_houhou_eng_14", limit: 100, comment: "判定方法(英語)14"
    t.string "hantei_houhou_eng_15", limit: 100, comment: "判定方法(英語)15"
  end

  create_table "mst_kpn_kijun_0824161718", id: false, force: :cascade do |t|
    t.string "item_type", limit: 2
    t.string "kenpin_kijun_01", limit: 250
    t.string "kenpin_kijun_02", limit: 250
    t.string "kenpin_kijun_03", limit: 250
    t.string "kenpin_kijun_04", limit: 250
    t.string "kenpin_kijun_05", limit: 250
    t.string "kenpin_kijun_06", limit: 250
    t.string "kenpin_kijun_07", limit: 250
    t.string "kenpin_kijun_08", limit: 250
    t.string "kenpin_kijun_09", limit: 250
    t.string "kenpin_kijun_10", limit: 250
    t.string "kenpin_kijun_11", limit: 250
    t.string "kenpin_kijun_12", limit: 250
    t.string "kenpin_kijun_13", limit: 250
    t.string "kenpin_kijun_14", limit: 250
    t.string "kenpin_kijun_15", limit: 250
    t.string "hantei_houhou_01", limit: 30
    t.string "hantei_houhou_02", limit: 30
    t.string "hantei_houhou_03", limit: 30
    t.string "hantei_houhou_04", limit: 30
    t.string "hantei_houhou_05", limit: 30
    t.string "hantei_houhou_06", limit: 30
    t.string "hantei_houhou_07", limit: 30
    t.string "hantei_houhou_08", limit: 30
    t.string "hantei_houhou_09", limit: 30
    t.string "hantei_houhou_10", limit: 30
    t.string "hantei_houhou_11", limit: 30
    t.string "hantei_houhou_12", limit: 30
    t.string "hantei_houhou_13", limit: 30
    t.string "hantei_houhou_14", limit: 30
    t.string "hantei_houhou_15", limit: 30
  end

  create_table "mst_kpn_kokunai", comment: "【廃止】国内検品方法マスタ(検品基準書)", force: :cascade do |t|
    t.string "kokunai_kenpin_houhou", limit: 100, comment: "国内検品方法"
    t.string "kokunai_kenpin_houhou_eng", limit: 100, comment: "国内検品方法(英語)"
  end

  create_table "mst_kpn_package", comment: "パッケージマスタ(検品基準書)", force: :cascade do |t|
    t.string "package", limit: 100, comment: "パッケージ"
  end

  create_table "mst_lead_time", primary_key: "brand_code", id: :string, limit: 6, comment: "ブランドコード", comment: "ブランド別出荷予定時期リードタイムマスタ", force: :cascade do |t|
    t.integer "lead_time", limit: 2, precision: 2, null: false, comment: "リードタイム"
  end

  create_table "mst_limited_item", primary_key: ["nhscd", "hincd"], comment: "販路制限_限定販売マスタ", force: :cascade do |t|
    t.string "nhscd", limit: 11, null: false, comment: "納品先コード"
    t.string "hincd", limit: 25, null: false, comment: "品目コード"
  end

  create_table "mst_limited_item_170411_125230", id: false, force: :cascade do |t|
    t.string "nhscd", limit: 11, null: false
    t.string "hincd", limit: 25, null: false
  end

  create_table "mst_limited_item_170524_032501", id: false, force: :cascade do |t|
    t.string "nhscd", limit: 11, null: false
    t.string "hincd", limit: 25, null: false
  end

  create_table "mst_maker", primary_key: "maker_code", id: :string, limit: 6, force: :cascade do |t|
    t.string "maker_name", limit: 20
  end

  create_table "mst_material", id: false, comment: "実績単価_資材マスタ", force: :cascade do |t|
    t.string "mat_code", limit: 5, null: false, comment: "資材コード"
    t.string "mat_name", limit: 50, comment: "資材名"
    t.decimal "price", precision: 7, scale: 2, comment: "資材単価"
    t.string "note", limit: 100, comment: "備考"
    t.index ["mat_code"], name: "pk_mst_material", unique: true
  end

  create_table "mst_menu", id: false, comment: "メニュー", force: :cascade do |t|
    t.string "url", limit: 20, comment: "URL"
  end

  create_table "mst_minbrdkake", comment: "ブランド下限掛率マスタ", force: :cascade do |t|
    t.string "clsid", limit: 6, comment: "ブランドコード"
    t.decimal "minkake", precision: 19, scale: 4, comment: "ブランド下限掛率"
    t.string "createdt", limit: 8, default: "to_char(sysdate, 'YYYYMMDD')", comment: "登録日付"
    t.string "createtm", limit: 6, default: "to_char(sysdate, 'hh24miss')", comment: "登録時刻"
    t.string "opeid", limit: 8, comment: "登録者"
    t.string "note", limit: 1000, comment: "備考"
    t.index ["clsid"], name: "idx_clsid"
  end

  create_table "mst_minbrdkake_160406", id: false, force: :cascade do |t|
    t.integer "id", limit: 19, precision: 19
    t.string "clsid", limit: 6
    t.decimal "minkake", precision: 19, scale: 4
    t.string "createdt", limit: 8
    t.string "createtm", limit: 6
    t.string "opeid", limit: 8
    t.string "datkb", limit: 1
    t.string "note", limit: 1000
  end

  create_table "mst_minbrdkake_160506", id: false, force: :cascade do |t|
    t.integer "id", limit: 19, precision: 19
    t.string "clsid", limit: 6
    t.decimal "minkake", precision: 19, scale: 4
    t.string "createdt", limit: 8
    t.string "createtm", limit: 6
    t.string "opeid", limit: 8
    t.string "datkb", limit: 1
    t.string "note", limit: 1000
  end

  create_table "mst_minbrdkake_log", id: false, comment: "ブランド下限掛率マスタ", force: :cascade do |t|
    t.integer "id", limit: 19, precision: 19, comment: "ID"
    t.string "clsid", limit: 6, comment: "ブランドコード"
    t.decimal "minkake", precision: 19, scale: 4, comment: "ブランド下限掛率"
    t.string "createdt", limit: 8, comment: "登録日付"
    t.string "createtm", limit: 6, comment: "登録時刻"
    t.string "opeid", limit: 8, comment: "登録者"
    t.string "note", limit: 1000, comment: "備考"
  end

  create_table "mst_newitem", primary_key: "item_code", id: :string, limit: 25, comment: "DW商品コード", comment: "新商品マスタ", force: :cascade do |t|
    t.string "status", limit: 10, comment: "ステータス"
    t.string "contact_person_at_ott", limit: 20, comment: "海外営業T担当者"
    t.string "launch_month", limit: 100, comment: "展開予定時期"
    t.string "brand_name", limit: 20, comment: "ブランド"
    t.string "tentative_item_name", limit: 100, comment: "（仮）商品名"
    t.string "tentative_standard", limit: 100, comment: "（仮）規格"
    t.decimal "tentative_retail", precision: 8, scale: 2, comment: "（仮）上代"
    t.decimal "tentative_cost_rate", precision: 4, scale: 3, comment: "（仮）原価率"
    t.string "maker_item_code", limit: 30, comment: "メーカー品番"
    t.string "eng_name", limit: 100, comment: "メーカー品名"
    t.string "upc", limit: 15, comment: "UPC"
    t.string "shipping_term_fob1", limit: 20, comment: "FOB"
    t.string "currency_code1", limit: 3, comment: "通貨コード"
    t.decimal "shipping_term_price1", precision: 8, scale: 2, comment: "価格"
    t.decimal "conversion_rate1", precision: 6, scale: 3, comment: "換算レート"
    t.decimal "price1", precision: 8, scale: 2, comment: "仕入値"
    t.decimal "price_30", precision: 8, scale: 2, comment: "30%原価"
    t.string "moq", limit: 20, comment: "MOQ"
    t.boolean "asort", default: false, comment: "アソート"
    t.string "supplier_code", limit: 10, comment: "仕入先コード"
    t.string "supplire_name", limit: 60, comment: "仕入先名"
    t.string "maker_code", limit: 5, comment: "メーカーコード"
    t.string "maker_name", limit: 50, comment: "メーカー名"
    t.string "brand_code", limit: 6, comment: "ブランドコード"
    t.string "vender", limit: 100, comment: "ベンダー"
    t.string "decision_date_for_launch", limit: 8, comment: "取扱決定日(YYYYMMDD)"
    t.string "genre_code", limit: 2, comment: "ジャンルコード"
    t.string "item_name", limit: 100, comment: "決定商品名"
    t.string "standard", limit: 100, comment: "決定規格"
    t.decimal "retail", precision: 8, scale: 2, comment: "決定上代"
    t.decimal "cost_rate", precision: 4, scale: 3, comment: "決定原価率"
    t.integer "qty_of_sales_sample", limit: 3, precision: 3, comment: "サンプル依頼数（営業）"
    t.string "requested_date_of_sales_sample", limit: 8, comment: "依頼日"
    t.string "arrival_date_of_sales_sample", limit: 8, comment: "到着日"
    t.integer "qty_of_testing_sample", limit: 3, precision: 3, comment: "サンプル依頼数（検査）"
    t.string "requested_date_of_test_sample", limit: 8, comment: "依頼日"
    t.string "arrival_date_of_test_sample", limit: 8, comment: "到着日"
    t.string "bom_requested_date", limit: 8, comment: "BOM依頼日"
    t.string "bom_arrival_date", limit: 8, comment: "BOM到着日"
    t.string "req_date_of_test_rep", limit: 8, comment: "海外検査証依頼日"
    t.string "arrival_date_of_test_rep", limit: 8, comment: "海外検査証入手日"
    t.string "image_receive_date", limit: 8, comment: "商品画像取り寄せ日"
    t.string "receive_date", limit: 8, comment: "入荷日"
    t.string "order_deadline", limit: 8, comment: "数出〆切"
    t.string "order_date", limit: 8, comment: "発注日"
    t.string "package_category", limit: 50, comment: "パッケージ種類"
    t.string "chk_manual", limit: 2, comment: "説明書有無"
    t.string "chk_care_label", limit: 2, comment: "ケアラベル有無"
    t.string "artwork_deadline", limit: 8, comment: "入稿〆切"
    t.string "order_date_to_bpg", limit: 8, comment: "営推G依頼日"
    t.string "contact_person_at_bpg", limit: 20, comment: "営推G担当者"
    t.string "end_date_of_artwork", limit: 8, comment: "入稿日"
    t.string "proof_check_date", limit: 8, comment: "プルーフチェック"
    t.string "item_size", limit: 25, comment: "本体サイズ"
    t.string "item_weight", limit: 20, comment: "本体重量"
    t.string "package_size", limit: 25, comment: "パッケージサイズ"
    t.decimal "package_weight", precision: 8, scale: 2, comment: "パッケージ重量"
    t.string "size_note", limit: 350, comment: "サイズ追記"
    t.string "age", limit: 40, comment: "対象年齢"
    t.string "sales_point", limit: 200, comment: "セールスポイント"
    t.string "image_path", limit: 20, comment: "画像パス"
    t.string "launch_field", limit: 60, comment: "展開先"
    t.string "item_db_regist", limit: 8, comment: "台帳登録日"
    t.string "rrr_regist", limit: 8, comment: "RRR登録日"
    t.string "bom_check", limit: 8, comment: "BOM確認"
    t.string "test_rep_check", limit: 8, comment: "海外検査証確認"
    t.string "caution_and_material", limit: 17, comment: "材質日本語化／注意事項"
    t.string "pass_date_jpn_test", limit: 8, comment: "導入試験"
    t.string "material", limit: 500, comment: "材質"
    t.string "care", limit: 1100, comment: "お手入れ方法（案）"
    t.string "caution", limit: 3500, comment: "注意事項（案）"
    t.string "all_kana_name", limit: 100, comment: "フルカナ名称"
  end

  create_table "mst_newitem_170313", id: false, comment: "新商品マスタ", force: :cascade do |t|
    t.string "status", limit: 10, comment: "ステータス"
    t.string "contact_person_at_ott", limit: 20, comment: "海外営業T担当者"
    t.string "launch_month", limit: 100, comment: "展開予定時期"
    t.string "brand_name", limit: 20, comment: "ブランド"
    t.string "tentative_item_name", limit: 100, comment: "（仮）商品名"
    t.string "tentative_standard", limit: 100, comment: "（仮）規格"
    t.decimal "tentative_retail", precision: 8, scale: 2, comment: "（仮）上代"
    t.decimal "tentative_cost_rate", precision: 4, scale: 3, comment: "（仮）原価率"
    t.string "maker_item_code", limit: 30, comment: "メーカー品番"
    t.string "eng_name", limit: 100, comment: "メーカー品名"
    t.string "upc", limit: 15, comment: "UPC"
    t.string "shipping_term_fob1", limit: 20, comment: "FOB"
    t.string "currency_code1", limit: 3, comment: "通貨コード"
    t.decimal "shipping_term_price1", precision: 8, scale: 2, comment: "価格"
    t.decimal "conversion_rate1", precision: 6, scale: 3, comment: "換算レート"
    t.decimal "price1", precision: 8, scale: 2, comment: "仕入値"
    t.decimal "price_30", precision: 8, scale: 2, comment: "30%原価"
    t.string "moq", limit: 20, comment: "MOQ"
    t.boolean "asort", default: false, comment: "アソート"
    t.string "supplier_code", limit: 10, comment: "仕入先コード"
    t.string "supplire_name", limit: 60, comment: "仕入先名"
    t.string "maker_code", limit: 5, comment: "メーカーコード"
    t.string "maker_name", limit: 50, comment: "メーカー名"
    t.string "brand_code", limit: 6, comment: "ブランドコード"
    t.string "vender", limit: 100, comment: "ベンダー"
    t.string "decision_date_for_launch", limit: 8, comment: "取扱決定日(YYYYMMDD)"
    t.string "item_code", limit: 25, null: false, comment: "DW商品コード"
    t.string "genre_code", limit: 2, comment: "ジャンルコード"
    t.string "item_name", limit: 100, comment: "決定商品名"
    t.string "standard", limit: 100, comment: "決定規格"
    t.decimal "retail", precision: 8, scale: 2, comment: "決定上代"
    t.decimal "cost_rate", precision: 4, scale: 3, comment: "決定原価率"
    t.integer "qty_of_sales_sample", limit: 3, precision: 3, comment: "サンプル依頼数（営業）"
    t.string "requested_date_of_sales_sample", limit: 8, comment: "依頼日"
    t.string "arrival_date_of_sales_sample", limit: 8, comment: "到着日"
    t.integer "qty_of_testing_sample", limit: 3, precision: 3, comment: "サンプル依頼数（検査）"
    t.string "requested_date_of_test_sample", limit: 8, comment: "依頼日"
    t.string "arrival_date_of_test_sample", limit: 8, comment: "到着日"
    t.string "bom_requested_date", limit: 8, comment: "BOM依頼日"
    t.string "bom_arrival_date", limit: 8, comment: "BOM到着日"
    t.string "req_date_of_test_rep", limit: 8, comment: "海外検査証依頼日"
    t.string "arrival_date_of_test_rep", limit: 8, comment: "海外検査証入手日"
    t.string "image_receive_date", limit: 8, comment: "商品画像取り寄せ日"
    t.string "receive_date", limit: 8, comment: "入荷日"
    t.string "order_deadline", limit: 8, comment: "数出〆切"
    t.string "order_date", limit: 8, comment: "発注日"
    t.string "package_category", limit: 50, comment: "パッケージ種類"
    t.string "chk_manual", limit: 2, comment: "説明書有無"
    t.string "chk_care_label", limit: 2, comment: "ケアラベル有無"
    t.string "artwork_deadline", limit: 8, comment: "入稿〆切"
    t.string "order_date_to_bpg", limit: 8, comment: "営推G依頼日"
    t.string "contact_person_at_bpg", limit: 20, comment: "営推G担当者"
    t.string "end_date_of_artwork", limit: 8, comment: "入稿日"
    t.string "proof_check_date", limit: 8, comment: "プルーフチェック"
    t.string "item_size", limit: 25, comment: "本体サイズ"
    t.string "item_weight", limit: 20, comment: "本体重量"
    t.string "package_size", limit: 25, comment: "パッケージサイズ"
    t.decimal "package_weight", precision: 8, scale: 2, comment: "パッケージ重量"
    t.string "size_note", limit: 350, comment: "サイズ追記"
    t.string "age", limit: 40, comment: "対象年齢"
    t.string "sales_point", limit: 200, comment: "セールスポイント"
    t.string "image_path", limit: 20, comment: "画像パス"
    t.string "launch_field", limit: 60, comment: "展開先"
    t.string "item_db_regist", limit: 8, comment: "台帳登録日"
    t.string "rrr_regist", limit: 8, comment: "RRR登録日"
    t.string "bom_check", limit: 8, comment: "BOM確認"
    t.string "test_rep_check", limit: 8, comment: "海外検査証確認"
    t.string "caution_and_material", limit: 17, comment: "材質日本語化／注意事項"
    t.string "pass_date_jpn_test", limit: 8, comment: "導入試験"
    t.string "material", limit: 500, comment: "材質"
    t.string "care", limit: 1100, comment: "お手入れ方法（案）"
    t.string "caution", limit: 3500, comment: "注意事項（案）"
    t.string "all_kana_name", limit: 100, comment: "フルカナ名称"
  end

  create_table "mst_pgm", primary_key: "pgmid", id: :string, limit: 100, comment: "プログラムID", comment: "プログラム管理テーブル", force: :cascade do |t|
    t.string "pgm_name", limit: 50, comment: "プログラム名"
  end

  create_table "mst_processing", id: false, comment: "実績単価_加工マスタ", force: :cascade do |t|
    t.string "pro_code", limit: 5, null: false, comment: "加工マスターコード"
    t.string "pro_name", limit: 60, comment: "加工内容"
    t.integer "price", limit: 5, precision: 5, comment: "加工単価"
    t.index ["pro_code"], name: "pk_mst_processing", unique: true
  end

  create_table "mst_result_price", id: false, comment: "実績単価_総合リストマスタ", force: :cascade do |t|
    t.string "item_code", limit: 25, null: false, comment: "品目コード"
    t.string "currency_code", limit: 2, comment: "通貨コード"
    t.string "inc_code", limit: 3, comment: "インコタームズコード"
    t.string "kenshin_id", limit: 15, comment: "検針ID"
    t.string "kenpin_id", limit: 15, comment: "検品ID"
    t.string "pro_code1", limit: 5, comment: "加工コード1"
    t.string "pro_code2", limit: 5, comment: "加工コード2"
    t.string "pro_code3", limit: 5, comment: "加工コード3"
    t.string "pro_code4", limit: 5, comment: "加工コード4"
    t.string "mat_code1", limit: 5, comment: "資材コード1"
    t.string "mat_code2", limit: 5, comment: "資材コード2"
    t.string "mat_code3", limit: 5, comment: "資材コード3"
    t.string "mat_code4", limit: 5, comment: "資材コード4"
    t.string "ergo_code", limit: 10, comment: "エルゴ加工検品コード"
    t.string "imp_app_code", limit: 5, comment: "輸入アパレルコード"
    t.index ["item_code"], name: "pk_mst_result_price", unique: true
  end

  create_table "mst_result_price_0531170812", id: false, force: :cascade do |t|
    t.string "closeing_date", limit: 8, null: false
    t.string "item_code", limit: 25, null: false
    t.string "incoterm_code", limit: 5
    t.decimal "result_rate", precision: 5, scale: 2
    t.string "metel_check_code", limit: 5
    t.string "inspection_code", limit: 5
    t.decimal "process_cost", precision: 5, scale: 2
    t.string "process_note", limit: 20
    t.integer "uncontrol_cost", limit: 5, precision: 5
  end

  create_table "mst_result_price_160705_041800", id: false, force: :cascade do |t|
    t.string "item_code", limit: 25, null: false
    t.string "currency_code", limit: 2
    t.string "inc_code", limit: 2
    t.string "kenshin_id", limit: 15
    t.string "kenpin_id", limit: 15
    t.string "pro_code1", limit: 5
    t.string "pro_code2", limit: 5
    t.string "pro_code3", limit: 5
    t.string "pro_code4", limit: 5
    t.string "mat_code1", limit: 5
    t.string "mat_code2", limit: 5
    t.string "mat_code3", limit: 5
    t.string "mat_code4", limit: 5
    t.string "ergo_code", limit: 10
    t.string "imp_app_code", limit: 5
  end

  create_table "mst_result_price_160707_041701", id: false, force: :cascade do |t|
    t.string "item_code", limit: 25, null: false
    t.string "currency_code", limit: 2
    t.string "inc_code", limit: 2
    t.string "kenshin_id", limit: 15
    t.string "kenpin_id", limit: 15
    t.string "pro_code1", limit: 5
    t.string "pro_code2", limit: 5
    t.string "pro_code3", limit: 5
    t.string "pro_code4", limit: 5
    t.string "mat_code1", limit: 5
    t.string "mat_code2", limit: 5
    t.string "mat_code3", limit: 5
    t.string "mat_code4", limit: 5
    t.string "ergo_code", limit: 10
    t.string "imp_app_code", limit: 5
  end

  create_table "mst_result_price_160721_065217", id: false, force: :cascade do |t|
    t.string "item_code", limit: 25, null: false
    t.string "currency_code", limit: 2
    t.string "inc_code", limit: 2
    t.string "kenshin_id", limit: 15
    t.string "kenpin_id", limit: 15
    t.string "pro_code1", limit: 5
    t.string "pro_code2", limit: 5
    t.string "pro_code3", limit: 5
    t.string "pro_code4", limit: 5
    t.string "mat_code1", limit: 5
    t.string "mat_code2", limit: 5
    t.string "mat_code3", limit: 5
    t.string "mat_code4", limit: 5
    t.string "ergo_code", limit: 10
    t.string "imp_app_code", limit: 5
  end

  create_table "mst_result_price_161111_042002", id: false, force: :cascade do |t|
    t.string "item_code", limit: 25, null: false
    t.string "currency_code", limit: 2
    t.string "inc_code", limit: 2
    t.string "kenshin_id", limit: 15
    t.string "kenpin_id", limit: 15
    t.string "pro_code1", limit: 5
    t.string "pro_code2", limit: 5
    t.string "pro_code3", limit: 5
    t.string "pro_code4", limit: 5
    t.string "mat_code1", limit: 5
    t.string "mat_code2", limit: 5
    t.string "mat_code3", limit: 5
    t.string "mat_code4", limit: 5
    t.string "ergo_code", limit: 10
    t.string "imp_app_code", limit: 5
  end

  create_table "mst_result_price_170209_054902", id: false, force: :cascade do |t|
    t.string "item_code", limit: 25, null: false
    t.string "currency_code", limit: 2
    t.string "inc_code", limit: 3
    t.string "kenshin_id", limit: 15
    t.string "kenpin_id", limit: 15
    t.string "pro_code1", limit: 5
    t.string "pro_code2", limit: 5
    t.string "pro_code3", limit: 5
    t.string "pro_code4", limit: 5
    t.string "mat_code1", limit: 5
    t.string "mat_code2", limit: 5
    t.string "mat_code3", limit: 5
    t.string "mat_code4", limit: 5
    t.string "ergo_code", limit: 10
    t.string "imp_app_code", limit: 5
  end

  create_table "mst_rl_delivery_trader", comment: "返品履歴_配送業者マスタ", force: :cascade do |t|
    t.string "delivery_trader", limit: 50, comment: "配送業者"
  end

  create_table "mst_rl_input_person", comment: "返品履歴_作業者マスタ", force: :cascade do |t|
    t.string "input_person", limit: 50, comment: "作業者"
  end

  create_table "mst_rl_return_book", comment: "返品履歴_返品確認書マスタ", force: :cascade do |t|
    t.string "return_book", limit: 100
  end

  create_table "mst_rl_status", comment: "返品履歴_ステータスマスタ", force: :cascade do |t|
    t.string "status", limit: 20, comment: "進捗状況（ステータス）"
    t.integer "r", limit: 3, precision: 3, comment: "赤"
    t.integer "g", limit: 3, precision: 3, comment: "緑"
    t.integer "b", limit: 3, precision: 3, comment: "青"
  end

  create_table "mst_sellchanne150521", id: false, force: :cascade do |t|
    t.string "nhscd", limit: 11, null: false
    t.string "hincd", limit: 25, null: false
  end

  create_table "mst_sellchannel_150613", id: false, force: :cascade do |t|
    t.string "nhscd", limit: 11, null: false
    t.string "hincd", limit: 25, null: false
  end

  create_table "mst_sellchannel_150702", id: false, force: :cascade do |t|
    t.string "nhscd", limit: 11, null: false
    t.string "hincd", limit: 25, null: false
  end

  create_table "mst_setitemlink", id: false, comment: "セット品構成マスタ", force: :cascade do |t|
    t.string "item_code", limit: 25, null: false, comment: "商品コード"
    t.string "child_item_code", limit: 25, null: false, comment: "子商品コード"
    t.index ["item_code", "child_item_code"], name: "pk_mst_setitemlink", unique: true
  end

  create_table "mst_setitemlink_150612_024211", id: false, force: :cascade do |t|
    t.string "item_code", limit: 25, null: false
    t.string "child_item_code", limit: 25, null: false
  end

  create_table "mst_shippingaddress", id: false, comment: "発送先マスタ", force: :cascade do |t|
    t.integer "id", limit: 10, precision: 10, default: 0, comment: "ID"
    t.string "tokcd", limit: 11, comment: "得意先コード"
    t.string "toknm", limit: 60, comment: "得意先名"
    t.string "tokzp", limit: 8, comment: "郵便番号"
    t.string "tokada", limit: 30, comment: "住所1"
    t.string "tokadb", limit: 30, comment: "住所2"
    t.string "tokadc", limit: 30, comment: "住所3"
    t.string "toktl", limit: 13, comment: "得意先TEL"
    t.string "tokfx", limit: 13, comment: "得意先FAX"
    t.string "tokman", limit: 30, comment: "得意先担当者"
    t.string "tokmantl", limit: 13, comment: "得意先担当者TEL"
    t.string "tokmanml", limit: 30, comment: "得意先担当者MAIL"
    t.string "mancd", limit: 30, comment: "DADWAY営業担当者"
  end

  create_table "mst_target_brand", id: false, comment: "販路制限_対象ブランドマスタ", force: :cascade do |t|
    t.string "brandcode", limit: 8, null: false, comment: "ブランドコード"
    t.index ["brandcode"], name: "pf_mst_target_brand", unique: true
  end

  create_table "mst_target_brand_170524_032508", id: false, force: :cascade do |t|
    t.string "brandcode", limit: 8, null: false
  end

  create_table "mst_tokbrdkake", comment: "得意先別ブランド掛率マスタ", force: :cascade do |t|
    t.string "tokcd", limit: 11, null: false, comment: "得意先コード"
    t.string "clsid", limit: 6, null: false, comment: "ブランドコード"
    t.decimal "brdkake", precision: 19, scale: 4, comment: "得意先別ブランド掛率"
    t.string "createdt", limit: 8, default: "to_char(sysdate, 'YYYYMMDD')", comment: "登録日付"
    t.string "createtm", limit: 6, default: "to_char(sysdate, 'hh24miss')", comment: "登録時刻"
    t.string "opeid", limit: 8, comment: "登録者"
    t.string "note", limit: 1000, comment: "備考"
    t.index ["clsid"], name: "idx_tokbrdkake003"
    t.index ["tokcd", "clsid"], name: "idx_tokbrdkake002"
    t.index ["tokcd"], name: "idx_tokbrdkake001"
  end

  create_table "mst_tokbrdkake_log", id: false, comment: "得意先別ブランド掛率変更履歴", force: :cascade do |t|
    t.integer "id", limit: 19, precision: 19, comment: "ID"
    t.string "tokcd", limit: 11, comment: "得意先コード"
    t.string "clsid", limit: 6, comment: "ブランドコード"
    t.decimal "brdkake", precision: 19, scale: 4, comment: "得意先別ブランド掛率"
    t.string "createdt", limit: 8, comment: "登録日付"
    t.string "createtm", limit: 6, comment: "登録時刻"
    t.string "opeid", limit: 8, comment: "登録者"
    t.string "note", limit: 1000, comment: "備考"
  end

  create_table "mst_tokhinkake", id: false, comment: "得意先別品目掛率マスタ", force: :cascade do |t|
    t.integer "id", limit: 19, precision: 19, default: 0, null: false, comment: "ID"
    t.string "tokcd", limit: 11, null: false, comment: "得意先コード"
    t.string "hincd", limit: 25, null: false, comment: "品目コード"
    t.decimal "hinkake", precision: 19, scale: 4, comment: "得意先別品目掛率"
    t.string "createdt", limit: 8, default: "to_char(sysdate, 'YYYYMMDD')", comment: "登録日付"
    t.string "createtm", limit: 6, default: "to_char(sysdate, 'hh24miss')", comment: "登録時刻"
    t.string "opeid", limit: 8, comment: "登録者"
    t.string "note", limit: 1000, comment: "備考"
    t.index ["tokcd", "hincd"], name: "idx_tokhinkake_001", unique: true
  end

  create_table "mst_tokhinkake_log", id: false, comment: "得意先別品目掛率マスタ変更履歴", force: :cascade do |t|
    t.integer "id", limit: 19, precision: 19, null: false, comment: "ID"
    t.string "tokcd", limit: 11, null: false, comment: "得意先コード"
    t.string "hincd", limit: 25, null: false, comment: "品目コード"
    t.decimal "hinkake", precision: 19, scale: 4, comment: "得意先別品目掛率"
    t.string "createdt", limit: 8, default: "to_char(sysdate, 'YYYYMMDD')", comment: "登録日付"
    t.string "createtm", limit: 6, default: "to_char(sysdate, 'hh24miss')", comment: "登録時刻"
    t.string "opeid", limit: 8, comment: "登録者"
    t.string "note", limit: 1000, comment: "備考"
  end

  create_table "mst_vender", primary_key: "vender_code", id: :string, limit: 4, comment: "ベンダーコード", comment: "ベンダーマスタ", force: :cascade do |t|
    t.string "name", limit: 40, comment: "ベンダー名"
    t.string "address", limit: 120, comment: "ベンダー住所"
    t.string "tel", limit: 15, comment: "ベンダー電話番号"
    t.string "fax", limit: 15, comment: "ベンダーFAX番号"
  end

  create_table "mst_web_stock", primary_key: "hincd", id: :string, limit: 25, comment: "商品コード", comment: "WEB公開用在庫マスタ", force: :cascade do |t|
    t.string "brand", limit: 20, comment: "ブランド名"
    t.string "status", limit: 1, default: "0", comment: "0:表示 1:非表示 9:削除"
    t.string "note", limit: 50, comment: "入荷状況等の備考"
  end

  create_table "test_nakamura", id: false, force: :cascade do |t|
    t.string "test", limit: 50
    t.decimal "aaa"
    t.decimal "bbb"
    t.string "str", limit: 100
  end

  create_table "test_urano", id: false, force: :cascade do |t|
    t.string "aaa", limit: 12
    t.string "bbb", limit: 12
    t.string "ccc", limit: 12
  end

  create_table "tmp_tokcodelist", temporary: true, id: false, force: :cascade do |t|
    t.string "tokcd", limit: 11
  end

  create_table "tr_csinfo", primary_key: "item_code", id: :string, limit: 25, comment: "商品コード", comment: "CS情報", force: :cascade do |t|
    t.string "update_date", limit: 10, comment: "更新日"
    t.string "inquiry1_title", limit: 60, comment: "問い合わせタイトル１"
    t.string "inquiry1_note", limit: 300, comment: "問い合わせ内容１"
    t.string "inquiry2_title", limit: 60, comment: "問い合わせタイトル２"
    t.string "inquiry2_note", limit: 300, comment: "問い合わせ内容２"
    t.string "inquiry3_title", limit: 60, comment: "問い合わせタイトル３"
    t.string "inquiry3_note", limit: 300, comment: "問い合わせ内容３"
    t.string "objection1_title", limit: 60, comment: "クレームタイトル１"
    t.string "objection1_note", limit: 300, comment: "クレーム内容１"
    t.string "objection2_title", limit: 60, comment: "クレームタイトル２"
    t.string "objection2_note", limit: 300, comment: "クレーム内容２"
    t.string "objection3_title", limit: 60, comment: "クレームタイトル３"
    t.string "objection3_note", limit: 300, comment: "クレーム内容３"
    t.string "note", limit: 300, comment: "備考（特記事項）"
    t.string "repair_system", limit: 100, comment: "修理体制"
    t.string "parts_sales", limit: 80, comment: "部品販売"
    t.string "history", limit: 110, comment: "年表"
  end

  create_table "tr_importdata", id: false, force: :cascade do |t|
    t.string "mihno", limit: 16, null: false, comment: "輸入書類番号"
    t.string "sircd", limit: 22, comment: "仕入先コード"
    t.string "mihdt", limit: 16, comment: "伝票日付"
    t.string "linno", limit: 6, null: false, comment: "行数"
    t.string "hincd", limit: 50, comment: "品目コード"
    t.string "hinrn", limit: 30, comment: "品目略称"
    t.decimal "mihsu", precision: 19, scale: 4, comment: "入荷予定数"
    t.decimal "casesu", precision: 19, scale: 4, comment: "入荷予定数（ケース）"
    t.string "newkb", limit: 1, comment: "新規区分（0:新規 1:継続）"
    t.string "qckb", limit: 1, comment: "仕様変更区分（0:新規 1:変更無し)"
    t.string "matekb", limit: 1, comment: "資材有無（0:無し 1:有り）"
    t.string "note", limit: 30, comment: "明細備考"
    t.string "yotdt", limit: 8, comment: "入荷予定日"
    t.string "dldt", limit: 8, comment: "ダウンロード日付"
    t.string "datakb", limit: 1, comment: "データ区分（I：輸入 M：移動）"
    t.index ["mihno", "linno"], name: "tr_omportdata_pk", unique: true
  end

  create_table "tr_importdata_150519_124207", id: false, force: :cascade do |t|
    t.string "mihno", limit: 16, null: false
    t.string "sircd", limit: 22
    t.string "mihdt", limit: 16
    t.string "linno", limit: 6, null: false
    t.string "hincd", limit: 50
    t.string "hinrn", limit: 30
    t.decimal "mihsu", precision: 19, scale: 4
    t.decimal "casesu", precision: 19, scale: 9
    t.string "newkb", limit: 1
    t.string "qckb", limit: 1
    t.string "matekb", limit: 1
    t.string "note", limit: 30
    t.string "yotdt", limit: 8
    t.string "dldt", limit: 8
    t.string "datakb", limit: 1
  end

  create_table "tr_item_application", id: false, comment: "商品申請データ", force: :cascade do |t|
    t.integer "no", limit: 8, precision: 8, null: false, comment: "商品申請書番号"
    t.date "appli_date", comment: "申請日"
    t.string "applicant", limit: 20, comment: "申請者"
    t.string "appli_brand", limit: 20, comment: "申請ブランド"
    t.string "launch_month", limit: 8, comment: "展開年月（yyyy/mm）"
    t.integer "line_no", limit: 3, precision: 3, comment: "行番号"
    t.string "maker_item_no", limit: 20, comment: "メーカー商品こーｄ"
    t.string "maker_item_name", limit: 100, comment: "メーカー商品名"
    t.string "maker_item_std", limit: 100, comment: "メーカー商品規格"
    t.string "dw_item_name", limit: 100, comment: "ダッドウェイ商品名"
    t.string "dw_item_std", limit: 100, comment: "ダッドウェイ規格 個数・セット数・サイズ・色・柄・種類"
    t.string "dw_item_name_half", limit: 40, comment: "ダッドウェイ商品名（半角）"
    t.string "mfe", limit: 5, comment: "MFEライセンス（MFE）"
    t.binary "image", comment: "画像（どうしようかな）"
    t.string "currency_code", limit: 3, comment: "通貨コード→通貨マスタ（MST_CARRENCY）"
    t.string "btob", limit: 8, comment: "BtoB掲載（掲載・非掲載）"
    t.string "continue", limit: 10, comment: "継続有無（継続・スポット）"
    t.string "sell_limit", limit: 4, comment: "販路制限（有り・無し・DR）"
    t.string "inc_code", limit: 2, comment: "インコタームズコード"
    t.string "dw_item_code_genre", limit: 2, comment: "ダッドウェイ商品コード-ジャンル"
    t.string "dw_item_code_brand", limit: 2, comment: "ダッドウェイ商品コード-ブランド"
    t.string "dw_item_code_no", limit: 21, comment: "ダッドウェイ商品コード-番号・符号"
    t.string "status", limit: 5, comment: "商品ステータス"
    t.string "trade", limit: 6, comment: "貿易対象（対象・対象外）"
    t.string "upc_jan_code", limit: 15, comment: "UPC/JANコード"
    t.string "sales_point", limit: 200, comment: "セールスポイント"
    t.string "supplire_code", limit: 10, comment: "仕入先コード"
    t.string "supplire_name", limit: 60, comment: "仕入先名"
    t.string "genre_code", limit: 6, comment: "ジャンルコード"
    t.string "brand_code", limit: 6, comment: "ブランドコード"
    t.string "maker_code", limit: 6, comment: "メーカーコード"
    t.decimal "unit_price", precision: 6, scale: 2, comment: "ユニットプライス"
    t.integer "preset_price", limit: 6, precision: 6, comment: "予定単価"
    t.string "pro_code", limit: 5, comment: "加工コード"
    t.string "kenshin_id", limit: 15, comment: "検針ID"
    t.string "kenpin_id", limit: 15, comment: "検品ID"
    t.string "mat_code", limit: 5, comment: "資材コード"
  end

  create_table "tr_item_application_1014175216", id: false, force: :cascade do |t|
    t.integer "no", limit: 8, precision: 8, null: false
    t.date "appli_date"
    t.string "applicant", limit: 20
    t.string "appli_brand", limit: 20
    t.string "launch_month", limit: 8
  end

  create_table "tr_item_application_20161019", id: false, comment: "商品申請データ_OLD", force: :cascade do |t|
    t.integer "no", limit: 8, precision: 8, null: false, comment: "商品申請書番号"
    t.date "appli_date", comment: "申請日"
    t.string "applicant", limit: 20, comment: "申請者"
    t.string "appli_brand", limit: 20, comment: "申請ブランド"
    t.string "launch_month", limit: 8, comment: "展開年月（yyyy/mm）"
    t.string "btob", limit: 8, comment: "BtoB掲載（掲載・非掲載）"
    t.string "continue", limit: 10, comment: "継続有無（継続・スポット）"
    t.string "sell_limit", limit: 4, comment: "販路制限（有り・無し・DR）"
    t.string "dw_item_code_genre", limit: 2, comment: "ダッドウェイ商品コード-ジャンル"
    t.string "dw_item_code_brand", limit: 2, comment: "ダッドウェイ商品コード-ブランド"
    t.string "dw_item_code_no", limit: 21, comment: "ダッドウェイ商品コード-番号・符号"
    t.string "dw_item_name", limit: 100, comment: "ダッドウェイ商品名"
    t.string "dw_item_std1", limit: 100, comment: "ダッドウェイ規格１ 個数・セット数"
    t.string "dw_item_std2", limit: 100, comment: "ダッドウェイ規格２ サイズ"
    t.string "dw_item_std3", limit: 100, comment: "ダッドウェイ規格３ 色・柄・種類"
    t.string "status", limit: 5, comment: "商品ステータス"
    t.string "trade", limit: 6, comment: "貿易対象（対象・対象外）"
    t.string "maker_item_no", limit: 20, comment: "メーカー商品こーｄ"
    t.string "maker_item_name", limit: 100, comment: "メーカー商品名"
    t.string "maker_item_std", limit: 100, comment: "メーカー商品規格"
    t.string "upc_jan_code", limit: 15, comment: "UPC/JANコード"
    t.string "sales_point", limit: 200, comment: "セールスポイント"
    t.string "supplire_code", limit: 10, comment: "仕入先コード"
    t.string "supplire_name", limit: 60, comment: "仕入先名"
    t.string "genre_code", limit: 6, comment: "ジャンルコード"
    t.string "brand_code", limit: 6, comment: "ブランドコード"
    t.string "maker_code", limit: 6, comment: "メーカーコード"
    t.string "inc_code", limit: 2, comment: "インコタームズコード"
    t.decimal "unit_price", precision: 6, scale: 2, comment: "ユニットプライス"
    t.integer "preset_price", limit: 6, precision: 6, comment: "予定単価"
    t.string "pro_code", limit: 5, comment: "加工コード"
    t.string "kenshin_id", limit: 15, comment: "検針ID"
    t.string "kenpin_id", limit: 15, comment: "検品ID"
    t.string "mat_code", limit: 5, comment: "資材コード"
  end

  create_table "tr_item_status_log", id: false, comment: "商品ステータス変更履歴", force: :cascade do |t|
    t.string "item_code", limit: 25, comment: "品目コード"
    t.string "item_name", limit: 100, comment: "品目名"
    t.string "before_status", limit: 25, comment: "変更前ステータス"
    t.string "after_status", limit: 25, comment: "変更後ステータス"
    t.date "update_date", comment: "変更日"
    t.string "update_type", limit: 25, comment: "変更区分(自動等)"
  end

  create_table "tr_nubyjanrequest_log", comment: "Nuby JANシール貼付作業依頼書履歴", force: :cascade do |t|
    t.date "create_date", comment: "作成日時"
    t.string "request_owner", limit: 25, comment: "依頼者"
    t.string "dw_item_code", limit: 25, comment: "DADWAY 品目コード"
    t.string "dw_item_name", limit: 100, comment: "DADWAY 品目名"
    t.string "dw_jan", limit: 15, comment: "DADWAY JAN"
    t.string "mk_item_code", limit: 25, comment: "メーカー 品目コード"
    t.string "mk_item_name", limit: 100, comment: "メーカー 品目名(英)"
    t.string "mk_jan", limit: 15, comment: "メーカー JAN"
    t.string "po_no", limit: 15, comment: "COST.PO.No"
    t.string "po_item_name", limit: 100, comment: "PO ItenName"
    t.string "po_vender_name", limit: 100, comment: "PO VenderName"
    t.string "po_factory", limit: 100, comment: "PO Factory"
    t.date "po_make_plan_date", comment: "PO 製造予定日"
    t.integer "po_quantity", limit: 8, precision: 8, comment: "PO Quantity"
    t.string "po_inspection_no", limit: 15, comment: "PO 検品No"
    t.string "sh_person", limit: 25, comment: "発送 担当者"
    t.integer "sh_publish_count", limit: 8, precision: 8, comment: "発送 発行数"
    t.date "sh_publish_date", comment: "発送 発行日付"
    t.string "sh_check1", limit: 25, comment: "発送 JAN＋枚数チェック"
    t.date "sh_shipping_date", comment: "発送 発送日付"
    t.string "sh_shipping_no", limit: 50, comment: "発送 発送番号"
    t.string "rv_person", limit: 25, comment: "受領 担当者"
    t.string "rv_check1", limit: 25, comment: "受領 JAN＋枚数チェック"
    t.date "rv_receive_date", comment: "受領 受領日"
    t.string "wk_person", limit: 25, comment: "作業 担当者（責任者）"
    t.date "wk_receivedate", comment: "作業 受領日"
    t.string "wk_check1", limit: 25, comment: "作業 JAN＋枚数チェック"
    t.date "ck_date1", comment: "チェック 日付1"
    t.string "ck_worker1", limit: 25, comment: "チェック 担当者1"
    t.string "ck_check1", limit: 10, comment: "チェック 実施チェック1"
    t.date "ck_date2", comment: "チェック 日付2"
    t.string "ck_worker2", limit: 25, comment: "チェック 担当者2"
    t.string "ck_check2", limit: 10, comment: "チェック 実施チェック2"
    t.date "ck_date3", comment: "チェック 日付3"
    t.string "ck_worker3", limit: 25, comment: "チェック 担当者3"
    t.string "ck_check3", limit: 10, comment: "チェック 実施チェック3"
    t.date "ck_date4", comment: "チェック 日付4"
    t.string "ck_worker4", limit: 25, comment: "チェック 担当者4"
    t.string "ck_check4", limit: 10, comment: "チェック 実施チェック4"
    t.date "ck_date5", comment: "チェック 日付5"
    t.string "ck_worker5", limit: 25, comment: "チェック 担当者5"
    t.string "ck_check5", limit: 10, comment: "チェック 実施チェック5"
    t.date "ck_date6", comment: "チェック 日付6"
    t.string "ck_worker6", limit: 25, comment: "チェック 担当者6"
    t.integer "ck_count6", limit: 8, precision: 8, comment: "チェック 枚数6"
    t.string "ck_check6", limit: 10, comment: "チェック 実施チェック6"
    t.date "ck_date7", comment: "チェック 日付7"
    t.string "ck_worker7", limit: 25, comment: "チェック 担当者7"
    t.string "ck_check7", limit: 10, comment: "チェック 実施チェック7"
    t.string "ck_sign1", limit: 25, comment: "チェック サイン1"
    t.string "ck_sign2", limit: 25, comment: "チェック サイン2"
  end

  create_table "tr_result_price", id: false, comment: "実績単価_総合リスト", force: :cascade do |t|
    t.string "closeing_date", limit: 8, null: false, comment: "締日"
    t.string "item_code", limit: 25, null: false, comment: "品目コード"
    t.string "setkb", limit: 1, comment: "セット品区分"
    t.decimal "unit_price", precision: 8, scale: 2, comment: "ユニットプライス"
    t.string "currency_code", limit: 2, comment: "通貨コード"
    t.decimal "currency_rate", precision: 6, scale: 2, comment: "社内レート"
    t.string "inc_code", limit: 3, comment: "インコタームズコード"
    t.decimal "ttm_rate", precision: 6, scale: 2, comment: "TTMレート"
    t.decimal "buying_exchange_rate", precision: 6, scale: 2, comment: "実仕入・為替レート"
    t.integer "inc_rate", limit: 4, precision: 4, comment: "インコタームレート"
    t.string "kenshin_id", limit: 15, comment: "検針ID"
    t.integer "kenshin_cost", limit: 5, precision: 5, comment: "検針コスト"
    t.string "kenpin_id", limit: 15, comment: "検品ID"
    t.integer "kenpin_cost", limit: 5, precision: 5, comment: "検品コスト"
    t.string "pro_code1", limit: 5, comment: "加工コード1"
    t.integer "pro_price1", limit: 5, precision: 5, comment: "加工単価1"
    t.string "pro_code2", limit: 5, comment: "加工コード2"
    t.integer "pro_price2", limit: 5, precision: 5, comment: "加工単価2"
    t.string "pro_code3", limit: 5, comment: "加工コード3"
    t.integer "pro_price3", limit: 5, precision: 5, comment: "加工単価3"
    t.string "pro_code4", limit: 5, comment: "加工コード4"
    t.integer "pro_price4", limit: 5, precision: 5, comment: "加工単価4"
    t.string "mat_code1", limit: 5, comment: "資材コード1"
    t.decimal "mat_price1", precision: 7, scale: 2, comment: "資材単価1"
    t.string "mat_code2", limit: 5, comment: "資材コード2"
    t.decimal "mat_price2", precision: 7, scale: 2, comment: "資材単価2"
    t.string "mat_code3", limit: 5, comment: "資材コード3"
    t.decimal "mat_price3", precision: 7, scale: 2, comment: "資材単価3"
    t.string "mat_code4", limit: 5, comment: "資材コード4"
    t.decimal "mat_price4", precision: 7, scale: 2, comment: "資材単価4"
    t.string "ergo_code", limit: 10, comment: "エルゴ加工検品コード"
    t.decimal "ergo_price", precision: 6, scale: 2, comment: "エルゴ加工検品単価"
    t.string "imp_app_code", limit: 5, comment: "輸入アパレルコード"
    t.decimal "imp_app_price", precision: 6, scale: 2, comment: "輸入アパレル単価"
    t.decimal "real_price", precision: 19, scale: 2, comment: "実績単価"
    t.index ["closeing_date", "item_code"], name: "tr_result_price", unique: true
  end

  create_table "tr_result_price_170313_062408", id: false, force: :cascade do |t|
    t.string "closeing_date", limit: 8, null: false
    t.string "item_code", limit: 25, null: false
    t.string "setkb", limit: 1
    t.decimal "unit_price", precision: 8, scale: 2
    t.string "currency_code", limit: 2
    t.decimal "currency_rate", precision: 6, scale: 2
    t.string "inc_code", limit: 3
    t.decimal "ttm_rate", precision: 6, scale: 2
    t.decimal "buying_exchange_rate", precision: 6, scale: 2
    t.integer "inc_rate", limit: 4, precision: 4
    t.string "kenshin_id", limit: 15
    t.integer "kenshin_cost", limit: 5, precision: 5
    t.string "kenpin_id", limit: 15
    t.integer "kenpin_cost", limit: 5, precision: 5
    t.string "pro_code1", limit: 5
    t.integer "pro_price1", limit: 5, precision: 5
    t.string "pro_code2", limit: 5
    t.integer "pro_price2", limit: 5, precision: 5
    t.string "pro_code3", limit: 5
    t.integer "pro_price3", limit: 5, precision: 5
    t.string "pro_code4", limit: 5
    t.integer "pro_price4", limit: 5, precision: 5
    t.string "mat_code1", limit: 5
    t.decimal "mat_price1", precision: 7, scale: 2
    t.string "mat_code2", limit: 5
    t.decimal "mat_price2", precision: 7, scale: 2
    t.string "mat_code3", limit: 5
    t.decimal "mat_price3", precision: 7, scale: 2
    t.string "mat_code4", limit: 5
    t.decimal "mat_price4", precision: 7, scale: 2
    t.string "ergo_code", limit: 10
    t.decimal "ergo_price", precision: 6, scale: 2
    t.string "imp_app_code", limit: 5
    t.decimal "imp_app_price", precision: 6, scale: 2
    t.decimal "real_price", precision: 19, scale: 2
  end

  create_table "tr_result_price_aaa", id: false, force: :cascade do |t|
    t.string "closeing_date", limit: 8, null: false
    t.string "item_code", limit: 25, null: false
    t.string "setkb", limit: 1
    t.decimal "unit_price", precision: 8, scale: 2
    t.string "currency_code", limit: 2
    t.decimal "currency_rate", precision: 6, scale: 2
    t.string "inc_code", limit: 3
    t.decimal "ttm_rate", precision: 6, scale: 2
    t.decimal "buying_exchange_rate", precision: 6, scale: 2
    t.integer "inc_rate", limit: 4, precision: 4
    t.string "kenshin_id", limit: 15
    t.integer "kenshin_cost", limit: 5, precision: 5
    t.string "kenpin_id", limit: 15
    t.integer "kenpin_cost", limit: 5, precision: 5
    t.string "pro_code1", limit: 5
    t.integer "pro_price1", limit: 5, precision: 5
    t.string "pro_code2", limit: 5
    t.integer "pro_price2", limit: 5, precision: 5
    t.string "pro_code3", limit: 5
    t.integer "pro_price3", limit: 5, precision: 5
    t.string "pro_code4", limit: 5
    t.integer "pro_price4", limit: 5, precision: 5
    t.string "mat_code1", limit: 5
    t.decimal "mat_price1", precision: 7, scale: 2
    t.string "mat_code2", limit: 5
    t.decimal "mat_price2", precision: 7, scale: 2
    t.string "mat_code3", limit: 5
    t.decimal "mat_price3", precision: 7, scale: 2
    t.string "mat_code4", limit: 5
    t.decimal "mat_price4", precision: 7, scale: 2
    t.string "ergo_code", limit: 10
    t.decimal "ergo_price", precision: 6, scale: 2
    t.string "imp_app_code", limit: 5
    t.decimal "imp_app_price", precision: 6, scale: 2
    t.decimal "real_price", precision: 19, scale: 2
  end

  create_table "tr_return_log", comment: "返品処理履歴", force: :cascade do |t|
    t.string "arrived_date", limit: 10, comment: "着荷日"
    t.string "delivery_trader", limit: 50, comment: "配送業者"
    t.string "owner_code", limit: 50, default: " ", comment: "荷主コード"
    t.string "owner_name", limit: 100, default: " ", comment: "お客様名"
    t.string "cutoff_date", limit: 50, comment: "締日"
    t.string "sales_person", limit: 50, default: " ", comment: "担当営業"
    t.string "inquiry_no", limit: 20, comment: "問い合わせ貨物番号"
    t.integer "boxes_count", limit: 6, precision: 6, comment: "小口数"
    t.integer "peace_count", limit: 6, precision: 6, comment: "ピース数"
    t.string "returned_date", limit: 10, comment: "返品作業日"
    t.string "input_person", limit: 50, comment: "作業者"
    t.string "comment_note", limit: 200, comment: "備考"
    t.string "return_book", limit: 100, comment: "返品確認書"
    t.string "status", limit: 50, comment: "作業進捗"
    t.index ["arrived_date"], name: "idx_return_log001"
    t.index ["owner_code"], name: "idx_return_log002"
    t.index ["status"], name: "idx_return_log003"
  end

  create_table "tr_return_log_150911", id: false, force: :cascade do |t|
    t.integer "id", limit: 8, precision: 8
    t.string "arrived_date", limit: 10
    t.string "delivery_trader", limit: 50
    t.string "owner_code", limit: 50
    t.string "owner_name", limit: 100
    t.string "cutoff_date", limit: 50
    t.string "sales_person", limit: 50
    t.string "inquiry_no", limit: 20
    t.integer "boxes_count", limit: 6, precision: 6
    t.string "returned_date", limit: 10
    t.string "input_person", limit: 50
    t.string "comment_note", limit: 200
    t.string "return_book", limit: 100
    t.string "status", limit: 50
  end

  create_table "wk_kaikeiden", id: false, force: :cascade do |t|
    t.string "伝票区分", limit: 1
    t.string "決済処理フラグ", limit: 1
    t.string "伝票日付", limit: 6
    t.string "伝票番号", limit: 20
    t.string "行番号", limit: 3
    t.string "借方部門コード", limit: 10
    t.string "借方科目コード", limit: 8
    t.string "借方補助科目コード", limit: 8
    t.string "借方金額", limit: 11
    t.string "借方消費税額", limit: 10
    t.string "借方消費税計算区分", limit: 1
    t.string "借方税区分", limit: 2
    t.string "借方事業区分", limit: 1
    t.string "貸方部門コード", limit: 4
    t.string "貸方科目コード", limit: 8
    t.string "貸方補助科目コード", limit: 8
    t.string "貸方金額", limit: 11
    t.string "貸方消費税額", limit: 10
    t.string "貸方消費税計算区分", limit: 1
    t.string "貸方税区分", limit: 2
    t.string "貸方事業区分", limit: 1
    t.string "摘要名", limit: 40
  end

  add_synonym "cldmta", "dad_usr1.cldmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "clsmta", "dad_usr1.clsmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "cmatha", "dad_usr1.cmatha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "cmatra", "dad_usr1.cmatra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "csptra", "dad_usr1.csptra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "cspwra", "dad_usr1.cspwra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "cspwrb", "dad_usr1.cspwrb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "cystha", "dad_usr1.cystha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "cystra", "dad_usr1.cystra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "drsum_hintk", "dad_work.drsum_hintk@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "drsum_zaikowk", "dad_work.drsum_zaikowk@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ebptha", "dad_usr1.ebptha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ebptra", "dad_usr1.ebptra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ecatha", "dad_usr1.ecatha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ecatra", "dad_usr1.ecatra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ecctha", "dad_usr1.ecctha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ecctra", "dad_usr1.ecctra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ectmta", "dad_usr1.ectmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "edamta", "dad_usr1.edamta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ediwra", "dad_usr1.ediwra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "epttha", "dad_usr1.epttha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "eptthb", "dad_usr1.eptthb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "eptthc", "dad_usr1.eptthc@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "eptthd", "dad_usr1.eptthd@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "epttra", "dad_usr1.epttra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "epttrb", "dad_usr1.epttrb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "epttrc", "dad_usr1.epttrc@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "epttrd", "dad_usr1.epttrd@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "erbmta", "dad_usr1.erbmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "erpmta", "dad_usr1.erpmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "erqmta", "dad_usr1.erqmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "eswtra", "dad_usr1.eswtra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "etrmta", "dad_usr1.etrmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "exptha", "dad_usr1.exptha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "expthb", "dad_usr1.expthb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "expthc", "dad_usr1.expthc@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "expthd", "dad_usr1.expthd@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "expthe", "dad_usr1.expthe@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "exptra", "dad_usr1.exptra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "exptrb", "dad_usr1.exptrb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "exptrc", "dad_usr1.exptrc@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "exptrd", "dad_usr1.exptrd@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "exptre", "dad_usr1.exptre@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "fctmta", "dad_usr1.fctmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "fctmtb", "dad_usr1.fctmtb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "fctmtc", "dad_usr1.fctmtc@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "frymta", "dad_usr1.frymta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "gaitha", "dad_usr1.gaitha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "gaitra", "dad_usr1.gaitra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "gnksma", "dad_usr1.gnksma@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "gnksmb", "dad_usr1.gnksmb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "gnksmc", "dad_usr1.gnksmc@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "gnktra", "dad_usr1.gnktra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "gnktrb", "dad_usr1.gnktrb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "gnktrc", "dad_usr1.gnktrc@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "gnktrd", "dad_usr1.gnktrd@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "gnktre", "dad_usr1.gnktre@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "gnkwra", "dad_usr1.gnkwra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "hdnsma", "dad_usr1.hdnsma@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "hdntha", "dad_usr1.hdntha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "hdntra", "dad_usr1.hdntra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "hinjancd", "dad_usr1.hinjancd@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "hinmta", "dad_usr1.hinmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "hinmtb", "dad_usr1.hinmtb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "hinsma", "dad_usr1.hinsma@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "hinsmb", "dad_usr1.hinsmb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "hkktha", "dad_usr1.hkktha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "hkktra", "dad_usr1.hkktra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "hnymta", "dad_usr1.hnymta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "hsltrc", "dad_usr1.hsltrc@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "hsltrd", "dad_usr1.hsltrd@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "hstmta", "dad_usr1.hstmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "hsttha", "dad_usr1.hsttha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "hstthc", "dad_usr1.hstthc@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "hstthd", "dad_usr1.hstthd@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "hsttra", "dad_usr1.hsttra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "hsttrb", "dad_usr1.hsttrb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "hsttrc", "dad_usr1.hsttrc@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "hsttrd", "dad_usr1.hsttrd@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "idntha", "dad_usr1.idntha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "idntra", "dad_usr1.idntra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "idotha", "dad_usr1.idotha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "idothb", "dad_usr1.idothb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "idotra", "dad_usr1.idotra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "idotrb", "dad_usr1.idotrb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "jdnsma", "dad_usr1.jdnsma@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "jdntha", "dad_usr1.jdntha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "jdntra", "dad_usr1.jdntra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "jdntrb", "dad_usr1.jdntrb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "jdntre", "dad_usr1.jdntre@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "jhdtha", "dad_usr1.jhdtha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "jhdtra", "dad_usr1.jhdtra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kbkmta", "dad_usr1.kbkmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kbkmtc", "dad_usr1.kbkmtc@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kbmmta", "dad_usr1.kbmmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kcftha", "dad_usr1.kcftha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kcftra", "dad_usr1.kcftra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kcomta", "dad_usr1.kcomta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kerwra", "dad_usr1.kerwra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kgtmta", "dad_usr1.kgtmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "khfmta", "dad_usr1.khfmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "khfmtb", "dad_usr1.khfmtb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "khfmtc", "dad_usr1.khfmtc@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "khhmta", "dad_usr1.khhmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "khhmtb", "dad_usr1.khhmtb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "khhmtc", "dad_usr1.khhmtc@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "khhmtd", "dad_usr1.khhmtd@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "khhtha", "dad_usr1.khhtha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "khhtra", "dad_usr1.khhtra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "khstha", "dad_usr1.khstha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "khstra", "dad_usr1.khstra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kkdtha", "dad_usr1.kkdtha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kkdtra", "dad_usr1.kkdtra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kkhmtb", "dad_usr1.kkhmtb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kkhtha", "dad_usr1.kkhtha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kkhtra", "dad_usr1.kkhtra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kksmtb", "dad_usr1.kksmtb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kkstha", "dad_usr1.kkstha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kkstra", "dad_usr1.kkstra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kmkmta", "dad_usr1.kmkmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kmkmtb", "dad_usr1.kmkmtb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kmkmtc", "dad_usr1.kmkmtc@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "knkmta", "dad_usr1.knkmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "knrmta", "dad_usr1.knrmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kplmta", "dad_usr1.kplmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kplmtb", "dad_usr1.kplmtb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "krstha", "dad_usr1.krstha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "krstra", "dad_usr1.krstra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ksbmta", "dad_usr1.ksbmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ksdtha", "dad_usr1.ksdtha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ksdtra", "dad_usr1.ksdtra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ksnmta", "dad_usr1.ksnmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ksnmtb", "dad_usr1.ksnmtb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ksnmtc", "dad_usr1.ksnmtc@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ksnmtd", "dad_usr1.ksnmtd@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ksspra", "dad_usr1.ksspra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kswtha", "dad_usr1.kswtha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kswtra", "dad_usr1.kswtra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ksymta", "dad_usr1.ksymta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ksymte", "dad_usr1.ksymte@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ktgmta", "dad_usr1.ktgmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ktgmtc", "dad_usr1.ktgmtc@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ktnmta", "dad_usr1.ktnmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ktnmtb", "dad_usr1.ktnmtb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ktrmta", "dad_usr1.ktrmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ktrmtb", "dad_usr1.ktrmtb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ktutha", "dad_usr1.ktutha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ktutra", "dad_usr1.ktutra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ktztra", "dad_usr1.ktztra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kuhtha", "dad_usr1.kuhtha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kuhtra", "dad_usr1.kuhtra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kuhtrb", "dad_usr1.kuhtrb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kuhtrc", "dad_usr1.kuhtrc@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kuhtrd", "dad_usr1.kuhtrd@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kuhtre", "dad_usr1.kuhtre@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kuktha", "dad_usr1.kuktha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kuktra", "dad_usr1.kuktra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kysmta", "dad_usr1.kysmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kysmtb", "dad_usr1.kysmtb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kzemta", "dad_usr1.kzemta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kzemtb", "dad_usr1.kzemtb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kzemtd", "dad_usr1.kzemtd@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kzetha", "dad_usr1.kzetha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kzethb", "dad_usr1.kzethb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "kzetrb", "dad_usr1.kzetrb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "lotmta", "dad_usr1.lotmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "lotthb", "dad_usr1.lotthb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "lottra", "dad_usr1.lottra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "lottrb", "dad_usr1.lottrb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "lotwra", "dad_usr1.lotwra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "maker_zaiko", "dad_work.drsum_zaikowk@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "mapmta", "dad_usr1.mapmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "mapmtc", "dad_usr1.mapmtc@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "mapmtd", "dad_usr1.mapmtd@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "mapmte", "dad_usr1.mapmte@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "mapmtf", "dad_usr1.mapmtf@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "mapmtg", "dad_usr1.mapmtg@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "mdntha", "dad_usr1.mdntha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "mdntra", "dad_usr1.mdntra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "mrperr", "dad_usr1.mrperr@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "mrpmta", "dad_usr1.mrpmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "mrpwra", "dad_usr1.mrpwra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "mrpwrb", "dad_usr1.mrpwrb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "mrpwrc", "dad_usr1.mrpwrc@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "mrpwrd", "dad_usr1.mrpwrd@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "mrpwre", "dad_usr1.mrpwre@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "mrpwrf", "dad_usr1.mrpwrf@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "mrpwrg", "dad_usr1.mrpwrg@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "mrpwrh", "dad_usr1.mrpwrh@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ndntha", "dad_usr1.ndntha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ndntra", "dad_usr1.ndntra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "nhsmta", "dad_usr1.nhsmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "npltra", "dad_usr1.npltra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "npltrb", "dad_usr1.npltrb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "npltrc", "dad_usr1.npltrc@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "npltrd", "dad_usr1.npltrd@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "odltra", "dad_usr1.odltra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "odntha", "dad_usr1.odntha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "odntra", "dad_usr1.odntra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "prjmta", "dad_usr1.prjmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "prjtra", "dad_usr1.prjtra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "prjtrb", "dad_usr1.prjtrb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "psbtra", "dad_usr1.psbtra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "psbtrb", "dad_usr1.psbtrb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "psotra", "dad_usr1.psotra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "psotrb", "dad_usr1.psotrb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "psptra", "dad_usr1.psptra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "rnkmta", "dad_usr1.rnkmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "rnkmtb", "dad_usr1.rnkmtb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "sagmta", "dad_usr1.sagmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "sagmtb", "dad_usr1.sagmtb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "sagmtc", "dad_usr1.sagmtc@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "sagwra", "dad_usr1.sagwra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "saltra", "dad_usr1.saltra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "satmta", "dad_usr1.satmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "satmtb", "dad_usr1.satmtb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "scrtha", "dad_usr1.scrtha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "scrtra", "dad_usr1.scrtra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "sdntha", "dad_usr1.sdntha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "sdntra", "dad_usr1.sdntra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "sgsmta", "dad_usr1.sgsmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "shytha", "dad_usr1.shytha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "shytra", "dad_usr1.shytra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "sihmta", "dad_usr1.sihmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "sirmta", "dad_usr1.sirmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "sirmtb", "dad_usr1.sirmtb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "sirsma", "dad_usr1.sirsma@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "sirssa", "dad_usr1.sirssa@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "sirtra", "dad_usr1.sirtra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "sismta", "dad_usr1.sismta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "sistha", "dad_usr1.sistha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "sistra", "dad_usr1.sistra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "skhtha", "dad_usr1.skhtha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "skhtra", "dad_usr1.skhtra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "skktha", "dad_usr1.skktha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "skkthb", "dad_usr1.skkthb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "skktra", "dad_usr1.skktra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "skktrb", "dad_usr1.skktrb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "skltra", "dad_usr1.skltra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "skltrb", "dad_usr1.skltrb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "skomta", "dad_usr1.skomta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "skysma", "dad_usr1.skysma@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "skytha", "dad_usr1.skytha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "skythb", "dad_usr1.skythb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "skythc", "dad_usr1.skythc@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "skythd", "dad_usr1.skythd@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "skytra", "dad_usr1.skytra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "skytrb", "dad_usr1.skytrb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "skytrc", "dad_usr1.skytrc@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "skytrd", "dad_usr1.skytrd@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "smdtha", "dad_usr1.smdtha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "smdtra", "dad_usr1.smdtra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "smltra", "dad_usr1.smltra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "soumta", "dad_usr1.soumta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "soumtb", "dad_usr1.soumtb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ssamta", "dad_usr1.ssamta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ssbtra", "dad_usr1.ssbtra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ssbtrb", "dad_usr1.ssbtrb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ssdtra", "dad_usr1.ssdtra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ssftra", "dad_usr1.ssftra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ssgtra", "dad_usr1.ssgtra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ssjtra", "dad_usr1.ssjtra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ssltra", "dad_usr1.ssltra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ssotra", "dad_usr1.ssotra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ssotrb", "dad_usr1.ssotrb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ssptra", "dad_usr1.ssptra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ssstha", "dad_usr1.ssstha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "sssthb", "dad_usr1.sssthb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ssstra", "dad_usr1.ssstra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ssstrb", "dad_usr1.ssstrb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "swjtra", "dad_usr1.swjtra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "swjtrb", "dad_usr1.swjtrb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "swkmta", "dad_usr1.swkmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "swkmtb", "dad_usr1.swkmtb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "swkmtc", "dad_usr1.swkmtc@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "swkmtd", "dad_usr1.swkmtd@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "swkmte", "dad_usr1.swkmte@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "swkmtf", "dad_usr1.swkmtf@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "swkmtg", "dad_usr1.swkmtg@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "swkmth", "dad_usr1.swkmth@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "swkmti", "dad_usr1.swkmti@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "swkmtj", "dad_usr1.swkmtj@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "swkmtk", "dad_usr1.swkmtk@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "swkmtl", "dad_usr1.swkmtl@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "swkmtm", "dad_usr1.swkmtm@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "swktra", "dad_usr1.swktra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "systba", "dad_usr1.systba@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "systbb", "dad_usr1.systbb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "systbc", "dad_usr1.systbc@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "systbd", "dad_usr1.systbd@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "systbf", "dad_usr1.systbf@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "systbg", "dad_usr1.systbg@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "systbh", "dad_usr1.systbh@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "systbi", "dad_usr1.systbi@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "systbj", "dad_usr1.systbj@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "systbk", "dad_usr1.systbk@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "systbl", "dad_usr1.systbl@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "tenmta", "dad_usr1.tenmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "tenmtb", "dad_usr1.tenmtb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "tnatha", "dad_usr1.tnatha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "tnatra", "dad_usr1.tnatra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "tnawra", "dad_usr1.tnawra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "tokmta", "dad_usr1.tokmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "tokmtb", "dad_usr1.tokmtb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "tokmtd", "dad_usr1.tokmtd@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "toksma", "dad_usr1.toksma@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "tokssa", "dad_usr1.tokssa@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "tosmta", "dad_usr1.tosmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "tostha", "dad_usr1.tostha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "tostra", "dad_usr1.tostra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "udltra", "dad_usr1.udltra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "udntha", "dad_usr1.udntha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "udntra", "dad_usr1.udntra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "udntre", "dad_usr1.udntre@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ukstha", "dad_usr1.ukstha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "ukstra", "dad_usr1.ukstra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "untmta", "dad_usr1.untmta@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "untmtb", "dad_usr1.untmtb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "usdtha", "dad_usr1.usdtha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "usdtra", "dad_usr1.usdtra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "uwstra", "dad_usr1.uwstra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "view_zaiko2", "dad_usr1.view_zaiko@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "wmitha", "dad_usr1.wmitha@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "wmitra", "dad_usr1.wmitra@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "zaisma", "dad_usr1.zaisma@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "zaismb", "dad_usr1.zaismb@orcl.regress.rdbms.dev.us.oracle.com", force: true
  add_synonym "zaitra", "dad_usr1.zaitra@orcl.regress.rdbms.dev.us.oracle.com", force: true

end
