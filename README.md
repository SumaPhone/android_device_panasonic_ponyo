Cyanogenmod for P-01D
=====================

### 概要 About
P-01DのOSをCyanogenmod用に移植するプロジェクトです。

Porting Cyanogenmod for P-01D.

### 注意点
*   転んでも泣かないこと。 Don't give up.
*   すべて自己責任です。 At your own risk.

### 連絡
*   フォークについてはDevRenax氏およびchuukai氏とは無関係ということで、氏にご連絡はなさらないように願います。
*   This is a Forked Project. Pls don't contact for original developers DevRenax, chuukai.

### ビルド方法 How to build

#### ビルド環境 Build environment
*   Ubuntu 14.04.6 LTS x64
*   openjdk-6-jdk:amd64
*   pyenv 2.7.18 and 3.9.0


#### ビルド前に以下のリンクを読んで理解すること。 Read it and understand this.
*  [Cyanogenmod Wiki](https://web.archive.org/web/20121106214932/http://wiki.cyanogenmod.com/index.php?title=Main_Page)
*  [Version Control with Repo and Git](https://source.android.com/docs/setup/create/repo)
*  [Android Debug Bridge](http://developer.android.com/tools/help/adb.html)
*  [Initializing a Build Environment](https://web.archive.org/web/20121221165648/http://source.android.com/source/initializing.html)

#### Cyanogenmodのソースコードを取得 (CM10の場合)
#### Cloning and Initializing Cyanogenmod source (CM10)
	mkdir cyanogenmod; cd cyanogenmod
	repo init -u https://github.com/CyanogenMod/android.git -b jellybean
	cd .repo
	mkdir local_manifests ; cd local_manifests
	wget https://raw.github.com/SumaPhone/android_device_panasonic_ponyo/deprecated/jb-dev/local_manifest.xml
	cd ../..
	repo sync --no-clone-bundle

#### 必要なプロプライエタリファイルを取得・vendorツリーの生成
#### Pull proprietary files and Making vendor tree
	cd cyanogenmod/device/panasonic/ponyo
	sudo sh extract-files.sh

ICS用のドライバを取得してvendorツリーへ置く

Adreno200-AU_LINUX_ANDROID_ICS_CHOCO_CS.04.00.03.06.001を検索してどっかから持ってくる。

Download GPU driver and push to vendor tree.

Search and Find Adreno200-AU_LINUX_ANDROID_ICS_CHOCO_CS.04.00.03.06.001

	
#### Cyanogenmodのソースにパッチを当てる
#### Add patch to source
	cd cyanogenmod
	sh device/panasonic/ponyo/run_patch.sh

#### Cyanogenmodに必要なファイルを取得する
#### Dependencies for Cyanogenmod
	cd cyanogenmod/vendor/cm/
	sh get-prebuilts

#### ビルド Build
	cd cyanogenmod
	. build/envsetup.sh
	brunch cm_ponyo-eng 2>&1 | tee make.log

#### 2度目以降のビルドを高速化させる(Optional)
#### Building speed up
	export USE_CCACHE=1
	export CCACHE_DIR=YOURDIR/CCACHE

をビルド前にやっておく Run before build

#### パッチの初期化
#### Revert patch
	repo forall -c git reset --hard
