Cyanogenmod for P-01D
=====================

### 概要
P-01DのOSをCyanogenmod用に移植するプロジェクトです。

### 注意点
*   転んでも泣かないこと。
*   すべて自己責任です。

### 連絡
*   フォークについてはDevRenax氏およびchuukai氏とは無関係ということで、氏にご連絡はなさらないように願います。
   
### ビルド方法

#### ビルド環境
*   Ubuntu 14.04.6 LTS x64
*   openjdk-6-jdk:amd64


#### ビルド前に以下のリンクを読んで理解すること。
*  [Cyanogenmod Wiki](http://wiki.cyanogenmod.com/index.php?title=Main_Page)
*  [Version Control with Repo and Git](http://source.android.com/source/version-control.html)
*  [Android Debug Bridge](http://developer.android.com/tools/help/adb.html)
*  [Initializing a Build Environment](http://source.android.com/source/initializing.html)

#### Cyanogenmodのソースコードを取得 (CM10の場合)
	mkdir cyanogenmod; cd cyanogenmod
	repo init -u https://github.com/CyanogenMod/android.git -b jellybean
	cd .repo
	wget https://raw.github.com/SumaPhone/android_device_panasonic_ponyo/jb-dev/local_manifest.xml
	cd ..
	repo sync

#### 必要なプロプライエタリファイルを取得・vendorツリーの生成
	cd cyanogenmod/device/panasonic/ponyo
	sh extract-files.sh
	
#### Cyanogenmodのソースにパッチを当てる
	cd cyanogenmod
	sh device/panasonic/ponyo/run_patch.sh

#### Cyanogenmodに必要なファイルを取得する
	cd cyanogenmod/vendor/cm/
	sh get-prebuilts

#### ビルド
	cd cyanogenmod
	. build/envsetup.sh
	brunch cm_ponyo-eng 2>&1 | tee make.log

#### 2度目以降のビルドを高速化させる(Optional)
	export USE_CCACHE=1
	export CCACHE_DIR=任意のディレクトリ/CCACHE

をビルド前にやっておく

#### パッチの初期化
	repo forall -c git reset --hard
