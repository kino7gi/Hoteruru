//COPYRIGHT="All Rights Reserved Copyright 2010-2011(C) Toyota Communication systems."
//SRC_VERSION=01.00.00
/*
 * ExDB_EE
 *
 * ファイル名      ：Constant.as
 * ファイル説明    ：共通定数クラス
 * 更新履歴    更新日        担当者      内容
 * 01.00.00    20101130      Ma-Tanaka   新規作成
 */
package com.toyota_cs.enterprise.common.util
{
    import flash.filesystem.File;

    /**
     * 共通定数クラス
     * システム共通定数を定義
     * 全ての定数は「public static const」にて宣言すること。
     */
    public class Constant
    {
        /** CADタイプ：CATIA <code>0<code> **/
        public static const CAD_TYPE_CATIA:String = "0";
        /** CADタイプ：NX <code>1<code> **/
        public static const CAD_TYPE_NX:String = "1";
        /** CADタイプ：ProE <code>2<code> **/
        public static const CAD_TYPE_PROE:String = "2";
        /** CADタイプ：他 <code>9<code> **/
        public static const CAD_TYPE_OTHER:String = "9";
        
        /** CAD存在チェック：CADなし **/
        public static const CAD_CONTAIN_NOT:uint = 0;
        /** CAD存在チェック：CATIAあり **/
        public static const CAD_CONTAIN_CATIA_BIT:uint = 1;
        /** CAD存在チェック：NXあり **/
        public static const CAD_CONTAIN_NX_BIT:uint = 2;
        /** CAD存在チェック：PROEあり **/
        public static const CAD_CONTAIN_PROE_BIT:uint = 4;
        
        /** 文字列 true */
        public static const TRUE:String = "true";

        /** 文字列 false */
        public static const FALSE:String = "false";

        /** 設変Noの桁数 */
        public static const EC_NO_LENGTH:uint = 10;

        /** 設変Noの最小桁数 */
        public static const EC_NO_MIN_LENGTH:int = 4;

        /** 品番最大桁数（品番 + マイナ） */
        public static const MAX_PART_NO_LENGTH:int = 12;

        /** 品番桁数 */
        public static const PART_NO_LENGTH:int = 10;

        /** 品番(前)or(後)の桁数 */
        public static const PART_NO_SPLIT_LENGTH:int = 5;

        /** 車種の桁数 */
        public static const PROJECT_CD_LENGTH:int = 4;

        /** 組立の桁数 */
        public static const GROUP_LENGTH:int = 4;

        /** 部位の桁数 */
        public static const COMPONENT_LENGTH:int = 2;

        /** バリエーションの桁数 */
        public static const VARIATION_LENGTH:int = 4;

        /** 列幅算出用係数 */
        public static const COL_WIDTH_COEFFICIENT:Number = 6.25;

        /** 列幅余白固定値 */
        public static const COL_WIDTH_SPACE:Number = 30;

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

        // --- 言語コード
        /** 言語コード(ISO 639-1 の2文字表記). 日本語 */
        public static const LANG_JA:String = "ja";

        /** 言語コード(ISO 639-1 の2文字表記). 英語 */
        public static const LANG_EN:String = "en";

        /** 言語コード(ISO 639-1 の3文字表記). 日本語 */
        // ExDB_EE仕様では未使用
        //		public static const LANG_JPN:String = "jpn";
        //		/** 言語コード(ISO 639-1 の3文字表記). 英語 */
        //		public static const LANG_ENG:String = "eng";
        //		/** 言語コード(RFC4646). 日本語 */
        //		public static const LANG_JPN_DETAIL:String = "ja-JP";
        //		/** 言語コード(RFC4646). 英語 */
        //		public static const LANG_ENG_DETAIL:String = "en-US";

        // --- 国[時差]情報(デフォルトとして)
        /** 国[時差]情報. 日本 */
        public static const COUNTRY_JA:String = "9";

        // temp領域保持デフォルト日数
        public static const TEMP_MAX_KEEP_DAYS_DEFAULT:String = "7";

        // --- 各種拡張子

        /** 拡張子_CATPRODUCT */
        public static const EXTENSION_TYPE_CATPRODUCT:String = "CATPRODUCT";
        /** 拡張子_CATPART */
        public static const EXTENSION_TYPE_CATPART:String = "CATPART";
        /** 拡張子_CATDRAW */
        public static const EXTENSION_TYPE_CATDRAWING:String = "CATDRAWING";
        /** 拡張子_CATDRAW(刻印あり) */
        public static const EXTENSION_TYPE_CATDRAWING_HUSH:String = "CATDRAWING";
        /** 拡張子_CATDRAW(サインあり) */
        public static const EXTENSION_TYPE_CATDRAWING_SIGNED:String = "CATDRAWING";
        /** 拡張子_CATANALYSIS */
        public static const EXTENSION_TYPE_CATANALYSIS:String = "CATANALYSIS";
        /** 拡張子_CATRSLT */
        public static const EXTENSION_TYPE_CATANALYSIS_RESULTS:String = "CATANALYSISRESULTS";
        /** 拡張子_CATPROC */
        public static const EXTENSION_TYPE_CATPROCESS:String = "CATPROCESS";
        /** 拡張子_POWER COPY */
        public static const EXTENSION_TYPE_POWERCOPY:String = "CATPART";
        /** 拡張子_CGR */
        public static const EXTENSION_TYPE_CGR:String = "CGR";
        /** 拡張子_CATCGR */
        public static const EXTENSION_TYPE_CATCGR:String = "CGR";
        /** 拡張子_DesignTable-text */
        public static const EXTENSION_TYPE_DESIGNTABLE_TEXT:String = "TXT";
        /** 拡張子_DesignTable-excel */
        public static const EXTENSION_TYPE_DESIGNTABLE_EXCEL:String = "XLS";
        /** 拡張子_XVL Assembly File */
        public static const EXTENSION_TYPE_XVL_ASSEMBLY_FILE:String = "XV0";
        /** 拡張子_XVL Shape File */
        public static const EXTENSION_TYPE_XVL_SHAPE_FILE:String = "XV3";
        /** 拡張子_P-XVL Assembly File */
        public static const EXTENSION_TYPE_P_XVL_ASSEMBLY_FILE:String = "XV0";
        /** 拡張子_P-XVL Shape File */
        public static const EXTENSION_TYPE_P_XVL_SHAPE_FILE:String = "XV3";
        /** 拡張子_V-XVL Assembly File */
        public static const EXTENSION_TYPE_V_XVL_ASSEMBLY_FILE:String = "XV0";
        /** 拡張子_V-XVL Shape File */
        public static const EXTENSION_TYPE_V_XVL_SHAPE_FILE:String = "XV2";
        /** 拡張子_V-XVL Shape File 2 */
        public static const EXTENSION_TYPE_V_XVL_SHAPE_FILE2:String = "XV2";
        /** 拡張子_TIF */
        public static const EXTENSION_TYPE_TIF:String = "TIF";
        /** 拡張子_TIFF */
        public static const EXTENSION_TYPE_TIFF:String = "TIFF";
        /** 拡張子_TIFF(サインあり) */
        public static const EXTENSION_TYPE_TIFF_SIGNED:String = "TIFF";
        /** 拡張子_MDL */
        public static const EXTENSION_TYPE_MDL:String = "MDL";
        /** 拡張子_EXE */
        public static const EXTENSION_TYPE_EXE:String = "EXE";
        /** 拡張子_ZIP */
        public static const EXTENSION_TYPE_ZIP:String = "ZIP";
        /** 拡張子_LZH */
        public static const EXTENSION_TYPE_LZH:String = "LZH";
        /** 拡張子_Excel Document */
        public static const EXTENSION_TYPE_EXCEL:String = "XLS";
        /** 拡張子_Text Document */
        public static const EXTENSION_TYPE_TEXT:String = "TXT";
        /** 拡張子_Word Document */
        public static const EXTENSION_TYPE_WORD:String = "DOC";
        /** 拡張子_JPEG Image */
        public static const EXTENSION_TYPE_JPEG:String = "JPG";
        /** 拡張子_BITMAP Image */
        public static const EXTENSION_TYPE_BITMAP:String = "BMP";
        /** 拡張子_Acrobat PDF */
        public static const EXTENSION_TYPE_PDF:String = "PDF";
        /** 拡張子_GIF Image */
        public static const EXTENSION_TYPE_GIF:String = "GIF";
        /** 拡張子_Power Point */
        public static const EXTENSION_TYPE_POWERPOINT:String = "PPT";
        /** 拡張子_LNK */
        public static const EXTENSION_TYPE_LNK:String = "LNK";
        /** 拡張子_CSV */
        public static const EXTENSION_TYPE_CSV:String = "CSV";
        /** 拡張子_STY */
        public static const EXTENSION_TYPE_STY:String = "STY";
        /** 拡張子_PRT */
        public static const EXTENSION_TYPE_PRT:String = "PRT";
        /** 拡張子_JT */
        public static const EXTENSION_TYPE_JT:String = "JT";        
        /** 拡張子_ASM */
        public static const EXTENSION_TYPE_ASM:String = "ASM";
        /** 拡張子_DRW */
        public static const EXTENSION_TYPE_DRW:String = "DRW";
        
        // --- 出図用・評価用登録チェック結果画面のチェック項目ラベル取得用 
        /** Product構成情報取得できたか */
        public static const PRODUCT_COMPOSITION:String = "PRODUCT_COMPOSITION";
        /** 更新されているか(アセンブリ拘束以外) */
        public static const UPDATED:String = "UPDATED";
        /** Product構成内に同じファイル名が存在していないか */
        public static const SAME_FILE_NAME_EXIST:String = "SAME_FILE_NAME_EXIST";
        /** 形状があるか(補助エレメントのみも不可) */
        public static const IS_THERE_SHAPE:String = "IS_THERE_SHAPE";
        /** すべて非表示になっていないか */
        public static const ALL_NON_DISPLAY:String = "ALL_NON_DISPLAY";
        /** 図面サイズが正しいか */
        public static const SIZE_OF_DRAWING_CORRECT:String = "SIZE_OF_DRAWING_CORRECT";
        /** ID刻印できたか */
        public static const ID_MARKED:String = "ID_MARKED";
        /** 図面の品番が読み取りできたか */
        public static const PARTNO_READ:String = "PARTNO_READ";
        /** ファイル名がルール通りか(出図リンクTOPファイル) */
        public static const FILE_NAME_ACCORDING_RULE_TOP:String = "FILE_NAME_ACCORDING_RULE_TOP";
        /** ファイル名がルール通りか(出図リンクTOPファイル以外) */
        public static const FILE_NAME_ACCORDING_RULE:String = "FILE_NAME_ACCORDING_RULE";
        /** 旧図枠でないか */
        public static const OLD_DRAWING:String = "OLD_DRAWING";
        /** 上記以外にエラーが発生していないか */
        public static const OTHER_ERROR:String = "OTHER_ERROR";

        /** 構成情報取得できたか */
        public static const NX_COMPOSITION:String = "NX_COMPOSITION";
        /** 更新されているか(WAVE) */
        public static const WAVE_UPDATED:String = "WAVE_UPDATED";
        /** 更新されているか(外部) */
        public static const EX_UPDATED:String = "EX_UPDATED";
        /** 表示形状があるか */
        public static const LAYER_SHAPE:String = "LAYER_SHAPE";
        
        /** 構成情報取得できたか */
        public static const PROE_COMPOSITION:String = "PROE_COMPOSITION";
        /** 更新されているか */
        public static const PROE_UPDATED:String = "PROE_UPDATED";
        /** 形状があるか */
        public static const PROE_SHAPE:String = "PROE_SHAPE";
        /** すべて非表示になっていないか */
        public static const PROE_DISPLAY:String = "PROE_DISPLAY";
        

        // --- 出図用・評価用登録チェック結果画面のチェック結果詳細ラベル取得用
        /** チェック結果詳細_正常 */
        public static const CONFIRM_REGIST_CHECK_DETAIL_OK:String = "CONFIRM_REGIST_CHECK_DETAIL_OK";

        // --- 出図用・評価用登録チェック結果画面のチェック結果欄の値
        /** チェック結果_正常 */
        public static const CONFIRM_REGIST_CHECK_RESULT_OK:String = "0";
        /** チェック結果_異常 */
        public static const CONFIRM_REGIST_CHECK_RESULT_NG:String = "1";
        /** チェック結果_チェック無し */
        public static const CONFIRM_REGIST_CHECK_RESULT_NON:String = "2";

        // --- ドキュメント種類
        /** ドキュメント種類_フォルダ */
        public static const DOC_TYPE_FOLDER:String = "0";
        /** ドキュメント種類_ファイル */
        public static const DOC_TYPE_FILE:String = "1";
        /** ドキュメント種類_エラー */
        public static const DOC_TYPE_ERROR:String = "9";

        // --- ダウンロード処理区分
        /** ダウンロード処理区分．参照 **/
        public static const DOWNLOAD_KBN_REF:String = "1";
        /** ダウンロード処理区分．ダウンロード **/
        public static const DOWNLOAD_KBN_DL:String = "2";
        /** ダウンロード処理区分．ダウンロード(フォルダ作成なし) **/
        public static const DOWNLOAD_KBN_DL_WITHOUT_FOLDER:String = "3";
        /** ダウンロード処理区分．削除 **/
        public static const DOWNLOAD_KBN_DEL:String = "4";
        /** ダウンロード処理区分. 承認回覧用図面参照 */
        public static const DOWNLOAD_KBN_CIR_REF:String = "5";

        // --- ダウンロードフォルダ作成区分

        /** ダウンロードフォルダ作成区分．デフォルト **/
        public static const DOWNLOAD_FOLDER_CREATE_TYPE_DEFAULT:String = "0";

        /** ダウンロードフォルダ作成区分．上書き **/
        public static const DOWNLOAD_FOLDER_CREATE_TYPE_OVERRIDE:String = "1";

        /** ダウンロードフォルダ作成区分．連番 **/
        public static const DOWNLOAD_FOLDER_CREATE_TYPE_SERIAL_NUM:String = "2";

        /** ダウンロードフォルダ作成区分．全体をキャンセル **/
        public static const DOWNLOAD_FOLDER_CREATE_TYPE_CANCEL_ALL:String = "3";


        // --- バイト数

        /** WINDOWSパス最大バイト数 **/
        public static const WINDOWS_PATH_MAX_LENGTH_BYTE:int = 256;

        // --- CATIAマクロ処理結果

        /** CATIAマクロ処理結果_正常終了 */
        public static const CATIA_MACRO_STATUS_OK:int = 0;
        /** CATIAマクロ処理結果_環境設定不備 */
        public static const CATIA_MACRO_STATUS_ENV_INCOMPLETE:int = 1;
        /** CATIAマクロ処理結果_共通マクロ起動エラー */
        public static const CATIA_MACRO_STATUS_MACRO_START:int = 2;
        /** CATIAマクロ処理結果_マクロログ出力失敗 */
        public static const CATIA_MACRO_STATUS_LOG_OUTPUT:int = 3;
        /** CATIAマクロ処理結果_データオープン失敗 */
        public static const CATIA_MACRO_STATUS_DATA_OPEN:int = 4;
        /** CATIAマクロ処理結果_対象外ファイルをオープン指定 */
        public static const CATIA_MACRO_STATUS_TARGET_FILE_OPEN:int = 5;
        /** CATIAマクロ処理結果_処理対象ファイルに読み取り専用属性付属時 */
        public static const CATIA_MACRO_STATUS_FILE_READ_ONLY:int = 6;
        /** CATIAマクロ処理結果_刻印ID処理で失敗 */
        public static const CATIA_MACRO_STATUS_ID_PROCESS:int = 7;
        /** CATIAマクロ処理結果_データ保存処理で失敗 */
        public static const CATIA_MACRO_STATUS_DATA_SAVE:int = 8;
        /** CATIAマクロ処理結果_刻印ID情報出力処理で失敗 */
        public static const CATIA_MACRO_STATUS_ID_OUTPUT:int = 9;
        /** CATIAマクロ処理結果_品番取得処理で失敗 */
        public static const CATIA_MACRO_STATUS_PARTNO_ACQUIRE:int = 10;
        /** CATIAマクロ処理結果_品番出力処理で失敗 */
        public static const CATIA_MACRO_STATUS_PARTNO_OUTPUT:int = 11;
        /** CATIAマクロ処理結果_図枠リスト取得処理で失敗 */
        public static const CATIA_MACRO_STATUS_CHART_FRAME_ACQUIRE:int = 12;
        /** CATIAマクロ処理結果_構成情報出力処理で失敗 */
        public static const CATIA_MACRO_STATUS_COMPOSITION_OUTPUT:int = 13;
        /** CATIAマクロ処理結果_Analysisデータが配下に存在する */
        public static const CATIA_MACRO_STATUS_ANALYSIS_DATA:int = 14;
        /** CATIAマクロ処理結果_不正データが配下に存在する */
        public static const CATIA_MACRO_STATUS_IMPROPER_DATA:int = 15;
        /** CATIAマクロ処理結果_図枠が旧図枠 */
        public static const CATIA_MACRO_STATUS_OLD_DRAWING:int = 16;
        /** CATIAマクロ処理結果_登録対象外データを含む(バージョンが異なるデータ) */
        public static const CATIA_MACRO_STATUS_UNFIT_VERSION:int = 17;
        /** CATIAマクロ処理結果_システムエラー */
        public static const CATIA_MACRO_STATUS_SYSTEM_ERROR:int = 99;

        // --- NXマクロ処理結果
        /** NXマクロ処理結果_正常終了 <code>0</code> */
        public static const NX_MACRO_STATUS_OK:int = 0;
        /** NXマクロ処理結果_環境設定不備 <code>1</code> */
        public static const NX_MACRO_STATUS_ENV_INCOMPLETE:int = 1;
        /** NXマクロ処理結果_マクロログ出力失敗 <code>2</code> */
        public static const NX_MACRO_STATUS_MACRO_START:int = 2;
        /** NXマクロ処理結果_データオープン失敗 <code>3</code> */
        public static const NX_MACRO_STATUS_DATA_OPEN:int = 3;
        /** NXマクロ処理結果_構成情報出力処理で失敗 <code>4</code> */
        public static const NX_MACRO_STATUS_COMPOSITION_OUTPUT:int = 4;
        /** NXマクロ処理結果_不正データが配下に存在する <code>5</code> */
        public static const NX_MACRO_STATUS_IMPROPER_DATA:int = 5;
        /** NXマクロ処理結果_ライセンスがない <code>6</code> */
        public static const NX_MACRO_STATUS_NO_LICENSE:int = 6;
        /** NXマクロ処理結果_ライセンスサーバーの応答がない <code>7</code> */
        public static const NX_MACRO_STATUS_LICENSE_SV_BUSY:int = 7;
        /** NXマクロ処理結果_システムエラー <code>99</code> */
        public static const NX_MACRO_STATUS_SYSTEM_ERROR:int = 99;

        // --- ProEマクロ処理結果
        /** PROEマクロ処理結果_正常終了 <code>0</code> */
        public static const PROE_MACRO_STATUS_OK:int = 0;
        /** PROEマクロ処理結果_環境設定不備 <code>1</code> */
        public static const PROE_MACRO_STATUS_ENV_INCOMPLETE:int = 1;
        /** PROEマクロ処理結果_マクロログ出力失敗 <code>2</code> */
        public static const PROE_MACRO_STATUS_MACRO_START:int = 2;
        /** PROEマクロ処理結果_データオープン失敗 <code>3</code> */
        public static const PROE_MACRO_STATUS_DATA_OPEN:int = 3;
        /** PROEマクロ処理結果_構成情報出力処理で失敗 <code>4</code> */
        public static const PROE_MACRO_STATUS_COMPOSITION_OUTPUT:int = 4;
        /** PROEマクロ処理結果_不正データが配下に存在する <code>5</code> */
        public static const PROE_MACRO_STATUS_IMPROPER_DATA:int = 5;
        /** PROEマクロ処理結果_ライセンスがない <code>6</code> */
        public static const PROE_MACRO_STATUS_NO_LICENSE:int = 6;
        /** PROEマクロ処理結果_ライセンスサーバーの応答がない <code>7</code> */
        public static const PROE_MACRO_STATUS_LICENSE_SV_BUSY:int = 7;
        /** PROEマクロ処理結果_システムエラー <code>99</code> */
        public static const PROE_MACRO_STATUS_SYSTEM_ERROR:int = 99;
        
        // --- CATIAマクロ処理結果ファイル名 
        /** CATIAマクロ_処理結果ファイル名 */
        public static const CATIA_MACRO_CHECK_FILE:String = "catiaCheckInfo.xml";
        /** CATIAマクロ_変換結果ファイル名 */
        public static const CATIA_MACRO_ASSY_FILE:String = "assy.xml";

        /** NXマクロ_処理結果ファイル名 */
        public static const NX_MACRO_CHECK_FILE:String = "nxCheckInfo.xml";
        /** NXマクロ_変換結果ファイル名 */
        public static const NX_MACRO_ASSY_FILE:String = "nx_assy.xml";

        /** ProEマクロ_処理結果ファイル名 */
        public static const PROE_MACRO_CHECK_FILE:String = "proeCheckInfo.xml";        
        /** ProEマクロ_変換結果ファイル名 */
        public static const PROE_MACRO_ASSY_FILE:String = "proe_assy.xml";
        
        /** CADロックファイル名 */
        public static const CAD_MACRO_LOCK_FILE:String = "cadLock.txt";
        /** ExDBロックファイル名 */
        public static const EXDB_MACRO_LOCK_FILE:String = "checkInStatus0.txt";

        // --- CATIAマクロ処理結果ファイル タグ名
        /** CATIAマクロ_処理結果ファイル_タグ名_内部プロダクト */
        public static const CATIA_MACRO_ELEMENT_STRUCTURE:String = "STRUCTURE";
        /** CATIAマクロ_処理結果ファイル_タグ名_CATPRODUCT */
        public static const CATIA_MACRO_ELEMENT_CATPRODUCT:String = "CATPRODUCT";
        /** CATIAマクロ_処理結果ファイル_タグ名_CATPART */
        public static const CATIA_MACRO_ELEMENT_CATPART:String = "CATPART";
        /** CATIAマクロ_処理結果ファイル_タグ名_CATDRAWING */
        public static const CATIA_MACRO_ELEMENT_CATDRAWING:String = "CATDRAWING";

        /** ProEマクロ_処理結果ファイル_タグ名_ASM */
        public static const PROE_MACRO_ELEMENT_ASM:String = "ASM";
        /** ProEマクロ_処理結果ファイル_タグ名_ProEPrt */
        public static const PROE_MACRO_ELEMENT_PRT:String = "PROEPRT";
        /** ProEマクロ_処理結果ファイル_タグ名_DRW */
        public static const PROE_MACRO_ELEMENT_DRW:String = "DRW";

        // --- 参照CADマクロのType用 		
        /** CATPRODUCT */
        public static const CAD_MACRO_TYPE_CATPRODUCT:String = "CATProduct";
        /** CATPART */
        public static const CAD_MACRO_TYPE_CATPART:String = "CATPart";
        /** CATDRAW */
        public static const CAD_MACRO_TYPE_CATDRAWING:String = "CATDrawing";
        /** PRT(NX) */
        public static const CAD_MACRO_TYPE_NX_PRT:String = "prt";
        /** ASM(ProE) */
        public static const CAD_MACRO_TYPE_PROE_ASM:String = "asm";
        /** PRT(ProE) */
        public static const CAD_MACRO_TYPE_PROE_PRT:String = "prt";
        /** DRW(ProE) */
        public static const CAD_MACRO_TYPE_PROE_DRW:String = "drw";
        
        // --- WINDOWSタブ  
        /** WINDOWSタブ KB */
        public static const TAB_WIN_KB:String = " KB";

        /** WINDOWSタブ 日付フォーマット */
        public static const TAB_WIN_DATE_FORMAT:String = "YYYY/MM/DD JJ:NN";

        /** ログファイル切り替え用日付フォーマット */
        public static const LOG_CYCLE_DATE_FORMAT:String = "YYYY-MM-DD";

        /** CL-SV間通信のレスポンス Start, End ログ出力用フォーマット */
        public static const DATE_FORMAT_SVACCESS_LOGGING:String = "YYYY-MM-DD JJ:NN:SS.QQQ";

        /** CL-SV間通信のレスポンス 経過時間 ログ出力用フォーマット */
        public static const DATE_FORMAT_SVACCESS_COST_LOGGING:String = "JJ:NN:SS.QQQ";

        /*
         * f.i. DATE FORMAT
         * EEEE, MMM. D, YYYY at L:NN:QQQ A = Tuesday, Sept. 8, 2005 at 1:26:012 PM
         */

        // --- 登録元システム

        /** 登録元システム_Windows */
        public static const REGISTER_SYSTEM_WINDOWS:String = "0";

        /** 登録元システム_ExDB */
        public static const REGISTER_SYSTEM_EXDB:String = "1";

        /** 登録元システム_評価用 */
        public static const REGISTER_SYSTEM_EVALUATION:String = "2";

        /** 登録元システム_移行(FDMS) */
        public static const REGISTER_SYSTEM_MGRT_FDMS:String = "3";

        /** 登録元システム_移行(ExDB) */
        public static const REGISTER_SYSTEM_MGRT_EXDB:String = "4";

        /** 登録元システム_移行(承認図) */
        public static const REGISTER_SYSTEM_MGRT_WINDOWS:String = "5";

        // --- 色凡例画面．画面区分

        /** 色凡例画面．画面区分_出図_登録 */
        public static const ROW_COLOR_DISPLAY_KBN_SHUTSUZU:String = "1";

        /** 色凡例画面．画面区分_評価 */
        public static const ROW_COLOR_DISPLAY_KBN_HYOKA:String = "2";

        /** 色凡例画面．画面区分_出図_参照 */
        public static const ROW_COLOR_DISPLAY_KBN_SHUTSUZU_REF:String = "3";

        /*******************************************************************************
         * AdvancedDataGrid setStyle StylePlop
         *******************************************************************************/

        /** StylePlop_行背景色設定 **/
        public static const STYLE_PLOP_ROW_COLOR:String = "alternatingItemColors";

        /** StylePlop_ツリー＋ボタンアイコン設定 **/
        public static const STYLE_PLOP_TREE_PLUS_ICON:String = "disclosureOpenIcon";

        /** StylePlop_ツリー－ボタンアイコン設定 **/
        public static const STYLE_PLOP_TREE_MINUS_ICON:String = "disclosureClosedIcon";

        /*******************************************************************************
         * Color
         *******************************************************************************/

        /** 色．薄灰 **/
        public static const COLOR_TYPE_ASH:uint = 0xdddddd;

        /** 色．黄 **/
        public static const COLOR_TYPE_YELLOW:uint = 0xffffb2;

        /** 色．青 **/
        public static const COLOR_TYPE_BLUE:uint = 0xccccff;

        /** 色．赤 **/
        public static const COLOR_TYPE_RED:uint = 0xffb7b7;

        /** 色．灰 **/
        public static const COLOR_TYPE_GRAY:uint = 0xbbbbbb;

        /** 色. オレンジ */
        public static const COLOR_TYPE_ORANGE:uint = 0xff7632;

        /** 色．緑 */
        public static const COLOR_TYPE_GREEN:uint = 0x98fb98;
        
        /*******************************************************************************
         * Graph Color
         *******************************************************************************/
        
        /** グラフ色．赤00 **/
        public static const COLOR_GRAPH_RED00:uint = 0xFF3366;
        
        /** グラフ色．赤33 **/
        public static const COLOR_GRAPH_RED33:uint = 0xFF3300;
        
        /** グラフ色．赤66 **/
        public static const COLOR_GRAPH_RED66:uint = 0xFF0000;
        
        /** グラフ色．橙00 **/
        public static const COLOR_GRAPH_ORANGE00:uint = 0xFFCC66;
        
        /** グラフ色．橙33 **/
        public static const COLOR_GRAPH_ORANGE33:uint = 0xFFCC00;
        
        /** グラフ色．橙66 **/
        public static const COLOR_GRAPH_ORANGE66:uint = 0xFF9900;
        
        /** グラフ色．黄00 **/
        public static const COLOR_GRAPH_YELLOW00:uint = 0xFFFFCC;
        
        /** グラフ色．黄33 **/
        public static const COLOR_GRAPH_YELLOW33:uint = 0xFFFF66;
        
        /** グラフ色．黄66 **/
        public static const COLOR_GRAPH_YELLOW66:uint = 0xFFFF00;
        
        /*******************************************************************************
         * 単位
         *******************************************************************************/

        /** メガバイト **/
        public static const MEGA_BYTE:String = "MB";

        /*******************************************************************************
         * DB定数
         *******************************************************************************/

        /** ドキュメントタイプコード_UnKnown <code>0</code>*/
        public static const DOCTYPECODE_UNKNOWN:String = "0";

        /** ドキュメントタイプコード_CATPRODUCT <code>1</code> */
        public static const DOCTYPECODE_CATPRODUCT:String = "1";

        /** ドキュメントタイプコード_CATPART <code>2</code> */
        public static const DOCTYPECODE_CATPART:String = "2";

        /** ドキュメントタイプコード_CATDRAWING <code>3</code> */
        public static const DOCTYPECODE_CATDRAWING:String = "3";

        /** ドキュメントタイプコード_CATDRAWING_刻印あり <code>4</code> */
        public static const DOCTYPECODE_CATDRAWING_KOKUIN:String = "4";

        /** ドキュメントタイプコード_CATDRAWING_サインあり <code>5</code> */
        public static const DOCTYPECODE_CATDRAWING_SIGNED:String = "5";

        /** ドキュメントタイプコード_CATANALYSIS <code>6</code> */
        public static const DOCTYPECODE_CATANALYSIS:String = "6";

        /** ドキュメントタイプコード_CATANALYSIS_RESULTS <code>7</code> */
        public static const DOCTYPECODE_CATANALYSIS_RESULTS:String = "7";

        /** ドキュメントタイプコード_CATPROCESS <code>8</code> */
        public static const DOCTYPECODE_CATPROCESS:String = "8";

        /** ドキュメントタイプコード_POWER_COPY <code>9</code> */
        public static const DOCTYPECODE_POWERCOPY:String = "9";

        /** ドキュメントタイプコード_CGR <code>10</code> */
        public static const DOCTYPECODE_CGR:String = "10";

        /** ドキュメントタイプコード_CATCGR <code>11</code> */
        public static const DOCTYPECODE_CATCGR:String = "11";

        /** ドキュメントタイプコード_DesignTableText <code>12</code> */
        public static const DOCTYPECODE_DESIGNTABLE_TEXT:String = "12";

        /** ドキュメントタイプコード_DesignTableExcel <code>13</code> */
        public static const DOCTYPECODE_DESIGNTABLE_EXCEL:String = "13";

        /** ドキュメントタイプコード_XVL_AssemblyFile <code>14</code> */
        public static const DOCTYPECODE_XVL_ASSEMBLY_FILE:String = "14";

        /** ドキュメントタイプコード_XVL_ShapeFile <code>15</code> */
        public static const DOCTYPECODE_XVL_SHAPE_FILE:String = "15";

        /** ドキュメントタイプコード_PXVL_AssemblyFile <code>16</code> */
        public static const DOCTYPECODE_PXVL_ASSEMBLY_FILE:String = "16";

        /** ドキュメントタイプコード_PXVL_ShapeFile <code>17</code> */
        public static const DOCTYPECODE_PXVL_SHAPE_FILE:String = "17";

        /** ドキュメントタイプコード_VXVL_AssemblyFile <code>18</code> */
        public static const DOCTYPECODE_VXVL_ASSEMBLY_FILE:String = "18";

        /** ドキュメントタイプコード_VXVL_ShapeFile <code>19</code> */
        public static const DOCTYPECODE_VXVL_SHAPE_FILE:String = "19";

        /** ドキュメントタイプコード_VXVL_ShapeFile2 <code>20</code> */
        public static const DOCTYPECODE_VXVL_SHAPE_FILE2:String = "20";

        /** ドキュメントタイプコード_TIFF <code>21</code> */
        public static const DOCTYPECODE_TIFF:String = "21";

        /** ドキュメントタイプコード_TIFF_サインあり <code>22</code> */
        public static const DOCTYPECODE_TIFF_SIGNED:String = "22";

        /** ドキュメントタイプコード_MDL <code>23</code> */
        public static const DOCTYPECODE_MDL:String = "23";

        /** ドキュメントタイプコード_EXE <code>24</code> */
        public static const DOCTYPECODE_EXE:String = "24";

        /** ドキュメントタイプコード_ZIP <code>25</code> */
        public static const DOCTYPECODE_ZIP:String = "25";

        /** ドキュメントタイプコード_LZH <code>26</code> */
        public static const DOCTYPECODE_LZH:String = "26";

        /** ドキュメントタイプコード_Excel <code>27</code> */
        public static const DOCTYPECODE_EXCEL:String = "27";

        /** ドキュメントタイプコード_TEXT <code>28</code> */
        public static const DOCTYPECODE_TEXT:String = "28";

        /** ドキュメントタイプコード_WORD <code>29</code> */
        public static const DOCTYPECODE_WORD:String = "29";

        /** ドキュメントタイプコード_JPEG <code>30</code> */
        public static const DOCTYPECODE_JPEG:String = "30";

        /** ドキュメントタイプコード_BITMAP <code>31</code> */
        public static const DOCTYPECODE_BITMAP:String = "31";

        /** ドキュメントタイプコード_PDF <code>32</code> */
        public static const DOCTYPECODE_PDF:String = "32";

        /** ドキュメントタイプコード_GIF <code>33</code> */
        public static const DOCTYPECODE_GIF:String = "33";

        /** ドキュメントタイプコード_POWERPOINT <code>34</code> */
        public static const DOCTYPECODE_POWERPOINT:String = "34";

        /** ドキュメントタイプコード_LNK <code>35</code> */
        public static const DOCTYPECODE_LNK:String = "35";

        /** ドキュメントタイプコード_STY <code>36</code> */
        public static const DOCTYPECODE_STY:String = "36";

        /** ドキュメントタイプコード_PRT(3D) <code>37</code> */
        public static const DOCTYPECODE_PRT_3D:String = "37";

        /** ドキュメントタイプコード_PRT(2D) <code>38</code> */
        public static const DOCTYPECODE_PRT_2D:String = "38";

        /** ドキュメントタイプコード_JT <code>39</code> */
        public static const DOCTYPECODE_JT:String = "39";

        /** ドキュメントタイプコード_ASM(ProE) <code>40</code> */
        public static const DOCTYPECODE_PROE_ASM:String = "40";
        
        /** ドキュメントタイプコード_PRT(ProE) <code>41</code> */
        public static const DOCTYPECODE_PROE_PRT:String = "41";
        
        /** ドキュメントタイプコード_DRW(ProE) <code>42</code> */
        public static const DOCTYPECODE_PROE_DRW:String = "42";
        
        /** フォルダ種別フラグ．上位フォルダ **/
        public static const FOLDER_TYPE_FLG_UPPER:String = "0";

        /** フォルダ種別フラグ．イベントフォルダ **/
        public static const FOLDER_TYPE_FLG_EVENT:String = "1";

        /** フォルダ種別フラグ．下位フォルダ **/
        public static const FOLDER_TYPE_FLG_LOWER:String = "2";

        /** 変換ステータス．変換待ち **/
        public static const CONV_STATUS_WAIT:String = "0";

        /** 変換ステータス．変換中 **/
        public static const CONV_STATUS_MIDDLE:String = "1";

        /** 変換ステータス．変換完了 **/
        public static const CONV_STATUS_OK:String = "2";

        /** 変換ステータス．変換エラー **/
        public static const CONV_STATUS_ERROR:String = "3";

        /** ロックフラグ．ロック解除 **/
        public static const LOCK_FLG_UNLOCK:String = "0";

        /** ロックフラグ．ロック **/
        public static const LOCK_FLG_LOCK:String = "1";

        /** データ登録フラグ．未登録(データが登録されていない) **/
        public static const DATA_CREATE_FLG_OFF:String = "0";

        /** データ登録フラグ．登録(データが登録されている) **/
        public static const DATA_CREATE_FLG_ON:String = "1";

        /** 履歴TBL．ファイルステータス．追加 **/
        public static const FILE_STATUS_ADD:String = "1";

        /** 履歴TBL．ファイルステータス．変更 **/
        public static const FILE_STATUS_UPD:String = "2";

        /** 履歴TBL．ファイルステータス．削除 **/
        public static const FILE_STATUS_DEL:String = "3";

        /** 論理ファイル(評価)TBL．タブ種別．設計 **/
        public static const HYOKA_TAB_TYPE_SEKKEI:String = "0";

        /** 論理ファイル(評価)TBL．タブ種別．非パラ **/
        public static const HYOKA_TAB_TYPE_NOTPARAM:String = "1";

        /** 論理ファイル(評価)TBL．タブ種別．3DViewer **/
        public static const HYOKA_TAB_TYPE_3DVIEWER:String = "2";

        /** 論理ファイル(評価)TBL．タブ種別．TIFF **/
        public static const HYOKA_TAB_TYPE_TIFF:String = "3";

        /** 社員タイプ．正社員 **/
        public static const EMPLOYEE_TYPE_REGULAR:String = "1";

        /** 社員タイプ．派遣社員 **/
        public static const EMPLOYEE_TYPE_TEMP:String = "2";

        /** 社員タイプ．委託 **/
        public static const EMPLOYEE_TYPE_COMMISSION:String = "3";

        /** 自動更新フラグ．手動 **/
        public static const AUTO_MOD_MANUAL:String = "0";

        /** 自動更新フラグ．自動 **/
        public static const AUTO_MOD_AUTO:String = "1";

        /** 優先設定．優先なし **/
        public static const PRIORITY_ESTAB_OFF:String = "0";

        /** 優先設定．優先あり **/
        public static const PRIORITY_ESTAB_ON:String = "1";

        /** 出図／評価．出図用 **/
        public static const SHUTSUZU_HYOKA_S:String = "0";

        /** 出図／評価．評価用 **/
        public static const SHUTSUZU_HYOKA_H:String = "1";

        /** タイプ．非パラ **/
        public static const DATA_TYPE_NON_PARA:String = "0";

        /** タイプ．サイン**/
        public static const DATA_TYPE_SIGN:String = "1";

        /** タイプ．XVL(CATIA)**/
        public static const DATA_TYPE_XVL:String = "2";

        /** タイプ．TIFF **/
        public static const DATA_TYPE_TIFF:String = "3";

        /** タイプ．JT変換**/
        public static const DATA_TYPE_JT:String = "4";

        /** タイプ．棚チェック **/
        public static const DATA_TYPE_TANA:String = "5";
        
        /** タイプ．XVL(ProE)**/
        public static const DATA_TYPE_XVL_PROE:String = "6";

        /** リンク種類．出図リンク**/
        public static const LINK_KIND_SHUTSUZU_LINK:String = "1";

        /** リンク種類．参考リンク**/
        public static const LINK_KIND_SANKO_LINK:String = "2";

        /** リンク種類．リンク **/
        public static const LINK_KIND_LINK:String = "3";


        /** ToolTip表示速度 */
        public static const TOOLTIP_SHOW_DERAY:int = 300;

        /** グリッド行背景色設定_デフォルト背景行数 */
        public static const ROWCOLOR_DEFAULT_ROW_COUNT:int = 100;


        /** 非パラ変換フラグ．変換しない */
        public static const CONV_NON_PARA_FLG_OFF:String = "0";

        /** 非パラ変換フラグ．変換する */
        public static const CONV_NON_PARA_FLG_ON:String = "1";

        /** XVL変換フラグ．変換しない */
        public static const CONV_XVL_FLG_OFF:String = "0";

        /** XVL変換フラグ．変換する */
        public static const CONV_XVL_FLG_ON:String = "1";

        /** TIFF変換フラグ．変換しない */
        public static const CONV_TIFF_FLG_OFF:String = "0";

        /** TIFF変換フラグ．変換する */
        public static const CONV_TIFF_FLG_ON:String = "1";

        /** 承認図フラグ. NG */
        public static const APPROVAL_FLG_NG:String = "0";

        /** 承認図フラグ. OK */
        public static const APPROVAL_FLG_OK:String = "1";

        /** 棚フラグ. 棚なし */
        public static const GENERIC_TANA_FLG_NON:String = "0";

        /** 棚フラグ. 棚あり */
        public static const GENERIC_TANA_FLG_EXIST:String = "1";

        /** 棚フラグ. 棚不明 */
        public static const GENERIC_TANA_FLG_UNKNOWN:String = "2";

        /** TBガイドフラグ. TBガイドフラグなし */
        public static const GENERIC_TB_GUIDE_FLG_NON:String = "0";

        /** TBガイドフラグ. TBガイドフラグあり */
        public static const GENERIC_TB_GUIDE_FLG_EXIST:String = "1";

        /** TBガイドフラグ. TBガイドフラグ不明 */
        public static const GENERIC_TB_GUIDE_FLG_UNKNOWN:String = "2";


        /** ExDB2ログインステータス_正常 */
        public static const EXDB2_LOGIN_STATUS_OK:String = "0";

        /** ExDB2ログインステータス_その他エラー状態 */
        public static const EXDB2_LOGIN_STATUS_OTHER_ERROR:String = "1";

        /** ExDB2ログインステータス_ユーザ未登録エラー状態 */
        public static const EXDB2_LOGIN_STATUS_NOUSER_ERROR:String = "2";

        /** ExDB2ログインステータス_サーバリクエストエラー状態 */
        public static const EXDB2_LOGIN_STATUS_CONNECTION_ERROR:String = "3";

        /** CADバージョン取得_システムエラー **/
        public static const ERR_CODE_CAD_VERSION_SYSTEM_ERROR:int = -1;

        /** CADバージョン取得_失敗 **/
        public static const ERR_CODE_CAD_VERSION_DEFIND:int = 0;

        /** リリースのバージョン表記 **/
        public static const CATIA_VERSION_RELEASE_HEADER:String = "R";

        /** サービスパックのバージョン表記 **/
        public static const CATIA_VERSION_SERVICE_PACK_HEADER:String = "SP";

        /** ProEのメインバージョン接頭語 表記 **/
        public static const PROE_VERSION_MAIN_HEADER:String = "V";
        /** ProEのサブバージョン接頭語 表記 **/
        public static const PROE_VERSION_SUB_HEADER:String = "M";

        /** NX 3D/2D判定 判定不可 <code>-1<code> **/
        public static const NX_3D2DKBN_UNKNOWN:int = -1;

        /** NX 3D/2D判定 3D <code>0<code> **/
        public static const NX_3D2DKBN_3D:int = 0;

        /** NX 3D/2D判定 2D <code>1<code> **/
        public static const NX_3D2DKBN_2D:int = 1;

        /** TOPファイル名_キーワード */
        public static const TOP_PRODUCT_KEY:String = "TOP";

        /** TOPファイル名_接尾語 */
        public static const TOP_PRODUCT_SUFFIX:String = "_" + TOP_PRODUCT_KEY;

        /** NXファイル 3D/2D判定用接尾語 3D **/
        public static const NX_FILE_SUFFIX_3D:String = "_3D";

        /** NXファイル 3D/2D判定用接尾語 2D **/
        public static const NX_FILE_SUFFIX_2D:String = "_2D";

        /** NXトップファイル 3D/2D判定用接尾語 3D **/
        public static const NX_TOPFILE_SUFFIX_3D:String = NX_FILE_SUFFIX_3D + TOP_PRODUCT_SUFFIX;

        /** NXトップファイル 3D/2D判定用接尾語 2D **/
        public static const NX_TOPFILE_SUFFIX_2D:String = NX_FILE_SUFFIX_2D + TOP_PRODUCT_SUFFIX;


        /** dateFieldコンポーネントのデフォルト日付フォーマット */
        public static const DATE_FIELD_DEF_DATE_FORMAT:String = "YYYY/MM/DD";


		/** 層フラグ "0":評価用 **/
		public static const FLEVEL_FLG_HYOKA:String = "0";
        
        /** 層フラグ "1":出図用 **/
        public static const FLEVEL_FLG_SHUTSUZU:String = "1";
        
        /** 層フラグ "2":作業用 **/
        public static const FLEVEL_FLG_WORK:String = "2";
    }
}