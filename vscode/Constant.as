//COPYRIGHT="All Rights Reserved Copyright 2011-2012(C) Toyota Communication systems."
//SRC_VERSION=01.00.00
/*
 * ExDBV2
 *
 * ファイル名      ：Constant.as
 * ファイル説明    ：共通定数クラス
 * 更新履歴    更新日        担当者           内容
 * 01.00.00    20101130      Ma-Tanaka        新規作成
 * 01.00.01    20120315      SS-Kato          データ4S対応
 * 01.00.02    20120626      Usol-V(KhaiDH)   ExDBV2改修
 * 01.00.03    20130723      USOL-V(TuanPT)   PDM改善(Officeドキュメントの拡張子対応)
 * 01.01.00    20140306      野村(TCS)        不具合改修(ログイン・ログアウト：サムネイル)
 * 01.01.00    20140318      TCS-Sakamoto     Officeドキュメントのマクロ拡張子対応
 * 01.02.00    20140414      SS-Tatematsu     不具合改修(Drag&Drop)
 * 01.02.00    20140429      USOL-V(NguyetNT) ExDBライセンス管理
 * 01.02.00    20140604      TCS-Otake        モジュールダウンロード対応
 * 01.02.01    20140808      SS-Tatematsu     EDP-NEO連携対応
 * 01.02.99    20141226      tatematsu        カタログデータ対応カスタマイズ（プロト）
 * 01.02.XX    20141226      tatematsu        カタログデータ対応カスタマイズ（チェックアウトマクロ起動)
 * 01.02.XY    20150216      SS鈴木雅         カタログデータ対応カスタマイズ(STEP1)
 * 01.02.XY    20150520      SS鈴木雅         カタログデータ対応カスタマイズ(STEP2)
 * 01.02.00    20150609      TCI-Otake        ツリーの一階層展開対応
 * 01.02.XZ    20150731      misozumi         カタログデータ対応カスタマイズ ".catalog" のファイルタイプ化
 * 01.02.XZ    20160122      SS-Onishi        カタログデータ対応取込のオプション分割対応
 * 01.03.01    20160705      SS-Kondoh        EDP-NEO連携 自動更新のみの呼び出し対応
 */
package com.toyota_cs.sagyo.common.util
{
    import flash.filesystem.File;

    /**
     * 共通定数クラス
     * システム共通定数を定義
     * 全ての定数は「public static const」にて宣言すること。
     */
    public class Constant
    {

        /** ファイル情報Drag&Drop時の認証キー */
        public static const DRAG_AND_DROP_FILE_KEY:String = "GV2D001";    // 01.02.00 追加　

        // 開始 追加 2013/1/17 USOL-V(ThoVD) PDM改善(サムネイル表示)
        /** サムネイルオプション */
        public static const OPTION_THUMBNAIL:int = 47;

        // 終了 追加 2013/1/17 USOL-V(ThoVD) PDM改善(サムネイル表示)

        // 開始 追加 2012/06/29 USOL-V(VinhND) ExDBV2改修
        /** 置き換え許可フラグ */
        public static const ALLOWED_REPLACE_FLAG_OFF:String = "OFF";

        // 終了 追加 2012/06/29 USOL-V(VinhND) ExDBV2改修

        /** 文字列 true */
        public static const TRUE:String = "true";

        /** 文字列 false */
        public static const FALSE:String = "false";

        /** 文字列 ok */
        public static const OK:String = "ok";

        /** 文字列 cancel */
        public static const CANCEL:String = "cancel";

        /** 文字列 close_button */
        public static const CLOSE_BUTTON:String = "close_button";

        /** ローカルのパス区切り文字:"\" */
        public static const LOCAL_PATH_SEPARATOR:String = "\\";

        /** サーバデータのフォルダパス区切り文字:"/" */
        public static const FOLDER_PATH_SEPARATOR:String = "/";

        /** 文字列 ? */
        public static const LITERAL_QUESTION:String = "?";

        /** 文字列 \r */
        public static const LITERAL_BACKSLASH_R:String = "\r";

        /** 文字列 \n */
        public static const LITERAL_BACKSLASH_N:String = "\n";

        /** 文字列 \r\n */
        public static const LITERAL_BACKSLASH_R_BACKSLASH_N:String = "\r\n";

        /** 文字列 " */
        public static const LITERAL_DOUBLE_QUOTATION:String = "\"";

        /** 文字列 "" */
        public static const LITERAL_TWO_DOUBLE_QUOTATIONS:String = "\"\"";

        // --- エラーコード

        /** ファイルまたはディレクトリへのアクセスが拒否された際のエラーコード */
        public static const ERR_CD_FILE_DIR_ACCESS_DENIED:int = 3001;

        // --- システム情報

        /** 言語コード:日本語 */
        public static const LANGUAGE_CODE_JAPANESE:String = "ja";

        /** 言語コード:英語 */
        public static const LANGUAGE_CODE_ENGLISH:String = "en";

        /** ログイン時に使用する国コード */
        public static const LOGIN_CONTRY_CODE:String = "JP";

        // コマンドライン引数

        /** ExDB_EE連携オプション */
        public static const CMD_ARG_EXDBEE_OPTION:String = "-edm";

        /** コマンドライン引数:機能モード チェックイン */
        public static const CMD_ARG_CHECKIN:String = "-s";

        /** コマンドライン引数:機能モード 個別チェックイン */
        public static const CMD_ARG_INDIVIDUAL_CHECKIN:String = "-se";

        /** コマンドライン引数:機能モード 一括チェックイン(プロダクト) */
        public static const CMD_ARG_PACK_CHECKIN_PRODUCT:String = "-ss";

        /** コマンドライン引数:機能モード 新旧リビジョン同時比較 */
        public static const CMD_ARG_COMP_OLD_NEW_REVISION:String = "-vd";

        /** コマンドライン引数:機能モード チェックアウト状態編集 */
        public static const CMD_ARG_EDIT_CHECKOOUT_STATE:String = "-ec";

        /** コマンドライン引数:機能モード 進捗画面表示 */
        public static const CMD_ARG_PROGRESSBOX_SHOW:String = "-pb";

        /** コマンドライン引数:機能モード 進捗画面 メッセージ1行出力 */
        public static const CMD_ARG_PROGRESSBOX_PRINT_MESSAGE:String = "-pbpm";

        /** コマンドライン引数:機能モード 進捗画面 タイトル設定 */
        public static const CMD_ARG_PROGRESSBOX_SET_TITLE:String = "-pbst";

        /** コマンドライン引数:機能モード 進捗画面 進捗終了移行 */
        public static const CMD_ARG_PROGRESSBOX_FINISH:String = "-pbfn";

        /** コマンドライン引数:CAD種類 CATIA */
        public static const CMD_ARG_CAD_TYPE_CATIA:String = "-catia";

        /** コマンドライン引数:CAD種類 NX */
        public static const CMD_ARG_CAD_TYPE_NX:String = "-nx";

        /** コマンドライン引数:CAD種類 ProE */
        public static const CMD_ARG_CAD_TYPE_PROE:String = "-proe";

// 01.02.01 ADD START
        /** コマンドライン引数:EDP連携 参照 */
        public static const CMD_ARG_EDP_REF:String = "-re";

        /** コマンドライン引数:EDP連携 ダウンロード */
        public static const CMD_ARG_EDP_DWN:String = "-do";
// 01.02.01 ADD END

// 01.03.00 20160705 Add START 
        /** コマンドライン引数:EDP連携 アップデートのみ */
        public static const CMD_ARG_EDP_UPD:String = "-updexit";
// 01.03.00 20160705 Add END

        //01.02.XY ADD START
        /** コマンドライン引数:カタログデータ対応カスタマイズ：CAA連携_データダウンロード */
        public static const CMD_ARG_SP_CAA_DL:String = "-spexcdl";

        /** コマンドライン引数:カタログデータ対応カスタマイズ：マクロ起動処理 事前チェック */
        public static const CMD_ARG_SP_REF_CAB_CHK:String = "-sprefcabchk";

        /** コマンドライン引数:カタログデータ対応カスタマイズ：チェックアウト */
        public static const CMD_ARG_SP_CATTBC_CHECKOUT:String = "-spcattbcco";

        /** コマンドライン引数:カタログデータ対応カスタマイズ：マクロ起動参照 */
        public static const CMD_ARG_SP_CATTBC_REFERENCE:String = "-spcattbcref";

        /** コマンドライン引数:カタログデータ対応カスタマイズ：マクロ起動構成要素追加 */
        public static const CMD_ARG_SP_CATTBC_ADDCOMP:String = "-spcattbcaddcomp";

        /** コマンドライン引数:カタログデータ対応カスタマイズ：マクロ起動処理 事後クリーンアップ */
        public static const CMD_ARG_SP_REF_CLNUP:String = "-spcleanup";
        //01.02.XY ADD END

        // --- 文字コード

        /** シフトJIS **/
        public static const CHARSET_SJIS:String = "shift-jis";

        /** UTF-8 **/
        public static const CHARSET_UTF8:String = "utf-8";

        // --- 禁則文字

        /** XML禁則文字 */
        public static const ILLEGAL_CHARACTERS_XML:String = "[\\\\/:;*?\"<>|,']";

        /** 禁則文字 */
        public static const ILLEGAL_CHARACTERS:String = "[!\"#$%&\\\\'\(\)=\~\^|\`@\{\}[\\]<>;:\+\*,\.?\/]";

        /** データ名禁則文字 */
        public static const ILLEGAL_CHARACTERS_DATA_NAME:String = "[\\\\/:,;*?\"<>|]";

        /** ファイル名禁則文字 */
        public static const ILLEGAL_CHARACTERS_FILE_NAME:String = "[\\\\/:\t]";

        /** ユーザID禁則文字 */
        public static const ILLEGAL_CHARACTERS_USERID:String = "[\\\\/:;*?\"<>|&']";

        /** パスワード禁則文字 */
        public static const ILLEGAL_CHARACTERS_PASSWORD:String = "[\\\\/:;*?\"<>|&']";

        // --- エラーパターンの正規表現
        /** キャビネット名_エラーパターンの正規表現 */
        public static const REGEX_CABINET_NAME:String = "^[^\\.]{0,1}$|^[^\\.].*[^\\.]$";

        // --- 表示値

        /** エラー */
        public static const SIGN_ERROR:String = "O";

        /** 参照 */
        public static const SIGN_REFERENCE:String = "O";

        /** チェックアウト */
        public static const SIGN_CHECKOUT:String = "CL";

        /** ロック */
        public static const SIGN_LOCK:String = "L";

        /** 他チェックアウト */
        public static const SIGN_OTHER_CHECKOUT:String = "O_CL";

        /** 他ロック */
        public static const SIGN_OTHER_LOCK:String = "O_L";

        /** 開示対象 */
        public static const SIGN_DISCLOSE_YES:String = "Yes";

        /** 開示非対象 */
        public static const SIGN_DISCLOSE_NO:String = "No";

        /** デフォルトフラグ */
        public static const SIGN_DEFAULT_FLG:String = "O";

        /** 固有フラグ */
        public static const SIGN_PROPER_FLG:String = "O";

        /** 置換マーク */
        public static const SIGN_GRATER_THAN:String = ">";

        // --- アプリインストール配下構成のフォルダ情報

        /** アプリ領域 bin フォルダパス. 末端に階層区切り文字はつきません. */
        public static const APPDIR_BIN:String = File.applicationDirectory.resolvePath("bin").nativePath;

        /** アプリ領域 conf フォルダパス. 末端に階層区切り文字はつきません. */
        public static const APPDIR_CONF:String = File.applicationDirectory.resolvePath("conf").nativePath;

        /** アプリ領域 logs フォルダパス. 末端に階層区切り文字はつきません. */
        public static const APPDIR_LOGS:String = File.applicationDirectory.resolvePath("logs").nativePath;

        /** アプリ領域 temp フォルダパス. 末端に階層区切り文字はつきません. */
        public static const APPDIR_TEMP:String = File.applicationDirectory.resolvePath("temp").nativePath;

        /** アプリ領域 update フォルダパス. 末端に階層区切り文字はつきません. */
        public static const APPDIR_UPDATE:String = File.applicationDirectory.resolvePath("update").nativePath;

        /** アプリ領域 data フォルダパス. 末端に階層区切り文字はつきません. */
        public static const APPDIR_DATA:String = File.applicationDirectory.resolvePath("data").nativePath;

        /** アプリ領域 カレントフォルダパス. 末端に階層区切り文字はつきません. */
        public static const APPDIR_CURRENT:String = File.applicationDirectory.nativePath;

        /** フォルダパス最大長（フォルダ作成可能） */
        public static const FOLDERPATH_MAXLEN:int = 247;

        /** フルパス最大長（ファイル作成可能） */
        public static const FILEPATH_MAXLEN:int = 259;

        // 各種ファイル名

        /** オープンリストファイル */
        public static const FILE_NAME_CATIAOPENINFO:String = APPDIR_TEMP + File.separator + "CATIAOpenInfo.txt";

        /** チェックアウトリストファイル */
        public static const FILE_NAME_CHECKOUTFILELIST:String = APPDIR_TEMP + File.separator + "CheckoutFileList.txt";

        /** CATIAバージョンチェック作成待ちファイル */
        public static const FILE_NAME_CHECKVERSIONFILE:String = APPDIR_TEMP + File.separator + "chkCatiaVersion.txt";

        /** マクロ開始判定ファイル */
        public static const FILE_NAME_STARTSTATUS:String = APPDIR_TEMP + File.separator + "startStatus.txt";

        /** オープン状況判定ファイル */
        public static const FILE_NAME_CHECKOUTSTATUS:String = APPDIR_TEMP + File.separator + "checkoutStatus0.txt";

        /** キャッシュ情報ファイル */
        public static const FILE_NAME_CATIAINFO:String = APPDIR_TEMP + File.separator + "CATIAInfo.txt";

        /** オープン情報一時ファイル */
        public static const FILE_NAME_OPENINFO_TMP:String = APPDIR_TEMP + File.separator + "OpenInfo.tmp";

        /** オープン情報ファイル */
        public static const FILE_NAME_OPENINFO:String = APPDIR_TEMP + File.separator + "OpenInfo.txt";

        /** ロードデータファイル */
        public static const FILE_NAME_LOAD_DATA:String = APPDIR_TEMP + File.separator + "loadDataStart.txt";

        /** AddWindow情報ファイル */
        public static const FILE_NAME_ADD_WINDOW:String = APPDIR_TEMP + File.separator + "addWindow.xml";

        /** CATIA管理ファイル */
        public static const FILE_NAME_CATIAMANAGE:String = APPDIR_LOGS + File.separator + "CATMngFile.txt";

        /** チェックファイル */
        public static const FILE_NAME_CHECKSTART:String = APPDIR_TEMP + File.separator + "ChkStart.txt";

        /** チェックアウト情報ファイル */
        public static const FILE_NAME_CHECKOUTINFO:String = APPDIR_CONF + File.separator + "CheckoutInfo.xml";

        /** チェックアウトファイル拡張子 */
        public static const FILE_EXTENTION_CHECKOUT:String = ".checkout";

        /** 新旧リビジョン指示ファイル **/
        public static const FILE_NAME_DIFFORDER:String = APPDIR_TEMP + File.separator + "DiffOrder.xml";

        // --- NXファイル
        /** NxOpenInfo.txtファイル */
        public static const FILE_NAME_NXOPENINFO:String = APPDIR_TEMP + File.separator + "NxOpenInfo.txt";

        /** オープン情報一時ファイル */
        public static const FILE_NAME_NXOPENINFO_TMP:String = APPDIR_TEMP + File.separator + "NxOpenInfo.tmp";

        /** NxManage.txtファイル */
        public static const FILE_NAME_NXMANAGE:String = APPDIR_TEMP + File.separator + "NxManage.txt";

        /** NXバージョンチェック作成待ちファイル */
        public static const FILE_NAME_CHECKNXVERSIONFILE:String = APPDIR_TEMP + File.separator + "chkNXVersion.txt";

        // --- ProEファイル
        /** ProEOpenInfo.txtファイル */
        public static const FILE_NAME_PROEOPENINFO:String = APPDIR_TEMP + File.separator + "ProeOpenInfo.txt";

        /** ProEManage.txtファイル */
        public static const FILE_NAME_PROEMANAGE:String = APPDIR_TEMP + File.separator + "ProeManage.txt";

        /** ProEバージョンチェック作成待ちファイル */
        public static const FILE_NAME_CHECKPROEVERSIONFILE:String = APPDIR_TEMP + File.separator + "chkProeVersion.txt";

        /** ProE起動待ちファイル */
        public static const FILE_NAME_PROCESSOPENFILE:String = APPDIR_TEMP + File.separator + "StartProE.txt";

        // CATIAマクロ名

        /** バージョンチェック */
        public static const CATIA_MACRO_NAME_VERSION_CHECK:String = "ClMacro" + File.separator + "ExDB2_ChkCATIAVer.CATScript";

        /** 起動中確認 */
        public static const CATIA_MACRO_NAME_CHECK_START:String = "ClMacro" + File.separator + "ExDB2_ChkStart.CATScript";

        /** オープン判定 */
        public static const CATIA_MACRO_NAME_CHECK_OPEN:String = "ClMacro" + File.separator + "ExDB2_ChkOpn.CATScript";

        /** チェックアウト */
        public static const CATIA_MACRO_NAME_EXECUTE_CHECKOUT:String = "ClMacro" + File.separator + "ExDB2_LoadData.CATScript";

        /** 構成要素追加 */
        public static const CATIA_MACRO_NAME_ADD_COMPONENT:String = "ClMacro" + File.separator + "ExDB2_AddWindow.CATScript";

        /** 一括チェックイン */
        public static const CATIA_MACRO_NAME_MASS_CHECKIN:String = "ClMacro" + File.separator + "ExDB2_AllAddCL.CATScript";

        /** CATIA終了 */
        public static const CATIA_MACRO_CLOSE_CATIA:String = "ClMacro" + File.separator + "ExDB2_CATIAQuit.CATScript";

        /** CATIAオープン */
        public static const CATIA_MACRO_OPEN:String = "ClMacro" + File.separator + "ExDB2_OPENCOData.CATScript";

        /** XMLファイルヘッダ部(Shift-JIS) */
        public static const XML_HEDER_SHIFT_JIS:String = '<?xml version="1.0" encoding="Shift_JIS"?>';

        /** XMLファイルヘッダ部(UTF-8) */
        public static const XML_HEDER_SHIFT_UTF8:String = '<?xml version="1.0" encoding="utf-8"?>';

        /** CATIAオープンbat(V5.batが存在しない場合こちらにて起動する) */
        public static const CATIA_CALL_START:String = "callStartCatia.bat";

        // --- NXマクロ名

        /** オープン判定 */
        public static const NX_MACRO_NAME_CHECK_OPEN:String = "CallExlProcessNXChkOpn.bat";

        /** クローズ */
        public static const NX_MACRO_CLOSE_NX:String = "CallExlProcessNXClose.bat";

        /** バージョンチェック */
        public static const NX_MACRO_NAME_VERSION_CHECK:String = "CallExlProcessCheckNXVersion.bat";

        /** チェックアウト */
        public static const NX_MACRO_NAME_EXECUTE_CHECKOUT:String = "CallExlProcessNXLoadData.bat";

        /** 起動中確認 */
        public static const NX_MACRO_NAME_CHECK_START:String = "CallExlProcessNXStart.bat";

        /** NXオープン_チェックアウト済みファイルオープン */
        public static const NX_MACRO_OPEN:String = "CallExlProcessNXOpenCOData.bat";

        /** NX構成要素追加 */
        public static const NX_MACRO_NAME_ADD_COMPONENT:String = "CallExlProcessNXAddWindow.bat";

        /** NX起動 */
        public static const NX_MACRO_START:String = "CallExlNXStart.bat";

        /** 一括チェックイン */
        public static const NX_MACRO_NAME_MASS_CHECKIN:String = "CallExlProcessNXAllAddCL.bat";

        /** ProEマクロ パラメタにて呼びわける */
        public static const PROE_MACRO_BIN:String = "EDNProeExt.exe";

        /** ProEマクロ CADバージョンチェック */
        public static const PROE_MACRO_OPTION_CHECK_VERSION:String = "-cv";

        /** ProEマクロ ProE起動中確認 */
        public static const PROE_MACRO_OPTION_CHECK_START:String = "-cs";

        /** ProEマクロ チェックアウト */
        public static const PROE_MACRO_OPTION_CHECKOUT:String = "-oi";

        /** ProEマクロ 参照 */
        public static const PROE_MACRO_OPTION_LOAD:String = "-ld";

        /** ProEマクロ チェックアウトリスト */
        public static const PROE_MACRO_OPTION_OPEN_CHECKLIST:String = "-cd";

        /** ProEマクロ 構成要素追加 */
        public static const PROE_MACRO_OPTION_ADD_WINDOW:String = "-aw";

        /** ProEマクロ ローカルファイルインポート */
        public static const PROE_MACRO_OPTION_ADD_ALL:String = "-ac";

        /** ProEマクロ クローズ(非表示プロセス終了) */
        public static const PROE_MACRO_OPTION_END_LINK:String = "-el";

        /** ProEマクロ オープン */
        public static const PROE_MACRO_OPTION_OPEN:String = "-sp";

        /** ProEマクロ クローズ */
        public static const PROE_MACRO_OPTION_CLOSE:String = "-kp";

// 01.02.01 ADD START
        // --- EDP
        /** EDP 品番表示画面 */
        public static const EDP_DISP_PRODUCT_NO_EXE:String = "DispProductNo.exe";
// 01.02.01 ADD END

        /*******************************************************************************
         * DB定数
         *******************************************************************************/

        // --- SYSTEMTBLのオプションIndex

        /** 製品オプション(XVL/EDMICS) */
        public static const OPTION_PRODUCT:int = 0;

        /** ACLオプション */
        public static const OPTION_ACL:int = 1;

        /** Ceisar連携オプション */
        public static const OPTION_CEISAR_COOPERATE:int = 2;

        /** 公開連携オプション */
        public static const OPTION_OPEN_COOPERATE:int = 3;

        /** 直参/キャッシュオプション */
        public static const OPTION_DIRECTREFER_CACHE:int = 4;

        /** レプリケーションオプション */
        public static const OPTION_REPLICATION:int = 5;

        /** 参考送付オプション */
        public static const OPTION_SEND_REFERENCE:int = 6

        /** CATAnalysisオプション */
        public static const OPTION_CAT_ANALYSIS:int = 7;

        /** CATProcessオプション */
        public static const OPTION_CAT_PROCESS:int = 8;

        /** 更新通知オプション */
        public static const OPTION_NOTICE:int = 9;

        /** 棚チェックオプション */
        public static const OPTION_TANA_CHECK:int = 10;

        /** 2DLオプション */
        public static const OPTION_2DL:int = 11;

        /** EDPオプション */
        public static const OPTION_EDP:int = 12;

        /** 最終参照日時オプション */
        public static const OPTION_LAST_REFERENCE_DATE:int = 13;

        /** リスト出力オプション */
        public static const OPTION_OUTPUT_LIST:int = 14;

        /** 作成者変更オプション */
        public static const OPTION_CHANGE_CREATOR:int = 15;

        /** 削除レスポンスアップオプション */
        public static const OPTION_DELETE_RESPONSEUP:int = 16;

        /** 日本語使用オプション */
        public static const OPTION_USE_JAPANESE:int = 17;

        /** XVLデフォルトオプション */
        public static const OPTION_XVL_DEFAULT:int = 18;

        /** 履歴リミッタオプション */
        public static const OPTION_REVISION_LIMITER:int = 19;

        /** セッション強化オプション */
        public static const OPTION_TEMPERD_SESSION:int = 20;

        /** ライセンス開放オプション */
        public static const OPTION_RELEASE_LICENSE:int = 21;

        /** 一括ダウンロードオプション */
        public static const OPTION_DOWNLOAD_ALL:int = 22;

        /** チェックイン種類の初期値(RevisionUp/Replace) */
        public static const OPTION_CHECKIN_KIND_DEFAULT:int = 23

        /** チェックイン終了時の初期値(Checkin & End/Checkin) */
        public static const OPTION_CHECKIN_END_DEFAULT:int = 24;

        /** 強制ログインオプション */
        public static const OPTION_FORCE_LOGIN:int = 25;

        /** ファイル更新禁止オプション */
        public static const OPTION_PROHIBITION_UPDATE_DILE:int = 26;

        /** 設計移管オプション */
        public static const OPTION_DESIGN_TRANSDER:int = 27;

        /** 棚データ保存オプション */
        public static const OPTION_SAVE_TANA_DATA:int = 28;

        /** 2DLアイコン表示オプション */
        public static const OPTION_DISPLAY_2DL_ICON:int = 29;

        /** パスワード管理オプション */
        public static const OPTION_PASSWORD_MANAGEMENT:int = 30;

        /** DES連携オプション */
        public static const OPTION_DES_COOPERATE:int = 31;

        /** XVL変換方式フラグ */
        public static const OPTION_XVL_MODE:int = 32;

        /** チェックインリトライオプション */
        public static const OPTION_RETRY_CHECKIN:int = 33;

        /** リビジョン取得モードオプション(選択リビジョン/最新リビジョン) */
        public static const OPTION_GET_REVISION_MODE:int = 34;

        /** TIFF変換フラグ */
        public static const OPTION_TIFF_MODE:int = 35;

        /** ExDB_EE連携オプション */
        public static const OPTION_TOGO:int = 36;

        /** 成果物管理オプション */
        public static const OPTION_DOCUMENT_MANAGEMENT:int = 37;

        /** 承認オプション */
        public static const OPTION_APPROVAL:int = 38;

        /** フォルダ変更オプション */
        public static const OPTION_REGIST_FOLDERNAME_CHENG:int = 39;

        /** 属性登録オプション */
        public static const OPTION_REGIST_USR_ATTR:int = 40;

        /** CAD複数バージョン対応 */
        public static const OPTION_CAD_MACRO_SELECTABLE:int = 41;

        /** NXオプション */
        public static const OPTION_NX:int = 42;

        /** ExDB_EE連携オプション */
        public static const OPTION_EXDBEE_COOPERATE:int = 43;

        /** ProEオプション */
        public static const OPTION_PROE:int = 45;

        /** TIFF変換デフォルトオプション */
        public static const OPTION_TIFF_CONVERT_DEFAULT:int = 44;

        /** ツリー展開オプション */
        public static const OPTION_TREE_EXPAND:int = 50;

        // Add 01.02.XZ Start カタログデータ対応取込のオプション分割対応
        /** カタログデータオプション */
        public static const OPTION_CTLG_DATA:int = 51;

        /** ローカルファイルインポート機能拡張オプション */
        public static const OPTION_LOCAL_FILE_IMPORT_EXTENSION:int = 52;
        // Add 01.02.XZ End カタログデータ対応取込のオプション分割対応

        /** TIFF専用Vaultオプション */
        public static const OPTION_TIFF_VAULT:int = 54;

        // ---SYSTEMTBLのオプション値
        /** オプション値:OFF */
        public static const OPTION_VALUE_OFF:String = "0";

        /** オプション値:ON */
        public static const OPTION_VALUE_ON:String = "1";

        /** 製品オプション:XVL */
        public static const OPTION_VALUE_PRODUCT_XVL:String = "XVL";

        /** 製品オプション:XVL EDMICS */
        public static const OPTION_VALUE_PRODUCT_XVL_EDMICS:String = "XVL EDMICS";

        /** XVL変換デフォルト設定ON */
        public static const OPTION_VALUE_XVL_DEFAULT_ON:String = "ON";

        /** XVL変換デフォルト設定ON */
        public static const OPTION_VALUE_XVL_DEFAULT_OFF:String = "OFF";

        /** チェックイン種類の初期値:未設定 */
        public static const OPTION_VALUE_CHECKIN_KIND_DEFAULT_OFF:String = "OFF";

        /** チェックイン種類の初期値:上書き */
        public static const OPTION_VALUE_CHECKIN_KIND_DEFAULT_REPLACE:String = "REPLACE";

        /** チェックイン種類の初期値:リビジョンアップ */
        public static const OPTION_VALUE_CHECKIN_KIND_DEFAULT_REVUP:String = "REVUP";

        /** チェックイン終了時の初期値:未設定 */
        public static const OPTION_VALUE_CHECKIN_END_DEFAULT_OFF:String = "OFF";

        /** チェックイン終了時の初期値:継続 */
        public static const OPTION_VALUE_CHECKIN_END_DEFAULT_CONT:String = "CONT";

        /** チェックイン終了時の初期値:完了 */
        public static const OPTION_VALUE_CHECKIN_END_DEFAULT_END:String = "END";

        /** 成果物管理:OFF */
        public static const OPTION_VALUE_DOCUMENT_MANAGEMENT_OFF:String = "0";

        /** 成果物管理:ON(押印あり) */
        public static const OPTION_VALUE_DOCUMENT_MANAGEMENT_PUT_IN:String = "1";

        /** 成果物管理:ON(押印なし) */
        public static const OPTION_VALUE_DOCUMENT_MANAGEMENT_NOT_PUT_IN:String = "2";

        /** 承認オプション:OFF */
        public static const OPTION_APPROVAL_OFF:String = "0";

        /** 承認オプション:ON(TIFF変換あり) */
        public static const OPTION_APPROVAL_ON_TIFF:String = "1";

        /** 承認オプション:ON(TIFF変換なし) */
        public static const OPTION_APPROVAL_ON_NOT_TIFF:String = "2";

        // 開始 追加 2012/06/20 USOL-V(VinhND) ExDBV2改修
        /** ”0” デフォルトOFF(旧変換方式) */
        public static const OPTION_XVL_MODE_OFF:String = "0";

        /** VDECS変換マネージャ使用(新変換方式) */
        public static const OPTION_XVL_MODE_VDECS:String = "1";

        /** TMC変換マネージャ使用(新変換方式) */
        public static const OPTION_XVL_MODE_TMC:String = "2";

        // 終了 追加 2012/06/20 USOL-V(VinhND) ExDBV2改修

        /** ツリー展開オプション:全展開 */
        public static const OPTION_TREE_EXPAND_ALL:String = "0";

        /** ツリー展開オプション:一階層展開 */
        public static const OPTION_TREE_EXPAND_ONELV:String = "1";

        // Add 01.02.XZ Start カタログデータ対応取込のオプション分割対応

        /** カタログデータオプション:OFF */
        public static const OPTION_GTLG_DATA_OFF:String = "0";

        /** カタログデータオプション:ON */
        public static const OPTION_GTLG_DATA_ON:String = "1";

        /** ローカルファイルインポート機能拡張オプション:OFF */
        public static const OPTION_LOCAL_FILE_IMPORT_EXTENSION_OFF:String = "0";

        /** ローカルファイルインポート機能拡張オプション:ON */
        public static const OPTION_LOCAL_FILE_IMPORT_EXTENSION_ON:String = "1";
        // Add 01.02.XZ End カタログデータ対応取込のオプション分割対応

        // --- ユーザ権限ID

        /** ユーザ権限ID:キャビネット管理・Vault設定権 */
        public static const USER_PRIV_ID_CABINET_FOLDER:String = "CABINET_FOLDER";

        /** ユーザ権限ID:論理削除権 */
        public static const USER_PRIV_ID_FILE_DELETE:String = "FILE_DELETE";

        /** ユーザ権限ID:物理削除権 */
        public static const USER_PRIV_ID_FILE_P_DELETE:String = "FILE_P_DELETE";

        /** ユーザ権限ID:ファイル更新禁止 */
        public static const USER_PRIV_ID_FILE_UPDATE_INHIBIT:String = "FILE_UPDATE_INHIBIT";

        /** ユーザ権限ID:フォルダ容量制限設定権 */
        public static const USER_PRIV_ID_FOLDER_SIZE_LIMIT:String = "FOLDER_SIZE_LIMIT";

        /** ユーザ権限ID:強制アクセス権 */
        public static const USER_PRIV_ID_FORCE_ACCESS:String = "FORCE_ACCESS";

        /** ユーザ権限ID:排他強制解除権 */
        public static const USER_PRIV_ID_FORCE_CANCEL:String = "FORCE_CANCEL";

        /** ユーザ権限ID:インポート・エクスポート実行権 */
        public static const USER_PRIV_ID_IMPORT_EXPORT:String = "IMPORT_EXPORT";

        /** ユーザ権限ID:ユーザ属性テンプレート作成権 */
        public static const USER_PRIV_ID_MAKE_TEMPLATE:String = "MAKE_TEMPLATE";

        /** ユーザ権限ID:Vault管理権 */
        public static const USER_PRIV_ID_MANAGE_VAULT:String = "MANAGE_VAULT";

        /** ユーザ権限ID:XVL管理権 */
        public static const USER_PRIV_ID_MANAGE_XVL:String = "MANAGE_XVL";

        /** ユーザ権限ID:XVL変換権 */
        public static const USER_PRIV_ID_M_XVL_CONVERSION:String = "M_XVL_CONVERSION";

        /** ユーザ権限ID:デザインスペース設定権 */
        public static const USER_PRIV_ID_OPE_DS:String = "OPE_DS";

        /** ユーザ権限ID:一括ダウンロード権 */
        public static const USER_PRIV_ID_PACK_DOWNLOAD:String = "PACK_DOWNLOAD";

        /** ユーザ権限ID:パスワード変更権 */
        public static const USER_PRIV_ID_PASSWORD:String = "PASSWORD";

        /** ユーザ権限ID:検索条件ファイル設定権 */
        public static const USER_PRIV_ID_SEARCH_COND:String = "SEARCH_COND";

        /** ユーザ権限ID:セッション・ログ管理権 */
        public static const USER_PRIV_ID_SESSION_LOG:String = "SESSION_LOG";

        /** ユーザ権限ID:アクセス権限設定権 */
        public static const USER_PRIV_ID_SET_ACCESS:String = "SET_ACCESS";

        /** ユーザ権限ID:PowerCopy設定権 */
        public static const USER_PRIV_ID_SET_POWERCOPY:String = "SET_POWERCOPY";

        /** ユーザ権限ID:ユーザ属性追加削除権 */
        public static const USER_PRIV_ID_UPDATE_USRATTR:String = "UPDATE_USRATTR";

        /** ユーザ権限ID:ユーザ・グループ設定権 */
        public static const USER_PRIV_ID_USER_GROUP:String = "USER_GROUP";

        /** ユーザ権限ID:バックアップ権 */
        public static const USER_PRIV_ID_BACKUP:String = "BACKUP";

        /** ユーザ権限ID:ダウンロード権 */
        public static const USER_PRIV_ID_DOWNLOAD:String = "DOWNLOAD";

        /** ユーザ権限ID:ファイルリスト出力権 */
        public static const USER_PRIV_ID_OUT_FILELIST:String = "OUT_FILELIST";

        /** ユーザ権限ID:システム情報設定権 */
        public static const USER_PRIV_ID_SYSTEM_INFO_SET:String = "SYSTEM_INFO_SET";

        // 開始 追加 2012/06/26 USOL-V(KhoiBV) ExDBV2改修
        /** ユーザ権限ID:User Privilege APPROVAL */
        public static const USER_PRIV_ID_APPROVAL:String = "Z01_APPROVAL";

        /** ユーザ権限ID:User Privilege EXAMINATION */
        public static const USER_PRIV_ID_EXAMINATION:String = "Z00_EXAMINATION";

        // 終了 追加 2012/06/26 USOL-V(KhoiBV) ExDBV2改修

        // --- フォルダタイプ


        /** フォルダタイプ【キャビネット】 */
        public static const FOLDER_TYPE_CABINET:String = "0";

        /** フォルダタイプ【通常】 */
        public static const FOLDER_TYPE_NORMAL:String = "1";

        /** フォルダタイプ【パワーコピー】 */
        public static const FOLDER_TYPE_POWERCOPY:String = "3";

        /** フォルダタイプ【標準デザインスペース】 */
        public static const FOLDER_TYPE_BASIC_DS:String = "5";

        /** フォルダタイプ【作業デザインスペース】 */
        public static const FOLDER_TYPE_WORK_DS:String = "9";

        // --- ファイルタイプ


        /** ファイルタイプ【お化けファイル】 **/
        public static const FILE_TYPE_GHOST:String = "-1";

        /** ファイルタイプ【unknown】 */
        public static const FILE_TYPE_UNKNOWN:String = "0";

        /** ファイルタイプ【CATPRDT】 */
        public static const FILE_TYPE_CATPRDT:String = "1";

        /** ファイルタイプ【CATPART】 */
        public static const FILE_TYPE_CATPART:String = "2";

        /** ファイルタイプ【Excel Document】 */
        public static const FILE_TYPE_XLS:String = "3";

        /** ファイルタイプ【Text Document】 */
        public static const FILE_TYPE_TXT:String = "4";

        /** ファイルタイプ【XVL Shape File】 */
        public static const FILE_TYPE_XVL_S:String = "5";

        /** ファイルタイプ【XVL Assembly File】 */
        public static const FILE_TYPE_XVL_A:String = "6";

        /** ファイルタイプ【Word Document】 */
        public static const FILE_TYPE_DOC:String = "7";

        /** ファイルタイプ【JPEG Image】 */
        public static const FILE_TYPE_JPG:String = "8";

        /** ファイルタイプ【BITMAP Image】 */
        public static const FILE_TYPE_BMP:String = "9";

        /** ファイルタイプ【Acrobat PDF】 */
        public static const FILE_TYPE_PDF:String = "10";

        /** ファイルタイプ【GIF Image】 */
        public static const FILE_TYPE_GIF:String = "11";

        /** ファイルタイプ【Power Point】 */
        public static const FILE_TYPE_PPT:String = "12";

        /** ファイルタイプ【CATDRAW】 */
        public static const FILE_TYPE_CATDRAW:String = "13";

        /** ファイルタイプ【POWER COPY】 */
        public static const FILE_TYPE_POWER_COPY:String = "14";

        /** ファイルタイプ【CATPROCESS】 */
        public static const FILE_TYPE_CATPROCESS:String = "15";

        /** ファイルタイプ【CGR】 */
        public static const FILE_TYPE_CGR:String = "16";

        /** ファイルタイプ【LNK】 */
        public static const FILE_TYPE_LNK:String = "17";

        /** ファイルタイプ【V-XVL Shape File】 */
        public static const FILE_TYPE_V_XVL_S:String = "18";

        /** ファイルタイプ【P-XVL Shape File】 */
        public static const FILE_TYPE_P_XVL_S:String = "19";

        /** ファイルタイプ【P-XVL Assembly File】 */
        public static const FILE_TYPE_P_XVL_A:String = "20";

        /** ファイルタイプ【V-XVL Shape File 2】 */
        public static const FILE_TYPE_V_XVL_S2:String = "21";

        /** ファイルタイプ【V-XVL Assembly File】 */
        public static const FILE_TYPE_V_XVL_A:String = "22";

        /** ファイルタイプ【DesignTable-text】 */
        public static const FILE_TYPE_DT_TXT:String = "23";

        /** ファイルタイプ【DesignTable-excel】 */
        public static const FILE_TYPE_DT_XLS:String = "24";

        /** ファイルタイプ【TIFF(一般ファイル)】 */
        public static const FILE_TYPE_TIFF_GNLC:String = "25";

        /** ファイルタイプ【TIFF(CADファイル)】 */
        public static const FILE_TYPE_TIFF_CAD:String = "26";

        /** ファイルタイプ【CATAnalysis】 */
        public static const FILE_TYPE_CATANALYSIS:String = "27";

        /** ファイルタイプ【CATAnalysisResult】 */
        public static const FILE_TYPE_CATRSLT:String = "28";

        /** ファイルタイプ【CATCGR】 */
        public static const FILE_TYPE_CATCGR:String = "30";

        /** ファイルタイプ【2DL】 */
        public static const FILE_TYPE_2DL:String = "31";

        /** ファイルタイプ【PRT】 */
        public static const FILE_TYPE_PRT:String = "32";

        /** ファイルタイプ【SPREADSHEET_EXCEL】 */
        public static const FILE_TYPE_SPREADSHEET_EXCEL:String = "33";

        /** ファイルタイプ【SPREADSHEET_CSV】 */
        public static const FILE_TYPE_SPREADSHEET_CSV:String = "34";

        /** ファイルタイプ【JT】 */
        public static const FILE_TYPE_JT:String = "35";

        /** ファイルタイプ【CSV】 */
        public static const FILE_TYPE_CSV:String = "36";

        /** ファイルタイプ【ASM(ProE)】 */
        public static const FILE_TYPE_PROE_ASM:String = "37";

        /** ファイルタイプ【PRT(ProE)】 */
        public static const FILE_TYPE_PROE_PRT:String = "38";

        /** ファイルタイプ【DRW(ProE)】 */
        public static const FILE_TYPE_PROE_DRW:String = "39";

        // 開始 追加 2013/07/23 USOL-V(TuanPT) PDM改善(Officeドキュメントの拡張子対応)
        /** ファイルタイプ【ExcelX Document】 */
        public static const FILE_TYPE_XLSX:String = "40";

        /** ファイルタイプ【WordX Document】 */
        public static const FILE_TYPE_DOCX:String = "41";

        /** ファイルタイプ【Power PointX】 */
        public static const FILE_TYPE_PPTX:String = "42";

        /** ファイルタイプ【DesignTable-excelx】 */
        public static const FILE_TYPE_DT_XLSX:String = "43";

        /** ファイルタイプ【SPREADSHEET_EXCELX】 */
        public static const FILE_TYPE_SPREADSHEET_EXCELX:String = "44";

        // 終了 追加 2013/07/23 USOL-V(TuanPT) PDM改善(Officeドキュメントの拡張子対応)

        //開始　Officeドキュメントのマクロ拡張子対応

        /** ファイルタイプ【ExcelM Document】 */
        public static const FILE_TYPE_XLSM:String = "45";

        /** ファイルタイプ【WordM Document】 */
        public static const FILE_TYPE_DOCM:String = "46";

        /** ファイルタイプ【Power PointM】 */
        public static const FILE_TYPE_PPTM:String = "47";

        /** ファイルタイプ【DesignTable-excelm】 */
        public static const FILE_TYPE_DT_XLSM:String = "48";

        /** ファイルタイプ【SPREADSHEET_EXCELX】 */
        public static const FILE_TYPE_SPREADSHEET_EXCELM:String = "49";
        //終了　Officeドキュメントのマクロ拡張子対応

        /** ファイルタイプ【Catalog Text Document】 */
        public static const FILE_TYPE_CATALOG_TEXT_DOCUMENT:String = "50";

        /** ファイルタイプ【ALL】 */
        public static const FILE_TYPE_ALL:String = "99";

        // 開始 追加 2012/06/29 USOL-V(VinhND) ExDBV2改修
        // ---ファイルタイプ名
        /** ファイルタイプ名【unknown】 - FileTypeId0 */
        public static const FILETYPENAME_UNKNOW:String = "unknown";

        /** ファイルタイプ名【CATPRDT】 - FileTypeId1 */
        public static const FILETYPENAME_CATPRDT:String = "CATPRDT";

        /** ファイルタイプ名【CATPART】 - FileTypeId2 */
        public static const FILETYPENAME_CATPART:String = "CATPart";

        /** ファイルタイプ名【Excel document】 - FileTypeId3 */
        public static const FILETYPENAME_XLS:String = "Excel Document";

        // 開始 追加 2013/07/23 USOL-V(TuanPT) PDM改善(Officeドキュメントの拡張子対応)
        /** ファイルタイプ名【Excel document】 - FileTypeId40 */
        public static const FILETYPENAME_XLSX:String = "Excel Document";

        // 終了 追加 2013/07/23 USOL-V(TuanPT) PDM改善(Officeドキュメントの拡張子対応)

        /** ファイルタイプ名【TXT】 - FileTypeId4 */
        public static const FILETYPENAME_TXT_DOCUMENT:String = "Text Document";

        /** ファイルタイプ名【XVL Shape File】  - FileTypeId5*/
        public static const FILETYPENAME_XVL_S:String = "XVL Shape File";

        /** ファイルタイプ名【XVL Assembly File】  - FileTypeId6*/
        public static const FILETYPENAME_XVL_A:String = "XVL Assembly File";

        /** ファイルタイプ名【Word Document】  - FileTypeId7*/
        public static const FILETYPENAME_DOC:String = "Word Document";

        // 開始 追加 2013/07/23 USOL-V(TuanPT) PDM改善(Officeドキュメントの拡張子対応)
        /** ファイルタイプ名【Word Document】  - FileTypeId41*/
        public static const FILETYPENAME_DOCX:String = "Word Document";

        // 終了 追加 2013/07/23 USOL-V(TuanPT) PDM改善(Officeドキュメントの拡張子対応)

        /** ファイルタイプ名【JPEG Image】  - FileTypeId8*/
        public static const FILETYPENAME_JPG:String = "JPEG Image";

        /** ファイルタイプ名【BITMAP Image】  - FileTypeId9*/
        public static const FILETYPENAME_BMP:String = "BITMAP Image";

        /** ファイルタイプ名【Acrobat PDF】  - FileTypeId10*/
        public static const FILETYPENAME_PDF:String = "Acrobat PDF";

        /** ファイルタイプ名【GIF Image】  - FileTypeId11*/
        public static const FILETYPENAME_GIF:String = "GIF Image";

        /** ファイルタイプ名【Power Point】  - FileTypeId12*/
        public static const FILETYPENAME_PPT:String = "Power Point";

        // 開始 追加 2013/07/23 USOL-V(TuanPT) PDM改善(Officeドキュメントの拡張子対応)
        /** ファイルタイプ名【Power Point】  - FileTypeId42*/
        public static const FILETYPENAME_PPTX:String = "Power Point";

        // 終了 追加 2013/07/23 USOL-V(TuanPT) PDM改善(Officeドキュメントの拡張子対応)

        /** ファイルタイプ名【CATDRAW】 - FileTypeId13 */
        public static const FILETYPENAME_CATDRAW:String = "CATDRAW";

        /** ファイルタイプ名【POWER COPY】 - FileTypeId14 */
        public static const FILETYPENAME_POWERCOPY:String = "POWER COPY";

        /** ファイルタイプ名【CATPROC】 - FileTypeId15 */
        public static const FILETYPENAME_CATPROC:String = "CATPROC";

        /** ファイルタイプ名【CGR】  - FileTypeId16*/
        public static const FILETYPENAME_CGR:String = "CGR";

        /** ファイルタイプ名【LNK】  - FileTypeId17*/
        public static const FILETYPENAME_LNK:String = "LNK";

        /** ファイルタイプ名【V-XVL Shape File】  - FileTypeId18*/
        public static const FILETYPENAME_V_XVL_S:String = "V-XVL Shape File";

        /** ファイルタイプ名【P-XVL Shape File】  - FileTypeId19*/
        public static const FILETYPENAME_P_XVL_S:String = "P-XVL Shape File";

        /** ファイルタイプ名【P-XVL Assembly File】  - FileTypeId20*/
        public static const FILETYPENAME_P_XVL_A:String = "P-XVL Assembly File";

        /** ファイルタイプ名【V-XVL Shape File 2】  - FileTypeId21*/
        public static const FILETYPENAME_V_XVL_S2:String = "V-XVL Shape File 2";

        /** ファイルタイプ名【V-XVL Assembly File】  - FileTypeId22*/
        public static const FILETYPENAME_V_XVL_A:String = "V-XVL Assembly File";

        /** ファイルタイプ名【DesignTable-text】 - FileTypeId23 */
        public static const FILETYPENAME_DESIGNTABLE_TEXT:String = "DesignTable-text";

        /** ファイルタイプ名【DesignTable-excel】 - FileTypeId24 */
        public static const FILETYPENAME_DESIGNTABLE_EXCEL:String = "DesignTable-excel";

        // 開始 追加 2013/07/23 USOL-V(TuanPT) PDM改善(Officeドキュメントの拡張子対応)
        /** ファイルタイプ名【DesignTable-excel】 - FileTypeId43 */
        public static const FILETYPENAME_DESIGNTABLE_EXCELX:String = "DesignTable-excel";

        // 終了 追加 2013/07/23 USOL-V(TuanPT) PDM改善(Officeドキュメントの拡張子対応)

        /** ファイルタイプ名【TIFF(一般ファイル)】  - FileTypeId25*/
        public static const FILETYPENAME_TIFF_GNLC:String = "TIFF";

        /** ファイルタイプ名【CAD LINK TIFF】 - FileTypeId26 */
        public static const FILETYPENAME_CADLINKTIFF:String = "CAD LINK TIFF";

        /** ファイルタイプ名【CATANALYSIS】 - FileTypeId27 */
        public static const FILETYPENAME_CATANALYSIS:String = "CATANALYSIS";

        /** ファイルタイプ名【CATRSLT】 - FileTypeId28 */
        public static const FILETYPENAME_CATRSLT:String = "CATRSLT";

        /** ファイルタイプ名【CATCGR】 - FileTypeId30 */
        public static const FILETYPENAME_CATCGR:String = "CATCGR";

        /** ファイルタイプ名【PRT】 - FileTypeId32 */
        public static const FILETYPENAME_PRT:String = "PRT";

        /** ファイルタイプ名【SPREADSHEET-EXCEL】 - FileTypeId33 */
        public static const FILETYPENAME_SPREADSHEETEXCEL:String = "SPREADSHEET-EXCEL";

        // 開始 追加 2013/07/23 USOL-V(TuanPT) PDM改善(Officeドキュメントの拡張子対応)
        /** ファイルタイプ名【SPREADSHEET-EXCEL】 - FileTypeId44 */
        public static const FILETYPENAME_SPREADSHEETEXCELX:String = "SPREADSHEET-EXCEL";

        // 終了 追加 2013/07/23 USOL-V(TuanPT) PDM改善(Officeドキュメントの拡張子対応)

        /** ファイルタイプ名【SPREADSHEET-CSV】 - FileTypeId34 */
        public static const FILETYPENAME_SPREADSHEETCSV:String = "SPREADSHEET-CSV";

        /** ファイルタイプ名【JT】 - FileTypeId35 */
        public static const FILETYPENAME_JT:String = "JT";

        /** ファイルタイプ名【ASM(ProE)】 - FileTypeId37 */
        public static const FILETYPENAME_PROE_ASM:String = "ASM(ProE)";

        /** ファイルタイプ名【PRT(ProE)】 - FileTypeId38 */
        public static const FILETYPENAME_PROE_PRT:String = "PRT(ProE)";

        /** ファイルタイプ名【DRW(ProE)】 - FileTypeId39 */
        public static const FILETYPENAME_PROE_DRW:String = "DRW(ProE)";

        //開始　Officeドキュメントのマクロ拡張子対応

        /** ファイルタイプ名【Excel document】 - FileTypeId45 */
        public static const FILETYPENAME_XLSM:String = "Excel Document";

        /** ファイルタイプ名【Word Document】  - FileTypeId46*/
        public static const FILETYPENAME_DOCM:String = "Word Document";

        /** ファイルタイプ名【Power Point】  - FileTypeId47*/
        public static const FILETYPENAME_PPTM:String = "Power Point";

        /** ファイルタイプ名【DesignTable-excel】 - FileTypeId48 */
        public static const FILETYPENAME_DESIGNTABLE_EXCELM:String = "DesignTable-excel";

        /** ファイルタイプ名【SPREADSHEET-EXCEL】 - FileTypeId49 */
        public static const FILETYPENAME_SPREADSHEET_EXCELM:String = "SPREADSHEET-EXCEL";
        //終了　Officeドキュメントのマクロ拡張子対応

        /** ファイルタイプ名【CATALOG_TEXT_DOCUMENT】 - FileTypeId 50 */
        public static const FILETYPENAME_CATALOG_TEXT_DOCUMENT:String = "Catalog Text Document";

        /** ファイルタイプ【ALL】 - FileTypeId99 */
        public static const FILETYPENAME_ALL:String = "ALL";

        // 終了 追加 2012/06/29 USOL-V(VinhND) ExDBV2改修

        // ---ロック種別
        /** ロック種別【個人設計】 **/
        public static const FOR_PERSONAL_DESIGN:String = "0";

        /** ロック種別【共同設計】 **/
        public static const FOR_JOINT_DESIGN:String = "1";

        // ---ロック状態

        /** ロック状態【ロックなし】**/
        public static const LOCK_STATE_OFF:String = "0";

        /** ロック状態【ロックあり】**/
        public static const LOCK_STATE_ON:String = "1";

        /** ロック状態【ロック不可】**/
        public static const LOCK_STATE_DISABLED:String = "2";

        /** ロック状態【ロック不可（自ロック中）】**/
        public static const LOCK_STATE_ON_DISABLED:String = "3";

        // --チェックアウト状態

        /** チェックアウト状態:チェックアウト **/
        public static const CHECKOUT_STATUS_CHECKOUT:String = "1";

        /** チェックアウト状態：チェックアウト以外 **/
        public static const CHECKOUT_STATUS_CHECKOUTCANCEL:String = "0";

        // ---アクセス状態

        /** アクセス状態【通常】**/
        public static const ACCESS_STATE_NOMAL:String = "0"

        /** アクセス状態【排他参照】**/
        public static const ACCESS_STATE_EXCLUSION_REFERENCE:String = "1"

        /** アクセス状態【排他更新】**/
        public static const ACCESS_STATE_EXCLUSION_UPDATE:String = "2"

        /** アクセス状態【凍結】**/
        public static const ACCESS_STATE_FREEZE:String = "3"

        // 削除フラグ
        /** 削除フラグ【未削除】 */
        public static const DEL_FLG_OFF:String = "0";

        /** 削除フラグ【削除】 */
        public static const DEL_FLG_ON:String = "1";

        // --- フラグ値

        /** 強制ログイン【初回(強制ログインチェックあり)】 */
        public static const FORCE_LOGIN_FIRST:String = "0";

        /** 強制ログイン【2回目(チェックなしで強制ログインする)】 */
        public static const FORCE_LOGIN_SECOND:String = "1";

        /** リビジョンフィルター【オフ】 */
        public static const REVISION_FILTER_OFF:String = "off";

        /** リビジョンフィルター【オン】 */
        public static const REVISION_FILTER_ON:String = "on";

        /** 旧リビジョン【表示】 */
        public static const OLD_REVISION_VISIBLE:String = STATUS_SELECTED_REVISION;

        /** 旧リビジョン【非表示】 */
        public static const OLD_REVISION_INVISIBLE:String = STATUS_LATEST_REVISION;

        /** ステータス(リビジョンタイプ)【選択されたリビジョン】 */
        public static const STATUS_SELECTED_REVISION:String = "0";

        /** ステータス(リビジョンタイプ)【最新リビジョン】 */
        public static const STATUS_LATEST_REVISION:String = "1";

        /** ステータス(リビジョンタイプ)【タグ指定】 */
        public static const STATUS_SPECIFY_TAG:String = "2";

        /** 削除フラグ【通常】 */
        public static const DEL_FLG_NORMAL:String = "0";

        /** 削除フラグ【論理削除】 */
        public static const DEL_FLG_DELETE:String = "1";

        /** 子フォルダ有無フラグ【子なし】 */
        public static const CHILD_FLG_NOT_EXIST:String = "0";

        /** 子フォルダ有無フラグ【子あり】 */
        public static const CHILD_FLG_EXIST:String = "1";

        /** 2DLフラグ【未定】 */
        public static const N2DL_FLG_UNDECIDED:String = "0";

        /** 2DLフラグ【2DLあり】 */
        public static const N2DL_FLG_BEING:String = "1";

        /** 2DLフラグ【2DLなし】 */
        public static const N2DL_FLG_NOTHING:String = "2";

        /** CATIA更新フラグ【更新なし】 */
        public static const CAT_UPDATE_FLG_NON:String = "0";

        /** CATIA更新フラグ【更新あり】 */
        public static const CAT_UPDATE_FLG_UPDATE:String = "1";

        /** 開示対象フラグ【オフ】 */
        public static const DISCLOSE_FLG_OFF:String = "0";

        /** 開示対象フラグ【オン】 */
        public static const DISCLOSE_FLG_ON:String = "1";

        /** ファイル更新禁止フラグ【オフ】 */
        public static const FILE_UPDATE_INHIBITION_OFF:String = "0";

        /** ファイル更新禁止フラグ【オン】 */
        public static const FILE_UPDATE_INHIBITION_ON:String = "1";

        /** ユーザ権限フラグ【オフ】 */
        public static const USER_PRIVILEGE_OFF:String = "0";

        /** ユーザ権限フラグ【オン】 */
        public static const USER_PRIVILEGE_ON:String = "1";

        /** 強制フラグ【初回(強制フラグ=OFF)】 */
        public static const FORCE_REGISTER_OFF:String = "0";

        /** 強制フラグ【2回目(強制フラグ=ON)】 */
        public static const FORCE_REGISTER_ON:String = "1";

        /** データグループ種別【デフォルト="0"】**/
        public static const DATA_GRP_KIND_DEFOULT:String = "0"

        /** データグループ種別【固有="1"】**/
        public static const DATA_GRP_KIND_PROPER:String = "1"

        /** データグループ権限設定【権限なし="0"】 */
        public static const DATA_GRP_PERMIT_OFF:String = "0";

        /** データグループ権限設定【権限あり="1"】 */
        public static const DATA_GRP_PERMIT_ON:String = "1";

        // --- リクエストXML

        /** ステータス【ダウンロード】 */
        public static const REQUEST_XML_STATUS_DOWNLOAD:String = "DOWNLOAD";

        /** ステータス【システム共通】 */
        public static const REQUEST_XML_STATUS_SYSTEM:String = "SYSTEM";

        /** ステータス【ユーザ個別設定】 */
        public static const REQUEST_XML_STATUS_ANOTHER:String = "ANOTHER";

        /** ステータス【個人設定】 */
        public static const REQUEST_XML_STATUS_OWN:String = "OWN";

        // --- ユーザ属性編集

        /** ファイルタイプ **/
        public static const FILE_TYPE:int = 1;

        /** グループ **/
        public static const GROUP:int = 2;

        /** 任意 **/
        public static const ATTRIBUTE:int = 3;

        // --- DES(BBD)送付/追加区分

        /** 送付 **/
        public static const DES_BBS_SEND:int = 0;

        /** 追加 **/
        public static const DES_BBS_ADD:int = 1;

        //処理結果ステータス
        /** 正常終了 */
        public static const SUCCESS_END:int = 0;

        /** 処理キャンセル */
        public static const CANCEL_END:int = 1;

        /** 処理中断 */
        public static const INTERRUPTION_END:int = 2;

        //Vault種別
        /** XVL */
        public static const VAULT_KIND_XVL:String = "XVL";

        /** シンプルVault */
        public static const VAULT_KIND_SIMPLE:String = "Simple";

        //CATIA起動チェック結果
        /** CATIA起動チェック結果 の結果 : システムエラー <code>-1</code> */
        public static const EXIT_CODE_SYSTEM_ERROR:int = -1;

        /** CATIA起動チェック結果 の結果 : 参照CATIA未起動/登録CATIA未起動/マクロ未起動 <code>0</code> */
        public static const EXIT_CODE_REFWIN_OFF_REGWIN_OFF_MACRO_OFF:int = 0;

        /** CATIA起動チェック結果 の結果 : 参照CATIA起動/登録CATIA未起動/マクロ未起動 <code>1</code> */
        public static const EXIT_CODE_REFWIN_ON_REGWIN_OFF_MACRO_OFF:int = 1;

        /** CATIA起動チェック結果 の結果 : 参照CATIA未起動/登録CATIA起動/マクロ未起動 <code>2</code> */
        public static const EXIT_CODE_REFWIN_OFF_REGWIN_ON_MACRO_OFF:int = 2;

        /** CATIA起動チェック結果 の結果 : 参照CATIA起動/登録CATIA起動/マクロ未起動 <code>3</code> */
        public static const EXIT_CODE_REFWIN_ON_REGWIN_ON_MACRO_OFF:int = 3;

        /** CATIA起動チェック結果 の結果 : 参照CATIA未起動/登録CATIA未起動/マクロ起動 <code>4</code> */
        public static const EXIT_CODE_REFWIN_OFF_REGWIN_OFF_MACRO_ON:int = 4;

        /** CATIA起動チェック結果 の結果 : 参照CATIA起動/登録CATIA未起動/マクロ起動 <code>5</code> */
        public static const EXIT_CODE_REFWIN_ON_REGWIN_OFF_MACRO_ON:int = 5;

        /** CATIA起動チェック結果 の結果 : 参照CATIA未起動/登録CATIA起動/マクロ起動 <code>6</code> */
        public static const EXIT_CODE_REFWIN_OFF_REGWIN_ON_MACRO_ON:int = 6;

        /** CATIA起動チェック結果 の結果 : 参照CATIA起動/登録CATIA起動/マクロ起動 <code>7</code> */
        public static const EXIT_CODE_REFWIN_ON_REGWIN_ON_MACRO_ON:int = 7;

        // --- CAD起動チェック結果
        /** CAD起動チェック結果 の結果 : システムエラー <code>-1</code> */
        public static const CADPROC_EXITCODE_SYSTEM_ERROR:int = -1;

        /** CAD起動チェック結果 の結果 : 参照CAD_未起動 / 登録CAD_未起動 / 他マクロ_無 / マクロ_無 <code>0</code> */
        public static const CADPROC_EXITCODE_REF_OFF_REG_OFF_OMCR_OFF_MCR_OFF:int = 0;

        /** CAD起動チェック結果 の結果 : 参照CAD_　起動 / 登録CAD_未起動 / 他マクロ_無 / マクロ_無 <code>1</code> */
        public static const CADPROC_EXITCODE_REF_ON_REG_OFF_OMCR_OFF_MCR_OFF:int = 1;

        /** CAD起動チェック結果 の結果 : 参照CAD_未起動 / 登録CAD_　起動 / 他マクロ_無 / マクロ_無 <code>2</code> */
        public static const CADPROC_EXITCODE_REF_OFF_REG_ON_OMCR_OFF_MCR_OFF:int = 2;

        /** CAD起動チェック結果 の結果 : 参照CAD_　起動 / 登録CAD_　起動 / 他マクロ_無 / マクロ_無 <code>3</code> */
        public static const CADPROC_EXITCODE_REF_ON_REG_ON_OMCR_OFF_MCR_OFF:int = 3;

        /** CAD起動チェック結果 の結果 : 参照CAD_未起動 / 登録CAD_未起動 / 他マクロ_有 / マクロ_無 <code>4</code> */
        public static const CADPROC_EXITCODE_REF_OFF_REG_OFF_OMCR_ON_MCR_OFF:int = 4;

        /** CAD起動チェック結果 の結果 : 参照CAD_　起動 / 登録CAD_未起動 / 他マクロ_有 / マクロ_無 <code>5</code> */
        public static const CADPROC_EXITCODE_REF_ON_REG_OFF_OMCR_ON_MCR_OFF:int = 5;

        /** CAD起動チェック結果 の結果 : 参照CAD_未起動 / 登録CAD_　起動 / 他マクロ_有 / マクロ_無 <code>6</code> */
        public static const CADPROC_EXITCODE_REF_OFF_REG_ON_OMCR_ON_MCR_OFF:int = 6;

        /** CAD起動チェック結果 の結果 : 参照CAD_　起動 / 登録CAD_　起動 / 他マクロ_有 / マクロ_無 <code>7</code> */
        public static const CADPROC_EXITCODE_REF_ON_REG_ON_OMCR_ON_MCR_OFF:int = 7;

        /** CAD起動チェック結果 の結果 : 参照CAD_未起動 / 登録CAD_未起動 / 他マクロ_無 / マクロ_有 <code>8</code> */
        public static const CADPROC_EXITCODE_REF_OFF_REG_OFF_OMCR_OFF_MCR_ON:int = 8;

        /** CAD起動チェック結果 の結果 : 参照CAD_　起動 / 登録CAD_未起動 / 他マクロ_無 / マクロ_有 <code>9</code> */
        public static const CADPROC_EXITCODE_REF_ON_REG_OFF_OMCR_OFF_MCR_ON:int = 9;

        /** CAD起動チェック結果 の結果 : 参照CAD_未起動 / 登録CAD_　起動 / 他マクロ_無 / マクロ_有 <code>10</code> */
        public static const CADPROC_EXITCODE_REF_OFF_REG_ON_OMCR_OFF_MCR_ON:int = 10;

        /** CAD起動チェック結果 の結果 : 参照CAD_　起動 / 登録CAD_　起動 / 他マクロ_無 / マクロ_有 <code>11</code> */
        public static const CADPROC_EXITCODE_REF_ON_REG_ON_OMCR_OFF_MCR_ON:int = 11;

        /** CAD起動チェック結果 の結果 : 参照CAD_未起動 / 登録CAD_未起動 / 他マクロ_有 / マクロ_有 <code>12</code> */
        public static const CADPROC_EXITCODE_REF_OFF_REG_OFF_OMCR_ON_MCR_ON:int = 12;

        /** CAD起動チェック結果 の結果 : 参照CAD_　起動 / 登録CAD_未起動 / 他マクロ_有 / マクロ_有 <code>13</code> */
        public static const CADPROC_EXITCODE_REF_ON_REG_OFF_OMCR_ON_MCR_ON:int = 13;

        /** CAD起動チェック結果 の結果 : 参照CAD_未起動 / 登録CAD_　起動 / 他マクロ_有 / マクロ_有 <code>14</code> */
        public static const CADPROC_EXITCODE_REF_OFF_REG_ON_OMCR_ON_MCR_ON:int = 14;

        /** CAD起動チェック結果 の結果 : 参照CAD_　起動 / 登録CAD_　起動 / 他マクロ_有 / マクロ_有 <code>15</code> */
        public static const CADPROC_EXITCODE_REF_ON_REG_ON_OMCR_ON_MCR_ON:int = 15;

        //EDP　DLL呼び出しチェック結果
        /** EDP　DLL呼び出しチェック結果 : システムエラー <code>-1</code> */
        public static const EDP_CALL_EXIT_CODE_SYSTEM_ERROR:int = -1;

        /** EDP　DLL呼び出し : 正常終了 <code>0</code> */
        public static const EDP_CALL_EXIT_CODE_NORMAL:int = 0;

        //フォルダツリー_設計モード

        /** フォルダツリー_設計モード_個人設計 */
        public static const LOCK_KIND_PERSONAL:String = "0";

        /** フォルダツリー_設計モード_共同設計 */
        public static const LOCK_KIND_JOINT:String = "1";

        //フォルダツリー_処理状態

        /** フォルダツリー_処理状態_処理中 */
        public static const PROCESS_STATUS_PROCESSING:String = "0";

        /** フォルダツリー_処理状態_エラー */
        public static const PROCESS_STATUS_ERROR:String = "1";

        // リビジョンタイプ

        /** 指定リビジョン */
        public static const REVISION_TYPE_OLD:String = "0";

        /** 最新リビジョン */
        public static const REVISION_TYPE_NEW:String = "1";

        /** タグリビジョン */
        public static const REVISION_TYPE_TAG:String = "2";

        /** 操作・変更可否フラグ_Disable */
        public static const CONTROL_FLAG_DISABLE:String = "Disable";

        /** 操作・変更可否フラグ_Enable */
        public static const CONTROL_FLAG_ENABLE:String = "Enable";

        //操作属性
        /** 操作属性_追加 **/
        public static const EDIT_STATUS_INSERT:String = "insert";

        /** 操作属性_更新 **/
        public static const EDIT_STATUS_UPDATE:String = "update";

        /** 操作属性_削除 **/
        public static const EDIT_STATUS_DELETE:String = "delete";

        //手入力

        /** 手入力_可能 **/
        public static const SELECT_INPUT:String = "SELECT_INPUT";

        /** 手入力_不可能 **/
        public static const SELECT:String = "SELECT";

        // CSV
        /** CSVセパレータ カンマ */
        public static const CSV_SEPARATOR_COMMNA:String = ",";

        /** CSVセパレータ タブ */
        public static const CSV_SEPARATOR_TAB:String = "\t";

        /** CSV出力時、ファイル置き換え保存の場合でファイルが使用中の場合のメッセージID**/
        public static const CSV_FILE_EXPORT_FILE_USE_MSG_ID:int = 3013;

        // XVL変換リクエスト状態

        /** 待機中 */
        public static const XVL_CONVERSION_STATUS_WAITING:String = "1";

        /** 処理中 */
        public static const XVL_CONVERSION_STATUS_PROCESSING:String = "2";

        // ランタイムエラーコード

        /** Runtime Error Code 3001 : File or directory access denied./読取専用状態 */
        public static const RUNTIME_ERRORCODE_3001:int = 3001;

        /** Runtime Error Code 3013 : File or directory is in use. */
        public static const RUNTIME_ERRORCODE_3013:int = 3013;

        // ---拡張子

        /** 拡張子:CATProduct */
        public static const FILE_EXTENSION_CATPRODUCT:String = "CATProduct";

        /** 拡張子:CATPart */
        public static const FILE_EXTENSION_CATPART:String = "CATPart";

        /** 拡張子:CATDrawing */
        public static const FILE_EXTENSION_CATDRAWING:String = "CATDrawing";

        /** 拡張子:CATAnalysis */
        public static const FILE_EXTENSION_CATANALYSIS:String = "CATAnalysis";

        /** 拡張子:CATAnalysisResult */
        public static const FILE_EXTENSION_CATANALYSISRESULT:String = "CATAnalysisResults";

        /** 拡張子:CATProcess */
        public static const FILE_EXTENSION_CATPROCESS:String = "CATProcess";

        /** 拡張子:prt */
        public static const FILE_EXTENSION_PRT:String = "prt";

        /** 拡張子:xls */
        public static const FILE_EXTENSION_XLS:String = "xls";

        // 開始 追加 2013/07/23 USOL-V(TuanPT) PDM改善(Officeドキュメントの拡張子対応)
        /** 拡張子:xlsx */
        public static const FILE_EXTENSION_XLSX:String = "xlsx";

        // 終了 追加 2013/07/23 USOL-V(TuanPT) PDM改善(Officeドキュメントの拡張子対応)

        /** 拡張子:txt */
        public static const FILE_EXTENSION_TXT:String = "txt";

        /** 拡張子:asm */
        public static const FILE_EXTENSION_ASM:String = "asm";

        /** 拡張子:asm.* */
        public static const FILE_EXTENSION_ASM_VER:String = "asm.*";

        /** 拡張子:prt.* */
        public static const FILE_EXTENSION_PRT_VER:String = "prt.*";

        /** 拡張子:drw */
        public static const FILE_EXTENSION_DRW:String = "drw";

        /** 拡張子:drw.* */
        public static const FILE_EXTENSION_DRW_VER:String = "drw.*";

        // 開始 追加 2012/06/29 USOL-V(VinhND) ExDBV2改修
        /** 拡張子:XV3 (FileTypeId=5) */
        public static const FILE_EXTENSION_XVLSHAPEFILE:String = "XV3";

        /** 拡張子:XV0 (FileTypeId=6) */
        public static const FILE_EXTENSION_XVLASSEMBLYFILE:String = "XV0";

        /** 拡張子:DOC (FileTypeId=7) */
        public static const FILE_EXTENSION_WORDDOCUMENT:String = "DOC";

        // 開始 追加 2013/07/23 USOL-V(TuanPT) PDM改善(Officeドキュメントの拡張子対応)
        /** 拡張子:DOCX (FileTypeId=41) */
        public static const FILE_EXTENSION_WORDXDOCUMENT:String = "DOCX";

        // 終了 追加 2013/07/23 USOL-V(TuanPT) PDM改善(Officeドキュメントの拡張子対応)

        /** 拡張子:JPG (FileTypeId=8) */
        public static const FILE_EXTENSION_JPEGIMAGE:String = "JPG";

        /** 拡張子:BMP (FileTypeId=9) */
        public static const FILE_EXTENSION_BITMAPIMAGE:String = "BMP";

        /** 拡張子:PDF (FileTypeId=10) */
        public static const FILE_EXTENSION_ACROBATPDF:String = "PDF";

        /** 拡張子:GIF (FileTypeId=11) */
        public static const FILE_EXTENSION_GIFIMAGE:String = "GIF";

        /** 拡張子:PPT (FileTypeId=12) */
        public static const FILE_EXTENSION_POWERPOINT:String = "PPT";

        // 開始 追加 2013/07/23 USOL-V(TuanPT) PDM改善(Officeドキュメントの拡張子対応)
        /** 拡張子:PPTX (FileTypeId=42) */
        public static const FILE_EXTENSION_POWERPOINTX:String = "PPTX";

        // 終了 追加 2013/07/23 USOL-V(TuanPT) PDM改善(Officeドキュメントの拡張子対応)

        /** 拡張子:CATPART (FileTypeId=14) */
        public static const FILE_EXTENSION_POWERCOPY:String = "CATPART";

        /** 拡張子:CGR (FileTypeId=16) */
        public static const FILE_EXTENSION_CGR:String = "CGR";

        /** 拡張子:LNK (FileTypeId=17) */
        public static const FILE_EXTENSION_LNK:String = "LNK";

        /** 拡張子:XV2 (FileTypeId=18) */
        public static const FILE_EXTENSION_V_XVLSHAPEFILE:String = "XV2";

        /** 拡張子:TXT (FileTypeId=23) */
        public static const FILE_EXTENSION_DESIGNTABLE_TEXT:String = "TXT";

        /** 拡張子:XLS (FileTypeId=24) */
        public static const FILE_EXTENSION_DESIGNTABLE_EXCEL:String = "XLS";

        // 開始 追加 2013/07/23 USOL-V(TuanPT) PDM改善(Officeドキュメントの拡張子対応)
        /** 拡張子:XLSX (FileTypeId=43) */
        public static const FILE_EXTENSION_DESIGNTABLE_EXCELX:String = "XLSX";

        // 終了 追加 2013/07/23 USOL-V(TuanPT) PDM改善(Officeドキュメントの拡張子対応)

        /** 拡張子:TIF (FileTypeId=25) */
        public static const FILE_EXTENSION_TIFF:String = "TIF";

        /** 拡張子:tif (FileTypeId=26) */
        public static const FILE_EXTENSION_CADLINKTIFF:String = "tif";

        /** 拡張子:CGR (FileTypeId=30) */
        public static const FILE_EXTENSION_CATCGR:String = "CGR";

        /** 拡張子:XLS (FileTypeId=33) */
        public static const FILE_EXTENSION_SPREADSHEET_EXCEL:String = "XLS";

        // 開始 追加 2013/07/23 USOL-V(TuanPT) PDM改善(Officeドキュメントの拡張子対応)
        /** 拡張子:XLSX (FileTypeId=44) */
        public static const FILE_EXTENSION_SPREADSHEET_EXCELX:String = "XLSX";

        // 終了 追加 2013/07/23 USOL-V(TuanPT) PDM改善(Officeドキュメントの拡張子対応)

        /** 拡張子:CSV (FileTypeId=34) */
        public static const FILE_EXTENSION_CSV:String = "CSV";

        /** 拡張子:JT (FileTypeId=35) */
        public static const FILE_EXTENSION_JT:String = "JT";

        // 終了 追加 2012/06/29 USOL-V(VinhND) ExDBV2改修

        //開始　Officeドキュメントのマクロ拡張子対応

        /** 拡張子:xlsm (FileTypeId=45)*/
        public static const FILE_EXTENSION_XLSM:String = "xlsm";

        /** 拡張子:DOCM (FileTypeId=46) */
        public static const FILE_EXTENSION_WORDMDOCUMENT:String = "DOCM";

        /** 拡張子:PPTM (FileTypeId=47) */
        public static const FILE_EXTENSION_POWERPOINTM:String = "PPTM";

        /** 拡張子:XLSM (FileTypeId=48) */
        public static const FILE_EXTENSION_DESIGNTABLE_EXCELM:String = "XLSM";

        /** 拡張子:XLSM (FileTypeId=49) */
        public static const FILE_EXTENSION_SPREADSHEET_EXCELM:String = "XLSM";

        //終了　Officeドキュメントのマクロ拡張子対応

        /** 拡張子:.catalog */
        public static const FILE_EXTENSION_CATALOG:String = "catalog";


        //詳細グリッド
        /** データグリッドの行色を設定するスタイル名 */
        public static const STYLE_GRIDROWCOLOR:String = "alternatingItemColors";

        /** 詳細グリッド行色:チェックアウト中 */
        public static const COLOR_CHECKOUT:uint = 0x9ACD32;

        /** 詳細グリッド行色:他ユーザチェックアウト中 */
        public static const COLOR_OTHER_CHECKOUT:uint = 0xFFA500;

        /** 詳細グリッド行色:ロック中 */
        public static const COLOR_LOCK:uint = 0x87CEEB;

        /** 詳細グリッド行色:他ユーザロック中 */
        public static const COLOR_OTHER_LOCK:uint = 0xF0E68C;

        /** 詳細グリッド行色:他フォルダ参照 */
        public static const COLOR_LINK:uint = 0x9E5C33;

        /** 詳細グリッド行色:論理削除 */
        public static const COLOR_DELETE:uint = 0x8CAED5;

        /** 詳細グリッド行色:コピー時編集不可 */
        public static const COLOR_COPY_UNEDITABLE:uint = 0x8CAED5;

        /** 詳細グリッド行数:最大表示件数 */
        public static const MAX_DISPROW_COUNT:int = 100;

        /** 詳細グリッド行色:削除行 */
        public static const COLOR_DELETE_LINE:uint = 0x484848;

        /** 詳細グリッド行色:変更行 */
        public static const COLOR_UPDATE_LINE:uint = 0xccccff;

        /** 詳細グリッド行色:追加行 */
        public static const COLOR_INSERT_LINE:uint = 0x98fb98;

        /** 詳細グリッド行色:エラー行（行エラー） */
        public static const COLOR_LINE_ERROR_LINE:uint = 0xe95464;

        /** 詳細グリッド背景色:エラーカラム（カラムエラー） */
        public static const COLOR_ERROR_ITEM:uint = 0xe95464;

        /** 詳細グリッド行色:エラー行（項目エラー） */
        public static const COLOR_COLUMN_ERROR_LINE:uint = 0xffb7b7;

        /** 検索グリッド行色:エラー項目 */
        public static const COLOR_ERROR_COLUMN:uint = 0xe95464;

        /** 検索グリッド行色:ユーザ属性編集不可 */
        public static const COLOR_USER_ATTR_UNEDITABLE:uint = 0x8caed5;

        // ロック
        /** ロックツリーの文字色:制御不可 */
        public static const COLOR_LOCK_DISABLED:uint = 0x87CEEB;

        /** ロックツリーの文字色:制御可能 */
        public static const COLOR_LOCK_ENABLED:uint = 0x000000;

        // チェックアウト状態変種
        /** ツリーの文字色:制御不可 */
        public static const COLOR_CO_STATUS_EDIT_DISABLED:uint = 0x87CEEB;

        /** ツリーの文字色:制御可能 */
        public static const COLOR_CO_STATUS_EDIT_ENABLED:uint = 0x000000;

        // ファイルコピー
        /** ファイルコピーツリーの文字色:編集不可 */
        public static const COLOR_TREE_COPY_UNEDITABLE:uint = 0x87CEEB;

        /**ファイルコピーツリーの文字色:編集可 */
        public static const COLOR_TREE_COPY_EDITABLE:uint = 0x000000;

        // 開始 追加 2012/06/29 USOL-V(VinhND) ExDBV2改修
        /**Chromeの文字色 */
        public static const STYLE_COMBOBOX_CHROME:String = "chromeColor";

        /**白いの文字色 */
        public static const COLOR_WHITE:String = "white";

        // 終了 追加 2012/06/29 USOL-V(VinhND) ExDBV2改修

        /** コピー対象ツリー情報_更新ステータス:編集可 */
        public static const STATUS_EDITABLE:String = "1";

        // ファイル情報:処理中コード (FileInfoModel.processingCode)
        /** 処理中コード:未処理 */
        public static const PROCESSINGCODE_NOPROC:String = "0";

        /** 処理中コード:XVL変換中 */
        public static const PROCESSINGCODE_XVLCONV:String = "1";

        /** 処理中コード:XVL変換失敗 */
        public static const PROCESSINGCODE_XVLCONV_FAIL:String = "2";

        /** 処理中コード:XVL変換キャンセル */
        public static const PROCESSINGCODE_XVLCONV_CANCEL:String = "3";

        // ソート項目
        /** データ名 */
        public static const SORT_DATA_NAME:int = 0;

        /** ロックユーザ */
        public static const SORT_LOCK_USER:int = 1;

        /** 更新日時 */
        public static const SORT_UPDATE_DATE:int = 2;

        // データツリー 詳細ソート条件
        /** データ名：昇順 */
        public static const SORT_DATA_NAME_ASCENDING:int = 0;

        /** データ名：降順 */
        public static const SORT_DATA_NAME_DESCENDING:int = 1;

        /** ロックユーザ：昇順 */
        public static const SORT_LOCK_USER_ASCENDING:int = 2;

        /** ロックユーザ：降順 */
        public static const SORT_LOCK_USER_DESCENDING:int = 3;

        /** 更新日時：昇順 */
        public static const SORT_UPDATE_DATE_ASCENDING:int = 4;

        /** 更新日時：降順 */
        public static const SORT_UPDATE_DATE_DESCENDING:int = 5;

        // 排他文字色
        /** キャビネットツリー/フォルダツリー 黒 **/
        public static const COLOR_DEFAULT:uint = 0x000000;

        /** キャビネットツリー/フォルダツリー 水色 **/
        public static const COLOR_INHIBIT:uint = 0x87CEEB;

        //ユーザ属性リスト 属性タイプ

        /** ExDB属性 **/
        public static const ATTR_TYPE_EXDB:String = "1";

        /** CATIA属性 **/
        public static const ATTR_TYPE_CATIA:String = "2";

        /** V1属性 **/
        public static const ATTR_TYPE_V1:String = "3";

        /** EDMICS属性 **/
        public static const ATTR_TYPE_EDMICS:String = "4";

        //ユーザ属性リスト 背景色
        public static const ATTR_COLOR_LIGHT_CYANOGEN:uint = 0xE0FFFF;

        //一般ファイルチェックイン方法

        public static const CHECKIN_METHOD_REVISION:String = "revision";

        public static const CHECKIN_METHOD_REPLACE:String = "replace";

        //View区分

        /** View区分．協業画面 */
        public static const VIEW_TYPE_COOPERATION:int = 0;

        /** View区分．検索結果画面 */
        public static const VIEW_TYPE_SEARCH_RESULT:int = 10;

        /** View区分．ファイル逆展開表示画面 */
        public static const VIEW_TYPE_FILE_REVERSE_EXPAND:int = 20;

        /** View区分．履歴表示画面 */
        public static const VIEW_TYPE_HISTORY:int = 30;

        /** View区分．リビジョンタグ画面 */
        public static const VIEW_TYPE_REVISION_TAG:int = 40;

        // 開始 追加 2012/07/24 USOL-V(AnhND) ExDBV3
        /** View区分．成果物情報取得処理画面 */
        public static const VIEW_TYPE_TARGET_BINDER:int = 50;

        // 終了 追加 2012/07/24 USOL-V(AnhND) ExDBV3

        // 開始 追加 2013/01/16 USOL-V(TienNH) PDM改善(サムネイル表示)
        public static const VIEW_TYPE_COMMON_DETAIL:int = 60;

        // 終了 追加 2013/01/16 USOL-V(TienNH) PDM改善(サムネイル表示)

        //View詳細区分

        /** View詳細区分．検索結果画面．一覧 */
        public static const VIEW_DETAIL_TYPE_SEARCH_RESULT_LIST:int = 11;

        /** View詳細区分．検索結果画面．詳細ツリー */
        public static const VIEW_DETAIL_TYPE_SEARCH_RESULT_DETAIL_TREE:int = 12;

        /** View詳細区分．検索結果画面．詳細グリッド */
        public static const VIEW_DETAIL_TYPE_SEARCH_RESULT_DETAIL_GRID:int = 13;

        //画面反映区分

        /**
         * 画面反映区分．メイン画面<BR>
         *  (どの画面からも更新はメイン(協業)画面タブのみ更新。) <BR>
         * <BR>
         * メイン画面 → メイン画面更新<BR>
         * サブ画面 　→ メイン画面更新<BR>
         * <BR>
         * */
        public static const REFRESH_TARGET_MAIN:int = 0;

        /**
         * 画面反映区分．サブ画面<BR>
         *  (どの画面からも更新はサブ画面タブのみ更新。メイン画面の場合は処理をしない)<BR>
         * <BR>
         * メイン画面 → 更新なし<BR>
         * サブ画面 　→ サブ画面更新<BR>
         * <BR>
         * */
        public static const REFRESH_TARGET_SUB:int = 1;

        /**
         * 画面反映区分．メイン・サブ画面<BR>
         *  (どの画面からも更新はメイン・サブ画面タブ両方更新。)<BR>
         * <BR>
         * メイン画面 → メイン画面更新<BR>
         * サブ画面 　→ メイン・サブ画面更新<BR>
         * <BR>
         * */
        public static const REFRESH_TARGET_BOTH:int = 2;

        // 色
        /** 薄水色 **/
        public static const COLOR_THIN_LIGHT_BLUE:uint = 0xC0FFFF;

        //設計テーブルの扱い

        /** 設計テーブルの扱い．親と同フォルダに取り込む */
        public static const DESIGN_TBL_USE_TYPE_PARENT_SAME_FOLDER:int = 0;

        /** 設計テーブルの扱い．現在のフォルダを維持 */
        public static const DESIGN_TBL_USE_TYPE_NOW_FOLDER_KEEP:int = 1;

        // クリップボード保存 フォーマット名
        /** フォルダコピー用 クリップボード保存 データフォーマット名 */
        public static const CLIPBOAD_FOLDER_FORMAT_NAME:String = "com.toyota_cs.exdb.appl.folder.model.FolderInfoModel";

        /** ファイルコピー用 クリップボード保存 選択中データ データフォーマット名 */
        public static const CLIPBOAD_FILE_FORMAT_NAME:String = "com.toyota_cs.exdb.appl.file.model.FileInfoModel";

        /** ファイルコピー用 クリップボード保存 リビジョンタイプ データフォーマット名 */
        public static const CLIPBOAD_REVISION_TYPE_FORMAT_NAME:String = "RevisionType";

        /** ファイルコピー用 クリップボード保存 タグID データフォーマット名 */
        public static const CLIPBOAD_TAG_ID_FORMAT_NAME:String = "TagId";

        //MAXサイズバイト数
        /**チェックイン可能MAXサイズバイト数(4GB) */
        public static const MAX_BYTE_SIZE_CHECKIN:Number = Math.pow(1024, 3) * 4;

        /**一括ダウンロードMAX合計サイズバイト数(4PB)(1024 * 1024 * 1024 * 1024 * 1024 * 4 = 4503599627370496Byte) */
        public static const MAX_BYTE_SIZE_PACK_DOWNLOAD:Number = Math.pow(1024, 5) * 4;

        // 開始 更新 2012/06/26 USOL-V(KhaiDH) ExDBV2改修
        /** ステータス,承認者,承認日時,押印,詳細グリッドのデフォルト表示幅[データ名,所属フォルダ,リビジョン,最新リビジョン,データタイプ,ロックユーザ,ロックユーザ名,開示対象,データサイズ,作成日時,作成者,作成者名,参照日時,更新日時,削除日時,ファイル名,VAULT名,作成APバージョン,コメント]**/
        public static const DEFAULT_DETAIL_DATAGRID_COLUMN_WIDTH:Object = {binderStatus:100, approvalName:100, approvalDate:120, approvalStamp:80, genericFileName:140,
                folderPath:200, revision:80, lastRevision:80, fileTypeName:140, lockUser:100, lockUserName:100, disCloseFlg:80, fileSize:100, createDate:130,
                creator:100, creatorName:100, referenceDate:130, lastmodDate:130, delDate:130, fileName:480, vault_name:120, appliName:120, comt:800};

        /** ステータス,承認者,承認日時,押印,詳細グリッドのデフォルト表示順[データ名,所属フォルダ,リビジョン,最新リビジョン,データタイプ,ロックユーザ,ロックユーザ名,開示対象,データサイズ,作成日時,作成者,作成者名,参照日時,更新日時,削除日時,ファイル名,VAULT名,作成APバージョン,コメント]**/
        public static const DEFAULT_DETAIL_DATAGRID_COLUMN_INDEX:Array = ["binderStatus", "approvalName", "approvalDate", "approvalStamp", "genericFileName",
                                                                          "folderPath", "revision", "lastRevision", "fileTypeName", "lockUser", "lockUserName",
                                                                          "disCloseFlg", "fileSize", "createDate", "creator", "creatorName", "referenceDate",
                                                                          "lastmodDate", "delDate", "fileName", "vault_name", "appliName", "comt"];

        // 終了 更新 2012/06/26 USOL-V(KhaiDH) ExDBV2改修

        // リクエスト状況_処理区分

        /** リクエスト状況_処理区分 処理待ち */
        public static const REQ_PROC_STATE_IDLE:String = "1";

        /** リクエスト状況_処理区分 処理中 */
        public static const REQ_PROC_STATE_PROC:String = "2";

        /** リクエスト状況_処理区分 処理中断 */
        public static const REQ_PROC_STATE_DISCON:String = "3";

        // リクエスト状況_処理内容
        /** リクエスト状況_処理内容 一括削除取消 */
        public static const REQ_PROC_TYPE_CANDEL:String = "1";

        /** リクエスト状況_処理内容 一括アンロック */
        public static const REQ_PROC_TYPE_UNLOCK:String = "2";

        /** リクエスト状況_処理内容 作成者変更 */
        public static const REQ_PROC_TYPE_MANUCHAN:String = "3";

        /** リクエスト状況_処理内容 ファイル削除 */
        public static const REQ_PROC_TYPE_DELFIL:String = "4";

        /** リクエスト状況_処理内容 フォルダ削除 */
        public static const REQ_PROC_TYPE_DELFLD:String = "5";

        /** リクエスト状況_処理内容 ファイル更新禁止 */
        public static const REQ_PROC_TYPE_FLUPDTIN:String = "6";

        /** リクエスト状況_処理内容 ファイル更新禁止解除 */
        public static const REQ_PROC_TYPE_FLUPDTINCAN:String = "7";

        /** リクエスト状況_処理内容 変換リクエスト登録 */
        public static const REQ_PROC_TYPE_CONV_REQ:String = "8";

        /** リクエスト状況_処理内容 自動論理削除 */
        public static const REQ_PROC_TYPE_AUTODEL:String = "9";

        /** リクエスト状況_処理内容 一括権限出力 */
        public static const REQ_PROC_TYPE_OUTPUTALLAUTH:String = "a";

        /** リクエスト状況_処理内容 一括権限変更 */
        public static const REQ_PROC_TYPE_CHGALLAUTH:String = "b";

        // リスト出力状況

        // リスト形式

        /** リスト出力状況_リスト形式 フォルダ */
        public static const OUTPUT_LIST_FILE_LIST_TYPE_FOLDER:String = "1";

        /** リスト出力状況_リスト形式 ユーザ */
        public static const OUTPUT_LIST_FILE_LIST_TYPE_USER:String = "2";

        // ステータス
        /** リスト出力状況_ステータス 処理待ち */
        public static const OUTPUT_LIST_STATUS_WAIT:String = "0";

        /** リスト出力状況_ステータス 処理中 */
        public static const OUTPUT_LIST_STATUS_PROC:String = "1";

        /** リスト出力状況_ステータス 完了 */
        public static const OUTPUT_LIST_STATUS_COMPLETE:String = "2";

        /** リスト出力状況_ステータス エラー */
        public static const OUTPUT_LIST_STATUS_ERROR:String = "9";

        //フォルダ設定の種類

        /** フォルダ設定の種類 デフォルト */
        public static const FOLDER_SETTING_TYPE_DEFAULT:String = "DEFAULT";

        /** フォルダ設定の種類 パス */
        public static const FOLDER_SETTING_TYPE_PATH:String = "PATH";

        //フォルダ設定の種別
        /** フォルダ設定の種別 個人設定 */
        public static const FOLDER_SETTING_STATUS_OWN:String = "OWN";

        /** フォルダ設定の種別 システム共通 */
        public static const FOLDER_SETTING_STATUS_SYSTEM:String = "SYSTEM";

        /** フォルダ設定の種別 ユーザ個別設定 */
        public static const FOLDER_SETTING_STATUS_ANOTHER:String = "ANOTHER";

        //ボタンの識別
        /** ボタンの識別 SETTING */
        public static const FOLDER_SETTING_BUTTON_SETTING:String = "SETTING";

        /** ボタンの識別 CLEAR */
        public static const FOLDER_SETTING_BUTTON_CLEAR:String = "CLEAR";

        // --- ツールバー ステート種類

        /** ツールバーのステート：キャビネットツリー **/
        public static const TOOLBAR_STATE_CABINET_TREE:String = "cabinetTree";

        /** ツールバーのステート：データツリー **/
        public static const TOOLBAR_STATE_DATA_TREE:String = "dataTree";

        // CADのタイプ

        /** CADマクロのタイプ CATIA */
        public static const CAD_TYPE_CATIA:String = "0";

        /** CADマクロのタイプ NX */
        public static const CAD_TYPE_NX:String = "1";

        /** CADマクロのタイプ PROE */
        public static const CAD_TYPE_PROE:String = "2";

        /** CADタイプ CAD以外 */
        public static const CAD_TYPE_NON_CAD:String = "9";

        // --- チェックアウトファイル_属性名

        /** チェックアウトファイル：属性：ファイルID */
        public static const CHECKOUTFILE_ATTR_FILE_ID:String = "fileId";

        /** チェックアウトファイル：属性：ファイルタイプ */
        public static const CHECKOUTFILE_ATTR_FILE_TYPE:String = "fileType";

        /** チェックアウトファイル：属性：処理区分 */
        public static const CHECKOUTFILE_ATTR_PROC:String = "proc";

        /** チェックアウトファイル：属性：ローカル更新日時 */
        public static const CHECKOUTFILE_ATTR_LOCAL_LAST_UPDATE_DATE:String = "lcUpdate";

        /** チェックアウトファイル：属性：サーバ更新日時 */
        public static const CHECKOUTFILE_ATTR_SERVER_LAST_UPDATE_DATE:String = "svUpdate";

        /** チェックアウトファイル：属性：置き換えフラグ */
        public static const CHECKOUTFILE_ATTR_REPLACE:String = "replace";

        /** チェックアウトファイル：属性：CADバージョン */
        public static const CHECKOUTFILE_ATTR_CAD_VERSION:String = "cadVersion";

        /** チェックアウトファイル：属性：フォルダID */
        public static const CHECKOUTFILE_ATTR_FOLDER_ID:String = "folderId";

        /** チェックアウトファイル：属性：ログインID */
        public static const CHECKOUTFILE_ATTR_LOGIN_ID:String = "loginId";

        /** チェックアウトファイル：属性：パス */
        public static const CHECKOUTFILE_ATTR_PATH:String = "path";

        /** チェックアウトファイル：属性：リビジョンアップフラグ */
        public static const CHECKOUTFILE_ATTR_REVISION_UP:String = "revisionUp";

        // --- CleanUpファイル
        /** ExcludedClenUp.txt */
        public static const FILE_NAME_EXCLUDE_CLEANUP:String = APPDIR_TEMP + File.separator + "ExcludedClenUp.txt";

        // 開始 追加 2012/06/20 USOL-V(KhoiBV) ExDBV2改修
        /** トップASSY:トップASSY以外 (0) **/
        public static const TOP_ASSY_OTHER:String = "0";

        /** トップASSY:トップASSY (1) **/
        public static const TOP_ASSY:String = "1";

        /** トップASSY:CATDrawingのトップASSY (2) **/
        public static const TOP_ASSY_CATDRAWING:String = "2";

        // 終了 追加 2012/06/20 USOL-V(KhoiBV) ExDBV2改修

        // 開始 追加 2012/07/03 USOL-V(KhaiDH) ExDBV2改修
        /** 仕掛中 **/
        public static const BINDER_STATUS_CODE_PREPARING:String = "30";

        /** 申請中 **/
        public static const BINDER_STATUS_CODE_PENDING:String = "65";

        /** 公開 **/
        public static const BINDER_STATUS_CODE_PUBLIC:String = "90";

        /** 発行エラ **/
        public static const BINDER_STATUS_CODE_ISSUE_ERROR:String = "80";

        /** システムエラー **/
        public static const BINDER_STATUS_CODE_SYSTEM_ERROR:String = "85";

        /** 変換エラー **/
        public static const BINDER_STATUS_CODE_CONVERSION_ERROR:String = "75";

        /** 押印中 **/
        public static const BINDER_STAMP_PROCESSING_JP:String = "押印中";

        /** 押印中 **/
        public static const BINDER_STAMP_PROCESSING_EN:String = "Stamping";

        /** ○ **/
        public static const BINDER_STAMP_TRUE:String = "○";

        /** 押印なし **/
        public static const STAMP_NONE:String = "0";

        // 終了 追加 2012/07/03 USOL-V(KhaiDH) ExDBV2改修

        // 開始 追加 2013/01/17 USOL-V(TienNH) PDM改善(サムネイル表示)
        /** サムネイルサイズ：大 */
        public static const THUMBNAIL_SIZE_LARGE:int = 0;

        /** サムネイルサイズ：中 */
        public static const THUMBNAIL_SIZE_MEDIUM:int = 1;

        /** サムネイルサイズ：小 */
        public static const THUMBNAIL_SIZE_SMALL:int = 2;

        // 終了 追加 2013/01/17 USOL-V(TienNH) PDM改善(サムネイル表示)

        // 開始 追加 2013/01/25 USOL-V(HoaTQ) PDM改善(サムネイル表示)
        /** 背景色状態（黒い）：0 */
        public static const THUMBNAIL_STYLE_NONE:int = 0;

        /** アイコン表示状態：1 */
        public static const THUMBNAIL_STYLE_ICON:int = 1;

        /** 画像表示状態：2 */
        public static const THUMBNAIL_STYLE_IMAGE:int = 2;

        // 終了 追加 2013/01/25 USOL-V(HoaTQ) PDM改善(サムネイル表示)

        // 開始 追加 2013/12/17 お気に入り対応


        /** 旧リビジョン:"0" */
        public static const FAVORITE_FILE_OLD_REVISION:String = "0";

        /** 最新リビジョン:"1" */
        public static const FAVORITE_FILE_LAST_REVISION:String = "1";

        /** 論理削除されていない:"0" */
        public static const FAVORITE_FILE_EXIST:String = "0";

        /** 論理削除されている:"1" */
        public static const FAVORITE_FILE_DELETE:String = "1";

        public static const COLOR_DELETE_OR_OLD:uint = 0xFF0000;

        // 終了 追加 2013/12/17 お気に入り対応


        // 開始 追加 2014/03/06 TCS野村 ログイン・ログアウト(サムネイル)
        /** AppConf設定 サムネイルフォルダ名 */
        public static const THUMBNAIL_FOLDER_NAME:String = "thumbnail";
        // 終了 追加 2014/03/06 TCS野村 ログイン・ログアウト(サムネイル)

        // 開始 追加 2014/04/29 USOL-V(NguyetNT) ExDBライセンス管理

        /** ライセンスタイプExDB： 0 */
        public static const LICENSE_TYPE_EXDB:String = "0";

        /** ライセンスタイプExDB_EE：1 */
        public static const LICENSE_TYPE_EXDBEE:String = "1";

        /** ライセンスタイプEDP：2 */
        public static const LICENSE_TYPE_EDP:String = "2";

        /** ライセンスフラグＯＮ */
        public static const LICENSE_FLG_ON:String = "1";

        // CADのタイプ

        /** CADマクロのタイプ CATIA */
        public static const CAD_TYPE_CATIA_NAME:String = "CATIA";

        /** CADマクロのタイプ NX */
        public static const CAD_TYPE_NX_NAME:String = "NX";

        /** CADマクロのタイプ PROE */
        public static const CAD_TYPE_PROE_NAME:String = "Pro/E";

        /** 定期送信時間 */
        public static const CONFIRM_LICENSE_DELAY_TIME:int = 60000;
        // 終了 追加 2014/04/29 USOL-V(NguyetNT) ExDBライセンス管理

        // 開始 追加 20140604 TCS-Otake　モジュールダウンロード対応


        /** 更新・削除除外リストのファイル名 */
        private static const FILE_NAME_LISTING:String = "listing.txt";

        /** 更新リストのファイル名 */
        private static const FILE_NAME_FILELIST:String = "filelist.tsv";

        /** 更新リストのパス */
        public static const PATH_FILE_LIST:String = Constant.APPDIR_UPDATE + File.separator + FILE_NAME_FILELIST;

        /** 前回の更新リストのパス */
        public static const PATH_FILE_LIST_OLD:String = Constant.APPDIR_UPDATE + File.separator + "old_" + FILE_NAME_FILELIST;

        /** ExDBNeoPDM.exe */
        public static const FILE_NAME_EXDBNEO_EXE:String = "ExDBNeoPDM.exe";

        /** ExDBNeoPDM.exeのフルパス　（例：C:\ExDBNeoPDM\ExDBNeoPDM.exe） */
        public static const PATH_EXDBNEO_EXE:String = Constant.APPDIR_CURRENT + File.separator + FILE_NAME_EXDBNEO_EXE;

        /** 更新・削除除外リストのパス */
        public static const LISTING_FILE_PATH:String = Constant.APPDIR_CONF + File.separator + FILE_NAME_LISTING;

        /** 前回の更新・除外リストのパス */
        public static const PATH_LISTING_FILE_OLD:String = Constant.APPDIR_CONF + File.separator + "old_" + FILE_NAME_LISTING;

        /** サーバ側にある更新・除外リストのパス（/conf/listing.txt） */
        public static const SV_PATH_LISTING_FILE:String = File.separator + DIR_NAME_CONF + File.separator + FILE_NAME_LISTING;

        /** fileList.txt パス区切り文字 */
        public static const SERVER_PATH_SEPATATOR:String = "\\";

        /** ディレクトリ名:<code>bin</code> */
        public static const DIR_NAME_BIN:String = "bin";

        /** ディレクトリ名:<code>conf</code> */
        public static const DIR_NAME_CONF:String = "conf";

        /** ディレクトリ名:<code>CAD</code> */
        public static const DIR_NAME_CAD:String = "CAD";

        /** ディレクトリ名:<code>META-INF</code> */
        public static const DIR_NAME_META_INF:String = "META-INF";

        /** マクロダウンロードフラグ:<code>CadMacro</code> */
        public static const MACRO_DOWNROAD:String = "CadMacro";

        /** マクロダウンロードフラグ:<code>ClModule</code> */
        public static const MODULE_DOWNROAD:String = "ClModule";

        // 終了 追加 20140604 TCS-Otake　モジュールダウンロード対応

//01.02.99 ADD START

        /** カタログN/Wパス情報ファイル **/
        public static const FILE_NAME_CTLGNWPATHLIST:String = APPDIR_CONF + File.separator + "CTLG_NW_PATH_LIST.conf";

        /** カタログ(O:)リンク付 データパス情報ファイル
         * CATScriptの他番船チェックで除外とするキャビネット情報を出力
         **/
        public static const FILE_NAME_CTLG_NOCHECK_CABINETNAME:String = APPDIR_CONF + File.separator + "NoCheckCabinet.conf";

        /** 会社識別システムコード: カタログデータ対応用 */
        public static const SYSCODE_BY_CSTMR_VAL_SCBC_CTLG_001:String = "SCBC_CTLG-001";

        /** SPデータ種別:カタログデータ対応カタログ Inner*/
        public static const SP_DATA_KIND_CTLG_INNR:String = "JMU-CTLG-INNR";

        /** SPデータ種別:カタログデータ対応カタログ Module*/
        public static const SP_DATA_KIND_CTLG_MDL:String = "JMU-CTLG-MDL";

        /** SPデータ種別:カタログデータ対応カタログ Line*/
        public static const SP_DATA_KIND_CTLG_LINE:String = "JMU-CTLG-LN";

        /** 文字：ピリオド,ドット(".") */
        public static const CHAR_PERIOD:String = ".";

        /** 文字：スラッシュ("/") */
        public static const CHAR_SLASH:String = "/";

//01.02.99 ADD END

        //01.02.XY ADD START
        /** SPデータ種別:カタログデータ対応 カタログ 接頭辞*/
        public static const SP_DATA_KIND_SPDATA_CTLG:String = "JMU-CTLG";

        /** カタログデータ対応で標準データなどを置く特殊ドライブとして使う(O:\) */
        public static const SP_DATA_DRIVE_FOR_COMMON:String = "O:";

        /** 詳細グリッド行色:カタログデータ、LineID */
        public static const COLOR_CTLG:uint = 0xFFA5A5;
        //01.02.XY ADD END

        //01.02.XY ADD START
        /** 先行ロード対象のローカルパス出力ファイル **/
        public static const FILE_NAME_PRELOADINGTARGETLIST:String = APPDIR_TEMP + File.separator + "PreLoadingTargetListForRef.txt";

        /** カタログデータ対応 CAAツール連携-ダウンロード ステータスファイル1 */
        public static const EXTCALL_CAADL_STATUS_1:String = "externalCallDownloadStatus1.txt";

        /** カタログデータ対応 マクロ起動-事前チェック ステータスファイル1 */
        public static const REFCAB_CHK_STATUS_1:String = "refCabinetCheckStatus1.txt";

        /** カタログデータ対応 マクロ起動-チェックアウト ステータスファイル1 */
        public static const CATTBC_CO_STATUS_1:String = "catToolBarCallCheckoutStatus1.txt";

        /** カタログデータ対応 マクロ起動-参照 ステータスファイル1 */
        public static const CATTBC_REF_STATUS_1:String = "catToolBarCallReferenceStatus1.txt";

        /** カタログデータ対応 マクロ起動-構成要素追加 ステータスファイル1 */
        public static const CATTBC_ADDCOMP_STATUS_1:String = "catToolBarCallAddComponentStatus1.txt";

        /** カタログデータ対応 マクロ起動-事後クリーンアップ ステータスファイル1 */
        public static const EXTCALL_CLNUP_STATUS_1:String = "cleanUpStatus1.txt";
        //01.02.XY ADD END
    }
}

