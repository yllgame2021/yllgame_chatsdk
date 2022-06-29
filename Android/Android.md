# Android YllGameChatSDK接入文档

- [Android YllGameChatSDK接入文档](#android-yllgamechatsdk接入文档)
  - [SDK结构](#sdk结构)
  - [1.接入流程](#1接入流程)
    - [1.1集成AAR包和三方依赖库](#11集成aar包和三方依赖库)
    - [1.2 添加插件依赖](#12-添加插件依赖)
    - [1.3 指定Gradle版本](#13-指定gradle版本)
    - [1.4 设置项目的libs文件目录](#14-设置项目的libs文件目录)
    - [1.5 引入插件](#15-引入插件)
    - [1.6 编译配置](#16-编译配置)
    - [1.7 混淆配置](#17-混淆配置)
  - [2.接入SDK](#2接入sdk)
    - [申请麦克风权限](#申请麦克风权限)
    - [2.1登陆房间](#21登陆房间)
    - [2.2登出房间](#22登出房间)
    - [2.3加载房间在线用户列表](#23加载房间在线用户列表)
    - [2.4刷新房间在线用户列表](#24刷新房间在线用户列表)
    - [2.5上麦](#25上麦)
    - [2.6邀请上麦](#26邀请上麦)
    - [2.7下麦](#27下麦)
    - [2.8踢下麦](#28踢下麦)
    - [2.9锁麦](#29锁麦)
    - [2.10解锁麦位](#210解锁麦位)
    - [2.11禁言/解除禁言](#211禁言解除禁言)
    - [2.12用户踢出房间](#212用户踢出房间)
    - [2.13更改房间公告](#213更改房间公告)
    - [2.14取消房间管理员](#214取消房间管理员)
    - [2.15升级为管理员](#215升级为管理员)
    - [2.16更新房间名](#216更新房间名)
    - [2.17更新房间图片](#217更新房间图片)
    - [2.18房间等级升级](#218房间等级升级)
    - [2.19房间上麦模式变更](#219房间上麦模式变更)
    - [2.20房间内送礼排行榜](#220房间内送礼排行榜)
    - [2.21封禁/解封用户](#221封禁解封用户)
    - [2.22封禁用户列表](#222封禁用户列表)
    - [2.23 房间管理员列表](#223-房间管理员列表)
    - [2.24跳转房间](#224跳转房间)
    - [2.25设置密码房](#225设置密码房)
    - [2.26解锁密码房](#226解锁密码房)
    - [2.27购买密码房](#227购买密码房)
    - [2.28发送聊天文字消息](#228发送聊天文字消息)
    - [2.29发送表情包](#229发送表情包)
    - [2.30发送钻石礼物](#230发送钻石礼物)
    - [2.31获取房间等级配置](#231获取房间等级配置)
    - [2.32获取房间锁价格](#232获取房间锁价格)
    - [2.33取消或恢复订阅所有远端用户的音频流](#233取消或恢复订阅所有远端用户的音频流)
    - [2.34开启/关闭本地麦克风](#234开启关闭本地麦克风)
    - [2.35取消或恢复订阅指定远端用户的音频流](#235取消或恢复订阅指定远端用户的音频流)
    - [2.36 获取当前聊天室信息](#236-获取当前聊天室信息)
    - [2.37 房间背景音乐](#237-房间背景音乐)
    - [2.37 发送图片消息](#237-发送图片消息)
    - [2.38 开播](#238-开播)
    - [2.39 关播](#239-关播)
    - [2.40 观看直播](#240-观看直播)
    - [2.41 房间麦序切换](#241-房间麦序切换)
  - [3 数据模型](#3-数据模型)
    - [3.1 用户模型](#31-用户模型)
    - [3.2 房间模型](#32-房间模型)
    - [3.3 麦位模型](#33-麦位模型)
    - [3.4 登录模型](#34-登录模型)
    - [3.5 图片消息模型](#35-图片消息模型)
    - [3.6 简单用户模型](#36-简单用户模型)
    - [3.7 文字消息模型](#37-文字消息模型)
    - [3.8 文字消息通知模型](#38-文字消息通知模型)
    - [3.9 表情包消息模型](#39-表情包消息模型)
    - [3.10 图片消息通知模型](#310-图片消息通知模型)
    - [3.11 进出房消息通知模型](#311-进出房消息通知模型)
    - [3.12 上麦通知模型](#312-上麦通知模型)
    - [3.13 通知用户被邀请上麦模型](#313-通知用户被邀请上麦模型)
    - [3.14 通知用户被邀请上麦模型](#314-通知用户被邀请上麦模型)
    - [3.15 通知被踢下麦用户模型](#315-通知被踢下麦用户模型)
    - [3.16 通知锁麦消息模型](#316-通知锁麦消息模型)
    - [3.17 通知禁言/解除禁言模型](#317-通知禁言解除禁言模型)
    - [3.17 通知踢出房间模型](#317-通知踢出房间模型)
    - [3.18 通知取消房间管理员通知模型](#318-通知取消房间管理员通知模型)
    - [3.19 通知升级为管理员通知模型](#319-通知升级为管理员通知模型)
    - [3.20 用户已被封禁通知模型](#320-用户已被封禁通知模型)
    - [3.21 系统广播模型](#321-系统广播模型)
    - [3.22 房间后台禁言通知模型](#322-房间后台禁言通知模型)
    - [3.23 发送钻石礼物通知模型](#323-发送钻石礼物通知模型)
    - [3.24 房间信息变更通知模型](#324-房间信息变更通知模型)
    - [3.25 开启录屏通知模型](#325-开启录屏通知模型)
    - [3.26 关闭录屏通知模型](#326-关闭录屏通知模型)
    - [3.26 发送钻石礼物模型](#326-发送钻石礼物模型)
    - [3.27 房间内送礼排行榜模型](#327-房间内送礼排行榜模型)
    - [3.28 封禁用户列表模型](#328-封禁用户列表模型)
    - [3.29 获取房间管理员列表模型](#329-获取房间管理员列表模型)
    - [3.30 获取房间等级配置模型](#330-获取房间等级配置模型)
    - [3.31 礼物模型列表模型](#331-礼物模型列表模型)
    - [3.32 加载用户列表模型](#332-加载用户列表模型)
    - [3.32 刷新用户列表模型](#332-刷新用户列表模型)
    - [3.33 禁言/解除禁言模型](#333-禁言解除禁言模型)
    - [3.34 封禁/解封用户模型](#334-封禁解封用户模型)
    - [3.35 切换麦序响应模型](#335-切换麦序响应模型)
    - [3.36 改变联盟房房主通知模型](#336-改变联盟房房主通知模型)
    - [3.37 活动模型](#337-活动模型)
    - [3.38 礼物模型](#338-礼物模型)
  - [4. Code表](#4-code表)
  - [5.问题解决](#5问题解决)
    - [5.1 鬼麦问题](#51-鬼麦问题)
## SDK结构
支持平台：Android</br>
系统要求: Android5.0+ </br>
环境要求: Android Studio</br>
支持语言：阿语，英语</br>

## 1.接入流程
### 1.1集成AAR包和三方依赖库
首先把AAR包复制到项目的lib目录下，然后在主项目APP下build.gradle 中的dependencies加入
 ``` Groovy
 //SDK基础库
 implementation 'androidx.appcompat:appcompat:1.2.0'
 //androidx
 implementation 'androidx.core:core-ktx:1.6.0'
 implementation 'androidx.appcompat:appcompat:1.2.0'
 implementation 'androidx.constraintlayout:constraintlayout:2.1.3'
 implementation 'androidx.lifecycle:lifecycle-extensions:2.2.0'
 implementation 'androidx.lifecycle:lifecycle-runtime-ktx:2.3.1'
 implementation "androidx.lifecycle:lifecycle-viewmodel-ktx:2.3.1"
 //material
 implementation 'com.google.android.material:material:1.3.0-alpha03'
 //Protobuf插件
 //Protobuf插件
 implementation 'com.googlecode.protobuf-java-format:protobuf-java-format:1.4'
 implementation 'com.google.protobuf:protobuf-java:3.17.1'
 implementation 'com.google.protobuf:protobuf-java-util:3.17.1'
 //Kotlin基础库
 implementation "org.jetbrains.kotlin:kotlin-stdlib-jdk8:1.4.31"
 implementation 'org.jetbrains.kotlinx:kotlinx-coroutines-android:1.4.1'
 //OkHttp
 implementation 'com.squareup.okhttp3:okhttp:4.9.0'
 implementation 'com.squareup.okhttp3:logging-interceptor:4.9.0'
 //Gson
 implementation 'com.google.code.gson:gson:2.8.9'
 //声网
 implementation 'io.agora.rtc:agora-special-full:3.7.0.204.1'
 implementation 'io.agora.rtc:full-screen-sharing:3.7.0.204.1'
 //Room引入
 implementation 'androidx.room:room-runtime:2.2.5'
 annotationProcessor "androidx.room:room-compiler:2.2.5"
 implementation "androidx.room:room-ktx:2.2.5"
 //zego
 implementation 'com.github.zegolibrary:express-video:2.19.0'
 ```
 ### 1.2 添加插件依赖
 在主工程根目录下的build.gradle内buildScript内添加
 ```
 buildscript {
    repositories {
        google()
        maven { url "https://jitpack.io" }
        mavenCentral()
    }
    dependencies {
        //gradle 插件
        classpath "com.android.tools.build:gradle:4.1.0"
        //kotlin插件
        classpath 'org.jetbrains.kotlin:kotlin-gradle-plugin:1.4.31'
        classpath 'com.google.protobuf:protobuf-gradle-plugin:0.8.18'
        classpath 'io.michaelrocks:paranoid-gradle-plugin:0.3.7'
        // NOTE: Do not place your application dependencies here; they belong
        // in the individual module build.gradle filesbase
    }
}
 ```
### 1.3 指定Gradle版本
在项目根目录的gradle/wrapper的gradle-wrapper.properties中指定gradle版本
```
distributionUrl=https\://services.gradle.org/distributions/gradle-6.9-bin.zip
```
 ### 1.4 设置项目的libs文件目录
 * 在src平级目录创建libs文件夹，将YllGameChatSdk_Game_版本号.aar拷贝进去
 * 在主项目app下的build.gradle 的dependencies内添加
  ```
  implementation fileTree(dir: "libs", include: ["*.jar", "*.aar"])
  ```

 ### 1.5 引入插件
在主项目的app内的build.gradle内引入插件

有两种写法
 
1.5.1 apply plugin

``` Grovvy
apply plugin: 'com.android.application'
apply plugin: 'kotlin-android'
apply plugin: 'io.michaelrocks.paranoid'
```
1.5.2 plugins

``` Groovy
plugins {
    id 'com.android.application'
    id 'kotlin-android'
    id 'io.michaelrocks.paranoid'
}
 ```
 ### 1.6 编译配置
 在主项目build.gradle的android添加配置如下
```Grovvy
android {
    compileSdk 30

    defaultConfig {
        minSdk 21
        targetSdk 30
    }
    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
    }
    kotlinOptions {
        jvmTarget = '1.8'
    }
}

```
 ### 1.7 混淆配置
 ```
 # 在proguard-rules.pro文件添加如下混淆配置
-keep class com.yllgame.** { *; } 
-dontwarn com.yllgame.*
-keep interface com.yllgame.** { *; }
-keep class com.yll.** { *; } 
-dontwarn com.yll.*
-keep interface com.yll.** { *; }
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}
 ```
 ## 2.接入SDK
 ### 申请麦克风权限
 ``` java 
     //权限start
    private final int PERMISSION_REQ_ID = 22;
    private final String[] REQUESTED_PERMISSIONS = {Manifest.permission.RECORD_AUDIO};
    //检查权限
    private boolean checkSelfPermission() {
        if (ContextCompat.checkSelfPermission(this, Manifest.permission.RECORD_AUDIO) != PackageManager.PERMISSION_GRANTED) {
            //没有权限申请权限 有权限直接进房
            ActivityCompat.requestPermissions(this, REQUESTED_PERMISSIONS, PERMISSION_REQ_ID);
            return false;
        } else {
            startLoginRoom();
            return true;
        }
    }
    //activity的权限申请回调函数
    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if (requestCode == PERMISSION_REQ_ID) {
            if (grantResults.length == 1 && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                startLoginRoom();
            } else {
                //上麦 一系列麦克风操作需要权限
                Log.d("权限申请", "用户拒绝授权权限");
            }
        }
    }
 ```
 ### 2.1登陆房间
 ``` kotlin
    /**
     * 登陆房间
     * @param application 当前Application
     * @param webSocketUrl WebSocket服务器地址 String
     * @param configEntity SDK初始化配置ConfigEntity
     * @param ygChatCallback 进房回调YGChatCallback<YGChatRoomLiveInfoEntity>
     * @param callback SDK所有通知回调YGChatNotifyCallback
     */
    fun loginRoom(
        application: Application,
        webSocketUrl: String,
        configEntity: DataManager.ConfigEntity,
        ygChatCallback: YGChatCallback<YGChatRoomLiveInfoEntity>,
        callback: YGChatNotifyCallback
    )
 ```
 - YGChatNotifyCallback：通知
 ``` kotlin
   /**
     * @param statCode Int
     * @see   SocketConnectionStats.Companion.CONNECTING 开始连接
     * @see   SocketConnectionStats.Companion.CONNECTED 连接成功
     * @see   SocketConnectionStats.Companion.DISCONNECTED 停止连接
     * @see   SocketConnectionStats.Companion.WAITINGRECONNECT 重新连接中
     * @see   SocketConnectionStats.Companion.INITIATIVE_DISCONNECTED 主动断开服务器连
     */
    fun onConnectionChange(statCode: Int)
    /**
     *通知用户进出房间
     */
    fun notifyUserLog(userLogEntity: YGChatNotifyRoomUserLogEntity)
    /**
     *通知用户上麦
     */
    fun notifyUserMicUp(micUpEntity: YGChatNotifyRoomMicUpEntity)
    /**
     *通知用户邀请上麦
     */
    fun notifyUserInviteMicUp(inviteUpEntity: YGChatNotifyRoomMicInviteUpEntity)
    /**
     *通知用户下麦
     */
    fun notifyUserMicDown(micDownEntity: YGChatNotifyRoomMicDownEntity)
    /**
     *通知被踢下麦用户 你已被踢下麦
     */
    fun notifyUserKickMic(userMicKickEntity: YGChatNotifyRoomUserMicKickEntity)
    /**
     *通知锁麦消息
     */    
    fun notifyUserMicLocked(micLockedEntity: YGChatNotifyRoomMicLockedEntity)
     /**
     *通知解麦消息
     */   
    fun notifyUserMicUnLocked(micUnLockedEntity: YGChatNotifyRoomMicUnLockedEntity)
    /**
     *通知用户禁言/解除禁言
     */
    fun notifyRoomUserSilence(silenceEntity: YGChatNotifyRoomUserSilenceEntity)
    /**
     *通知用户踢出房间
     */
    fun notifyRoomUserKick(userKickEntity: YGChatNotifyRoomUserKickEntity)
    /**
     *通知取消房间管理员
     */
    fun notifyRoomManagerDown(managerDownEntity: YGChatNotifyRoomManagerDownEntity)
   /**
     *通知升级房间管理员
     */
    fun notifyRoomMemberUp(memberUpEntity: YGChatNotifyRoomMemberUpEntity)
    /**
     *通知用户已被房间封禁
     */
    fun notifyRoomUserBan(userBannedEntity: YGChatNotifyRoomUserBannedEntity)
    /**
     *系统广播
     */
    fun notifySystemBroadcast(systemBroadcastEntity: YGChatNotifySystemBroadcastEntity)
    /**
     *管理后台封禁用户
     */
    fun notifyRoomSystemUserBan(systemUserBanEntity: YGChatNotifySystemUserBanEntity)
    /**
     *通知收到文字消息
     */
    fun notifySayText(messageEntity: YGChatNotifySendMessageEntity)
    /**
     *通知收到表情包
     */
    fun notifySaySticker(messageEntity: YGChatNotifyRoomStickerEntity)
    /**
     *通知收到礼物
     */
    fun sendGift(sendGiftEntity: YGChatNotifySendGiftEntity)
    /**
     *发送图片消息通知
     */
    fun notifySayImage(notifySayImage: YGChatNotifySayImageEntity)
    /**
     *房间信息改变
     */
    fun notifyRoomInfoChange(changeEntity: YGChatNofityRoomInfoChangeEntity)
   
    /**
     * 麦位声波指示器
     * @param audioChatVolumes List<AudioChatVolume>
     * @param totalVolume Int 混音后的总音量，取值范围为 [0,255]。
     * 在本地用户的回调中，totalVolume 为本地发流用户的音量。
     * 在远端用户的回调中，totalVolume 为瞬时音量最高的远端用户（最多 3 位）混音后的总音量。
     */
    fun notifyRoomAudioVolumeIndication(
        audioChatVolumes: List<AudioChatVolume>,
        totalVolume: Int
    )
    
    //开启录屏通知
    fun notifyRoomOpenLive(openLiveUserEntity: YGChatNotifyRoomOpenLiveEntity)

    //关闭录屏通知
    fun notifyRoomCloseLive(closeLiveUserEntity: YGChatNotifyRoomCloseLiveEntity)

   /**
     * agora错误
     * @param errorCode Int
     */
    fun audioError(errorCode: Int)
    
    /**
     * 播放状态
     * @param playerState Int
     * @see MusicPlayerCommand.MUSIC_PLAYER_PLAYING 播放中
     * @see MusicPlayerCommand.MUSIC_PLAYER_PAUSED 暂停
     * @see MusicPlayerCommand.MUSIC_PLAYER_STOP 停止
     * @see MusicPlayerCommand.MUSIC_PLAYER_FAILED 错误
     */
    fun onPlayerState(playerState: Int)

    /**
     * 通知用户切麦成功
     * @param notifyMicChangeEntity YGChatNotifyChangeMicEntity
     */
    fun notifyUserMicChange(notifyMicChangeEntity: YGChatNotifyChangeMicEntity)

   /**
     * 通知改变联盟房房主
     * @param notifyChangeUnionOwner YGChatNotifyChangeUnionOwnerEntity
     */
    fun notifyChangeUnionRoomOwner(notifyChangeUnionOwner: YGChatNotifyChangeUnionOwnerEntity)

    /**
     * 观众是否正在观看直播
     * @param watching Boolean true 观看中 false 结束观看
     */
    fun notifyAudienceWatchingLive(watching: Boolean)

    /**
     * 用户点击通知栏语聊房通知 
     * 需要在这里实现打开语聊房逻辑
     */
    fun notifyOpenChatRoom()

 ```
  - 示例：``` YllGameChatSdk.INSTANCE.loginRoom(); ```
  ### 2.2登出房间
 ``` kotlin
    /**
     * 登出房间
     * @param ygChatCallback YGChatCallback<Unit> 回调 成功返回无返回值 失败返回当前错误码
     */
    fun logoutRoom(ygChatCallback: YGChatCallback<Unit>)
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.logoutRoom(); ```
 ### 2.3加载房间在线用户列表
 ``` kotlin
    /**
     * 加载房间在线用户列表
     * @param userId Long 用户角色id 第一页默认0 分页使用上一页最后一个用户角色id
     * @param priority Long 默认0
     * @param ygChatCallback YGChatCallback<YGChatRoomUserListEntity> 回调 成功返回房间在线用户列表 失败返回当前错误码
     */
    fun loadRoomUserList(
        userId: Long = 0,
        priority: Long,
        ygChatCallback: YGChatCallback<YGChatRoomUserListEntity>
    )
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.loadRoomUserList(); ```
 ### 2.4刷新房间在线用户列表   
 ``` kotlin
    /**
     * 刷新房间在线用户列表
     * @param ygChatCallback YGChatCallback<YGChatRoomUserListEntity> 回调 回调 成功返回房间在线用户列表 失败返回当前错误码
     */
    fun refreshRoomUserList(ygChatCallback: YGChatCallback<YGChatRoomUserListEntity>)
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.refreshRoomUserList(); ```
 ### 2.5上麦
 ``` kotlin
    /**
     * 上麦
     * @param operatorId Long 操作者用户角色Id，0或者用户自己角色Id表示用户自己上麦 被邀请上麦传邀请者角色id
     * @param micOrder Int 麦位
     * @param ygChatCallback YGChatCallback<Int> 回调 成功回调返回麦位 失败返回当前错误码
     */
    fun micUp(
        operatorId: Long = 0, micOrder: Int,
        ygChatCallback: YGChatCallback<Int>
    )
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.micUp(); ```
 ### 2.6邀请上麦
 ``` kotlin
    /**
     * 邀请上麦
     * @param invitee Long 邀请者角色id
     * @param ygChatCallback YGChatCallback<Long>回调 成功返回被邀请者角色id 失败返回当前错误码
     */
    fun inviteMic(
        invitee: Long,
        ygChatCallback: YGChatCallback<Long>
    )
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.inviteMic(); ```
 ### 2.7下麦
 ``` kotlin
    /**
     * 下麦
     * @param ygChatCallback YGChatCallback<Unit> 回调 成功返回无返回值 失败返回当前错误码
     */
    fun micDown(ygChatCallback: YGChatCallback<Unit>)
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.micDown(); ```
 ### 2.8踢下麦
 ``` kotlin
    /**
     * 踢下麦
     * @param userId Long 被踢下麦用户角色id
     * @param micOrder Int 麦位
     * @param ygChatCallback YGChatCallback<Int> 回调 成功返回被提下麦麦位 失败返回当前错误码
     */
    fun kickMic(
        userId: Long, micOrder: Int,
        ygChatCallback: YGChatCallback<Int>
    )
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.kickMic(); ```
 ### 2.9锁麦
 ``` kotlin
    /**
     * 锁麦
     * @param micOrder Int 被锁麦位ID
     * @param ygChatCallback YGChatCallback<Int> 回调 成功返回被锁麦位ID 失败返回当前错误码
     */
    fun micLock(
        micOrder: Int,
        ygChatCallback: YGChatCallback<Int>
    )
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.micLock(); ```
 ### 2.10解锁麦位
 ``` kotlin
    /**
     * 解锁麦位
     * @param micOrder Int 被解锁麦位id
     * @param ygChatCallback YGChatCallback<Int> 回调 成功返回被解锁麦位id 失败返回当前错误码
     */
    fun micUnLock(
        micOrder: Int,
        ygChatCallback: YGChatCallback<Int>
    )
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.micUnLock(); ```
 ### 2.11禁言/解除禁言
 ``` kotlin
    /**
     * 禁言/解除禁言
     * @param userId Long 被操作的用户角色id
     * @param enable Boolean true: 禁言 false：解除禁言
     * @param type Int禁言类型0禁麦，1禁文字消息
     * @param ygChatCallback YGChatCallback<YGChatRoomUserSilenceEntity> 回调 成功返回禁言/解除禁言模型 失败返回当前错误码
     */
    fun roomUserSilence(
        userId: Long,
        enable: Boolean,
        type: Int,
        ygChatCallback: YGChatCallback<YGChatRoomUserSilenceEntity>
    )
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.roomUserSilence(); ```
 ### 2.12用户踢出房间
 ``` kotlin
    /**
     * 用户踢出房间
     * @param userId Long 被踢出用户角色id
     * @param ygChatCallback YGChatCallback<Long> 回调 成功返回被踢出用户角色id 失败返回当前错误码
     */
    fun roomUserKick(
        userId: Long,
        ygChatCallback: YGChatCallback<Long>
    )
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.roomUserKick(); ```
 ### 2.13更改房间公告
 ``` kotlin
    /**
     *更改房间公告
     * @param context String 内容
     * @param ygChatCallback YGChatCallback<String> 回调 成功返回内容 失败返回当前错误码
     */
    fun changeRoomNotice(
        context: String,
        ygChatCallback: YGChatCallback<String>
    )
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.changeRoomNotice(); ```
 ### 2.14取消房间管理员
 ``` kotlin
    /**
     *取消房间管理员
     * @param userId Long 角色id
     * @param ygChatCallback YGChatCallback<Long> 回调 成功返回用户角色id 失败返回当前错误码
     */
    fun roomManagerDown(
        userId: Long,
        ygChatCallback: YGChatCallback<Long>
    )
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.roomManagerDown(); ```
 ### 2.15升级为管理员
 ``` kotlin
    /**
     * 升级为管理员
     * @param userId Long 角色id
     * @param ygChatCallback YGChatCallback<Long> 回调 成功返回用户角色id 失败返回当前错误码
     */
    fun roomMemberUp(
        userId: Long,
        ygChatCallback: YGChatCallback<Long>
    )
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.roomMemberUp(); ```
 ### 2.16更新房间名
 ``` kotlin
    /**
     * 更新房间名
     * @param name String 房间名
     * @param ygChatCallback YGChatCallback<String> 回调 成功返回房间名 失败返回当前错误码
     */
    fun changeRoomName(
        name: String,
        ygChatCallback: YGChatCallback<String>
    )
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.changeRoomName(); ```
 ### 2.17更新房间图片
 ``` kotlin
    /**
     * 更新房间图片
     * @param name String 完整正常访问的图片地址
     * @param ygChatCallback YGChatCallback<String> 回调 成功返回完整正常访问的图片地址 失败返回当前错误码
     */
    fun changeRoomIcon(
        iconUrl: String,
        ygChatCallback: YGChatCallback<String>
    )
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.changeRoomIcon(); ```
 ### 2.18房间等级升级
 ``` kotlin
    /**
     *房间等级升级
     * @param ygChatCallback YGChatCallback<Int> 回调 成功返回等级 失败返回当前错误码
     */
    fun upgradeRoomLevel(ygChatCallback: YGChatCallback<Int>)
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.upgradeRoomLevel(); ```
 ### 2.19房间上麦模式变更
 ``` kotlin
    /**
     *房间上麦模式变更
     * @param type Int 0自由上麦，1邀请上麦
     * @param ygChatCallback YGChatCallback<Int>回调 成功返回模式 失败返回当前错误码
     */
    fun changeRoomMicUpType(type: Int, ygChatCallback: YGChatCallback<Int>)
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.changeRoomMicUpType(); ```
 ### 2.20房间内送礼排行榜
 ``` kotlin
    /**
     * 房间内送礼排行榜
     * @param rankType Int 0 last24hour 1 last7d
     * @param ygChatCallback YGChatCallback<YGChatRoomPropRankEntity>回调 成功返回房间内送礼排行榜模型 失败返回当前错误码
     */
    fun roomPropRank(rankType: Int, ygChatCallback: YGChatCallback<YGChatRoomPropRankEntity>)
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.roomPropRank(); ```
 ### 2.21封禁/解封用户
 ``` kotlin
    /**
     * 封禁/解封用户
     * @param userId Long 角色id
     * @param enable Boolean true 封禁 false解封
     * @param ygChatCallback YGChatCallback<YGChatRoomUserBanEntity> 回调 成功返回封禁/解封用户模型 失败返回当前错误码
     */
    fun roomUserBan(
        userId: Long,
        enable: Boolean,
        ygChatCallback: YGChatCallback<YGChatRoomUserBanEntity>
    )
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.(); ```
 ### 2.22封禁用户列表
 ``` kotlin
    /**
     * 封禁用户列表
     * @param page Int 页数
     * @param ygChatCallback YGChatCallback<YGChatRoomUserBanEntity> 回调 成功返回封禁用户列表模型 失败返回当前错误码
     */
    fun roomUserBanList(page: Int, ygChatCallback: YGChatCallback<YGChatRoomUserBanListEntity>)
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.roomUserBanList(); ```
 ### 2.23 房间管理员列表
 ``` kotlin
    /**
     * 获取房间管理列表
     * @param ygChatCallback YGChatCallback<YGChatRoomManagerListEntity> 回调 成功房间管理列表模型 失败返回当前错误码
     */
    fun roomManagerList(ygChatCallback: YGChatCallback<YGChatRoomManagerListEntity>)
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.roomManagerList(); ```
 ### 2.24跳转房间
 ``` kotlin
    /**
     *跳转房间
     * @param roomId Long 跳转的房间ID
     * @param frontRoomId Long 当前房间ID
     * @param password String 跳转房间密码 没有传""
     * @param ygChatCallback YGChatCallback<YGChatRoomLiveInfoEntity>回调 成功返回房间内信息 失败返回当前错误码
     */
    fun jumpRoom(
        roomId: Long,
        frontRoomId: Long,
        password: String,
        ygChatCallback: YGChatCallback<YGChatRoomLiveInfoEntity>
    )
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.jumpRoom(); ```
 ### 2.25设置密码房
 ``` kotlin
    /**
     * 设置密码房
     * @param pwd String 密码
     * @param ygChatCallback YGChatCallback<Unit> 回调 成功无返回 失败返回当前错误码
     */
    fun setRoomPwd(pwd: String, ygChatCallback: YGChatCallback<Unit>)
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.setRoomPwd(); ```
 ### 2.26解锁密码房
 ``` kotlin
    /**
     * 解锁密码房
     * @param ygChatCallback YGChatCallback<Unit> 回调 成功无返回 失败返回当前错误码
     */
    fun unlockRoomPwd(ygChatCallback: YGChatCallback<Unit>)
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.unlockRoomPwd(); ```
 ### 2.27购买密码房
 ``` kotlin
    /**
     * 购买密码房
     * @param ygChatCallback YGChatCallback<Unit> 回调 成功无返回 失败返回当前错误码
     */
    fun buyRoomPwd(ygChatCallback: YGChatCallback<Unit>)
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.buyRoomPwd(); ```
 ### 2.28发送聊天文字消息
 ``` kotlin
    /**
     * 发送聊天文字消息
     * @param msg String 文字
     * @param atUserList MutableList<YGChatAtUserEntity>? @的人
     * @param ygChatCallback YGChatCallback<YGChatSendMessageEntity> 回调 成功返回消息模型 失败返回当前错误码
     */
    fun sayText(
        msg: String,
        atUserList: MutableList<YGChatAtUserEntity>?,
        ygChatCallback: YGChatCallback<YGChatSendMessageEntity>
    )
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.sayText(); ```
 ### 2.29发送表情包
 ``` kotlin
    /**
     * 发送表情包
     * @param imageUrl String 表情包图片地址
     * @param picWidth Int 宽度
     * @param picHeight Int 高度
     * @param stickerId Long 表情包ID
     * @param ygChatCallback YGChatCallback<YGChatRoomStickerEntity> 回调 成功返回表情包模型 失败返回当前错误码
     */
    fun saySticker(
        imageUrl: String,
        picWidth: Int,
        picHeight: Int,
        stickerId: Long,
        ygChatCallback: YGChatCallback<YGChatRoomStickerEntity>
    )
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.saySticker(); ```
 ### 2.30发送钻石礼物
 ``` kotlin
    /**
     * 发送钻石礼物
     * @param toId 礼物发送对方角色id
     * @param giftId 礼物id
     * @param number 数量
     * @param ygChatCallback YGChatCallback<YGChatRoomStickerEntity> 回调 成功无返回值 失败返回当前错误码
     */
    fun sendDiamondGift(toId: Long, giftId: Long, number: Int, ygChatCallback: YGChatCallback<Unit>)
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.sendDiamondGift(); ```
 ### 2.31获取房间等级配置
 ``` kotlin
    /**
     * 获取房间等级配置
     * @param ygChatCallback YGChatCallback<YGChatRoomLevelEntity> 回调 成功房间管理列表模型 失败返回当前错误码
     */
    fun roomNextLevelConfig(ygChatCallback: YGChatCallback<YGChatRoomLevelEntity>)
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.roomNextLevelConfig(); ```
  ### 2.32获取房间锁价格
 ``` kotlin
    /**
     * 获取房间锁价格
     * @param ygChatCallback YGChatCallback<Int> 回调 成功返回价格 失败返回当前错误码
     */
    fun roomLockPrice(ygChatCallback: YGChatCallback<Int>)
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.roomLockPrice(); ```
 ### 2.33取消或恢复订阅所有远端用户的音频流
  ``` kotlin
    /**
     * 静音全部麦
     * @param audioMuted Boolean true 静音 false 非静音
     * @return Int 0返回调用成功 <0调用失败了
     */
    fun muteAllRemoteAudio(audioMuted: Boolean)
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.muteAllRemoteAudio(); ```
  ### 2.34开启/关闭本地麦克风
 ``` kotlin
    /**
     *开启/关闭本地麦克风
     * @param micMuted Boolean true 不采集麦克风 false 采集麦克风
     * @return Int 0返回调用成功 <0调用失败了
     */
    fun muteLocalMic(micMuted: Boolean)
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.muteLocalMic(); ```
 
 ### 2.35取消或恢复订阅指定远端用户的音频流
 ``` kotlin
    /**
     * 静音某个麦
     * @param uid Long
     * @param audioMuted Boolean true 静音 false 非静音
     * @return Int 0返回调用成功 <0调用失败了
     */
    fun muteRemoteAudio(uid: Long, audioMuted: Boolean)
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.muteRemoteAudio(); ```
  ### 2.36 获取当前聊天室信息
  ``` kotlin
   /**
     * 获取当前聊天室信息
     * @return YGChatRoomInfoEntity?
     */
   fun getCurrentChatRoomInfo(): YGChatRoomInfoEntity?
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.getCurrentChatRoomInfo(); ```
  ### 2.37 房间背景音乐
  ``` kotlin
   /**
     * 房间背景音乐
     * @param context Context
     */
    fun showMusicPlayerDialog(context: Context)
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.showMusicPlayerDialog(); ```
  ### 2.37 发送图片消息
  ``` kotlin
   /**
     * 发送图片消息
     * @param imageUrl String 图片Url
     * @param ygChatCallback YGChatCallback<YGChatSendImageEntity> 图片消息回调
     */
    fun sayImage(imageUrl: String, ygChatCallback: YGChatCallback<YGChatSendImageEntity>) 
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.sayImage(); ```
### 2.38 开播
  ``` kotlin
    /**
     * 开启录屏
     * @param ygChatCallback YGChatCallback<Boolean>
     */
    fun roomOpenLive(ygChatCallback: YGChatCallback<Unit>)
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.roomOpenLive(); ```
### 2.39 关播
  ``` kotlin
    /**
     * 关闭录屏
     * @param ygChatCallback YGChatCallback<Boolean>
     */
    fun roomCloseLive(ygChatCallback: YGChatCallback<Unit>)
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.roomCloseLive(); ```
### 2.40 观看直播
  ``` kotlin
    /**
     * 观看直播
     * @return Int
     */
    fun roomPlayLive(activity: Activity): Int
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.roomPlayLive(); ```

### 2.41 房间麦序切换
```kotlin
/**
  * 房间麦序切换
  * @param oldMicOrder Int 旧麦位
  * @param newMicOrder Int 新麦位
  * @param ygChatCallback YGChatCallback<YGChatChangeMicEntity> 回调
  */
fun changeMic(oldMicOrder: Int, newMicOrder: Int,
        ygChatCallback: YGChatCallback<YGChatChangeMicEntity>
)
```
## 3 数据模型
### 3.1 用户模型
```Kotlin
//用户模型
data class YGChatUserInfoEntity(
    var userId: Long,// 角色ID
    var name: String,  // 用户昵称
    var sex: Int,   // 用户性别
    var level: Int, // 用户等级
    var headPhoto: String,// 用户头像
    var userRole: Int, // 用户房间角色  0： 访客（散客普通用户）  1：房主   2： 管理员   3： 成员   4: 系统游客（未注册平台用户
    var hasMic: Int,// 用户在麦标识 0: 不在麦 >0: 在麦，具体值表示在哪个麦上
    var silenced: Boolean, // 用户房管理禁麦
    var priority: Long, // 用户房间排名权值
    var sysRole: Int, // 平台角色  0：平常用户 1：官方用户
    var manageRole: Int,// 0：非管理用户 1：超管 2：巡管
    var vipLevel: Int,// vip等级
    var silencedChat: Boolean,// 用户是否被禁聊天
    var serverId: Long,//服务器id
    var serverName: String,//区服名
    var fight: Double,  // 战力值
    var region: Int,  //  用户语区 英语1 阿语2
    var chatBubble: Int,  //聊天气泡
    var headStyle: Int,  //头像框地址
    var isLivePermission: Boolean,  //是否有分享直播录屏权限
)
```
### 3.2 房间模型
```Kotlin
data class YGChatRoomInfoEntity(
    var roomId: Long,// 房间id 与房主id相同
    var prettyId: Long,  // 房间靓号id
    var name: String,   // 房间名字
    var level: Int, // 房间等级
    var image: String,// 房间图片
    var micType: Int, //房间麦类型 0 语音麦
    var region: Int,// 房间语区
    var notice: String, // 房间公告
    var background: String, // 房间背景
    var audio: Int, // 房间音频类型     0： agero  1： zego
    var roomType: Int,// 房间类型 100:官方房  1:个人房   2:联盟房',
    var channelKey: String,// 房间音频key
    var micOnType: Int,// 房间上麦类型
    var countryCode: String,//国家code
    var isPwdRoom: Int,//是否设置密码
    /**
     * 房间是否拥有设置密码权限
     * 0 无权限
     * 1 有权限
     */
    var canSetPwd: Int, 
    var areaId: Long,  // 区服id
    var groupId: Long,  // 区服group_id
    var activity: List<YGActivityBannerEntity>,//活动列表
    var screenType: Int,//屏幕类型 1：横屏 2：竖屏
    var YGFRate: String,//帧率
    var YGDResolution: String,// 分辨率
)
```
### 3.3 麦位模型
```Kotlin
data class YGChatUserMicInfoEntity(
    var userId: Long,// 角色ID
    var name: String,  // 用户昵称
    var sex: Int,   // 用户性别
    var level: Int, // 用户等级
    var vipLevel: Int, // 用户等级
    var headPhoto: String,// 用户头像
    var headStyle: Int, // 头像框地址
    var userRole: Int,// 用户房间角色  0： 访客（散客普通用户）  1：房主   2： 管理员
    var micOrder: Int,//麦序 从0开始编号
    var micVideo: Boolean,//是否为视频麦
    var micForbidden: Boolean,//麦是否被禁用
    var silenced: Boolean,// 是否被禁言
    var sysRole: Int,// 平台角色  0：平常用户 1：官方用户
    var serverId: Int,// 服务器id
    var serverName: String,// 区服名
    var fight: Double,// 战力值
    var manageRole: Int,// 0：非管理用户 1：超管 2：巡管
    var hasLive: Boolean,// 是否已开启录屏分享直播
)
```
### 3.4 登录模型
```Kotlin
data class YGChatRoomLiveInfoEntity(
    var user: YGChatUserInfoEntity,// 用户信息
    var room: YGChatRoomInfoEntity,// 房间信息
    var micList: List<YGChatUserMicInfoEntity>,// 在麦的麦序列表
    var micLockedList: List<Int>,// 被锁住的麦序列表
    var coin: Long,//金币
    var diamond: Long,//钻石
    var singleNum: Long,
)
```
### 3.5 图片消息模型
```Kotlin
data class YGChatSendImageEntity(
    /**
     * 图片url
     */
    var imageUrl: String
)
```
### 3.6 简单用户模型
```Kotlin
data class YGChatAtUserEntity(
    var userId: Long,//用户Id
    var name: String,  //用户昵称
)
```
### 3.7 文字消息模型
```Kotlin
data class YGChatSendMessageEntity(
    var text: String,// 消息内容
    var chatBubble: Int,//聊天气泡
    var atUser: MutableList<YGChatAtUserEntity>,// @用户信息
)
```
### 3.8 文字消息通知模型
```Kotlin
data class YGChatNotifySendMessageEntity(
    var text: String,// 消息内容
    var user: YGChatUserInfoTinyEntity,// 发送者用户信息
    var chatBubble: Int,//聊天气泡
    var atUser: MutableList<YGChatAtUserEntity>,// @用户信息
)
```
### 3.9 表情包消息模型
```Kotlin
data class YGChatRoomStickerEntity(
    var imageUrl: String,//表情地址
    var picWidth: Int,//宽
    var picHeight: Int,//高
    var stickerId: Long,//表情包Id
)
```
### 3.10 图片消息通知模型
```Kotlin
data class YGChatNotifySayImageEntity(
    //图片地址
    var imageUrl: String,
    //发送图片的用户
    var user: YGChatUserInfoTinyEntity,
    //通知的用户列表
    var atUser: List<YGChatUserInfoTinyEntity>
)
```
### 3.11 进出房消息通知模型
```Kotlin
data class YGChatNotifyRoomUserLogEntity(
    var kind: Int,// 类型 0：进房间 1：离开房间
    var user: YGChatUserInfoEntity,//用户信息
    var online: Int,//房间在线人数
)
```
### 3.12 上麦通知模型
```Kotlin
data class YGChatNotifyRoomMicUpEntity(
    //上麦的用户信息
    var micUser: YGChatUserMicInfoEntity
)
```
### 3.13 通知用户被邀请上麦模型
```Kotlin
data class YGChatNotifyRoomMicInviteUpEntity(
    var user: YGChatUserInfoTinyEntity,// 邀请者的用户信息
)
```
### 3.14 通知用户被邀请上麦模型
```Kotlin
data class YGChatNotifyRoomMicDownEntity(
    var reason: Int,//0:用户正常下麦 1：用户被踢下麦
    var micOrder: Int,//麦位
    var user: YGChatUserInfoTinyEntity,// 下麦者的用户信息
)
```
### 3.15 通知被踢下麦用户模型
```Kotlin
data class YGChatNotifyRoomUserMicKickEntity(
    var user: YGChatUserInfoTinyEntity,//操作者的用户信息
)
```
### 3.16 通知锁麦消息模型
```Kotlin
data class YGChatNotifyRoomMicLockedEntity(
    var micOrder: Int,//麦位
)
```
### 3.17 通知禁言/解除禁言模型
```Kotlin
data class YGChatNotifyRoomUserSilenceEntity(
    var user: YGChatUserInfoTinyEntity,//被封禁的用户
    var opUser: YGChatUserInfoTinyEntity,// 操作用户
    var enable: Boolean,//true: 禁言 false：解除禁言
    var type: Int,// 禁言类型0禁麦，1禁文字消息
)
```
### 3.17 通知踢出房间模型
```Kotlin
data class YGChatNotifyRoomUserKickEntity(
    var user: YGChatUserInfoTinyEntity,//被封禁的用户
    var opUser: YGChatUserInfoTinyEntity,// 操作用户
)
```
### 3.18 通知取消房间管理员通知模型
```Kotlin
data class YGChatNotifyRoomManagerDownEntity(
    //被取消管理员的用户Id
    var userId: Long,
)
```
### 3.19 通知升级为管理员通知模型
```Kotlin
data class YGChatNotifyRoomMemberUpEntity(
    //被升级为管理员的用户Id
    var user: YGChatUserInfoTinyEntity,
)
```
### 3.20 用户已被封禁通知模型
```Kotlin
data class YGChatNotifyRoomUserBannedEntity(
    var user: YGChatUserInfoTinyEntity,//被封禁的用户
    var opUser: YGChatUserInfoTinyEntity,// 操作用户
)
```
### 3.21 系统广播模型
```Kotlin
data class YGChatNotifySystemBroadcastEntity(
    var sysType: Int,// 广播类型 0:系统广播
    var lang: Int,// 语言内容版本 1: 英语 2:阿语 3:印地语 4: 乌尔都语
    var content: String,// 对应语言版本内容
)
```
### 3.22 房间后台禁言通知模型
```Kotlin
data class YGChatNotifySystemUserBanEntity(
    var expireAt: Long,// 禁言到期时间
    var reason: String,// 禁言原因
)
```
### 3.23 发送钻石礼物通知模型
```Kotlin
data class YGChatNotifySendGiftEntity(
    var gift: YGChatGiftViewEntity,// 礼物模型
    var room: YGChatRoomInfoEntity,  // 房间模型
    var user: YGChatUserInfoTinyEntity,   // 发送者用户信息
    var toUser: YGChatUserInfoTinyEntity, // 接受者用户信息
    var hornType: Int,// 触发喇叭类型
) {
    companion object {
        const val GIFT_HORN_NONE = 0;  //普通小礼物
        const val GIFT_HORN_REGION = 1;    //普通大礼物
        const val GIFT_HORN_ALL = 2;    //全站礼物
    }
}
```
### 3.24 房间信息变更通知模型
```Kotlin
data class YGChatNotifyRoomInfoChangeEntity(
    var type: List<Int>,// 变更类型
    var roomId: Long,  // 房间靓号id
    var image: String,   // 房间图片
    var name: String, // 房间名字
    var notice: String,// 房间公告
    var region: Int, //房间语区
    var canSetPwd: Int,// 是否可设置密码
    var isPwdRoom: Int, // 是否上锁
    var level: Int, // 房间等级
    var micUpType: Int, // 房间上麦模式变更 0自由 1 邀请
) {
    companion object {
        const val INFO_IMAGE = 0; //房间图片
        const val INFO_NAME = 1;  //房间名字
        const val INFO_NOTICE = 2; //房间公告
        const val INFO_REGION = 3; //房间语区
        const val INFO_LEVEL = 4; //房间等级
        const val INFO_CAN_SET_PWD = 5; //房间密码
        const val INFO_IS_PWD = 6;// 房间上锁解锁
        const val INFO_MIC_UP_TYPE = 7; //房间上麦模式变更
    }
}
```
### 3.25 开启录屏通知模型
```Kotlin
data class YGChatNotifyRoomOpenLiveEntity(
    //直播用户信息
    var liveUser: YGChatUserMicInfoEntity,
)
```
### 3.26 关闭录屏通知模型
```Kotlin
data class YGChatNotifyRoomCloseLiveEntity(
    //直播用户信息
    var liveUser: YGChatUserMicInfoEntity,
)
```
### 3.26 发送钻石礼物模型
```Kotlin
data class YGChatRoomSendGiftEntity(
    //接受者Id
    var toId: Long,
    //礼物Id
    var giftId: Long,
    //礼物数量
    var number: Int,
)
```
### 3.27 房间内送礼排行榜模型
```Kotlin
data class YGChatRoomPropRankEntity(
    var rankType: Int,// 0 last24hour 1 last7d
    var totalAmount: Long,//送礼总金额
    var myAmount: Long,//我的送礼总金额
    var isInRank: Boolean,//是否在榜
    var rankList: List<YGChatUserRankEntity>,  //排行榜
)
```
### 3.28 封禁用户列表模型
```Kotlin
data class YGChatRoomUserBanListEntity(
    //封禁用户列表
    var list: List<YGChatUserInfoEntity>,
)
```
### 3.29 获取房间管理员列表模型
```Kotlin
data class YGChatRoomManagerListEntity(
    //房间管理员列表
    var list: List<YGChatUserInfoEntity>,
)
```
### 3.30 获取房间等级配置模型
```Kotlin
data class YGChatRoomLevelEntity(
    var current: YGChatRoomLevelConfigEntity,// 等级
    var next: YGChatRoomLevelConfigEntity,//花费经额
    var isTopLevel: Boolean,//最大管理人数
)
```
### 3.31 礼物模型列表模型
```Kotlin
data class YGChatRoomGiftListEntity(
    //礼物列表
    var list: List<YGChatGiftViewEntity>
)
```
### 3.32 加载用户列表模型
```Kotlin
data class YGChatRoomUserListEntity(
    //用户列表
    var users: List<YGChatUserInfoEntity>,
    //在线的总人数
    var online: Int,
    //搜索关键字
    var keyword: String,
)
```
### 3.32 刷新用户列表模型
```Kotlin
data class YGChatRoomUserListEntity(
    //用户列表
    var users: List<YGChatUserInfoEntity>,
    //在线的总人数
    var online: Int,
    //搜索关键字
    var keyword: String,
)
```
### 3.33 禁言/解除禁言模型
```Kotlin
data class YGChatRoomUserSilenceEntity(
    var userId: Long,//被操作的用户id
    var enable: Boolean,  //true: 禁言 false：解除禁言
    var type: Int,  //禁言类型0禁麦，1禁文字消息
)
```
### 3.34 封禁/解封用户模型
```Kotlin
data class YGChatRoomUserBanEntity(
    var targetUserId: Long,//用户
    var enable: Boolean,//true 封禁 false解封
)
```
### 3.35 切换麦序响应模型
```Kotlin
data class YGChatChangeMicEntity(
    val oldMicOrder: Int,//旧麦序
    val newMicOrder: Int//新麦序
)
```
### 3.36 改变联盟房房主通知模型
```Kotlin
/**
 * 改变联盟房房主通知实体
 * @property roomId Int 房间ID
 * @property oldOwnerId Int 旧房主Id
 * @property newOwnerId Int 新房主Id
 * @constructor
 */
data class YGChatNotifyChangeUnionOwnerEntity(
    val roomId: Int,
    val oldOwnerId: Int,
    val newOwnerId: Int
)
```
### 3.37 活动模型
```Kotlin
data class YGActivityBannerEntity(
    val id: Int,  //活动Id
    val name: String, //英文名
    val icon: String, //活动图标
    val url: String, //活动跳转链接 例：https://www.yalla.com?token=xxxxx
    val goType: Int //// 跳转类型：0:h5,1:房间,2:游戏模块
)
```
### 3.38 礼物模型
```Kotlin
data class YGChatGiftViewEntity(
    var giftId: Long,// 礼物id
    var name: String,  // 礼物名字
    var image: String,   // 礼物图标
    var price: Int, // 礼物价格
    var fType: Int,// 礼物类型  0： 普通小礼物  1: 普通大礼物 2： 全站礼物
    var num: Int, // 礼物数量
    var giftType: Int,//0 默认 10 幸运礼物 20周星礼物
) {
    companion object {
        const val GIFT_NORMAL_SMALL = 0;  //普通小礼物
        const val GIFT_NORMAL_BIG = 1;    //普通大礼物
        const val GIFT_NORMAL_ALL = 2;    //全站礼物
    }
}
```
## 4. Code表
```Kotlin
CODE_SUCCESS = 1000 // 操作成功码
CODE_FAIL = 1001 // 操作失败码
CODE_NOT_IMPL = 1002 // 协议未实现
CODE_PROTO_REG_FAIL = 1003 // 协议类型注册出错
CODE_CMD_ERR_FAIL = 1004 //协议命令出错
CODE_MSG_FILTER = 1049 // 输入的信息包含敏感词汇
CODE_PARAM_ERROR_FAIL = 1102 // 未知错误 解析参数不符逻辑错误
CODE_HUB_ERR_FAIL = 1103 // 未知错误 内部服务出错  hub 服务返回错误
CODE_ROOM_ERR_FAIL = 1104 // 未知错误 内部服务出错  room  服务返回错误
CODE_TRADE_ERR_FAIL = 1105 // 未知错误 内部服务出错  trade  交易服务返回错误
CODE_HA_NOT_FOUND = 1106 //accessha 服务未找到
CODE_HA_ERR_FAIL = 1107 //未知错误 内部服务出错  ha  服务返回错误
CODE_PROTO_ERR_FAIL = 1108 // 未知错误 Proto  序列化和反序列化解析错误
CODE_DAO_ERR_FAIL = 1109 // 未知错误 数据库交互出错
CODE_REDIS_ERR_FAIL = 1110 // 未知错误 redis交互出错
CODE_CHANNEL_INVALID = 1111 // 无效会话流 （channel 会话流失效）
CODE_USER_NOT_FOUND = 1112 // 用户未找到
CODE_BAR_NOT_FOUND = 1113 // 房间未找到
CODE_USER_NOT_INROOM = 1114 // 被操作用户已离开房间
CODE_MIC_LOCK_LIMIT = 1015 // 超过最大锁定上限
CODE_MIC_OLNY_INVITED = 1016 // 房间设置为只能邀请上麦
CODE_MIC_INVITED = 1017 // 邀请上麦失效
CODE_MIC_LOCKED = 1018 // 麦被锁
CODE_MIC_ALREADY_LOCKED = 1019 // 请勿重复加锁
CODE_MIC_INVALID_ORDER = 1120 // 无效麦序
CODE_MIC_HOLDED = 1121 // 麦被占用
CODE_MIC_OVER = 1122 // 麦已用完
CODE_MIC_HASED = 1123 // 已在麦
CODE_NO_RIGHTS = 1125 // 没有权限
CODE_MIC_ALREADYOFF = 1127 // 用户已下麦
CODE_ROOM_MEM_NOT_EXIT = 1030 // 被邀请者不存在
CODE_ROOM_MEN_SILENCED = 1031 //被邀请者已被房管理禁言
CODE_ROOM_MEM_SYS_BAN = 1032 //被邀请者已被系统禁言
CODE_ROOM_MAXED = 1133 // 房间在线人数超出限制上限
CODE_ROOM_PWD_WRONG = 1134
CODE_SETROOMPWD_NOT_LOCKROOM = 1036 // 该房间不是密码房，无法锁房
CODE_TOURIST_NO_RIGHTS = 1139 // 游客模式没有操作权限
CODE_LOGIN_USER_BANNED = 1140 // 登录用户账号被封号
CODE_KICKED = 1141 // 被房管理踢出
CODE_SILENCED = 1142 // 被房管理禁言
CODE_BANNED = 1143 // 被房管理踢出
CODE_GIFT_NOT_FOUND = 1145 // 礼物未找到
CODE_SAY_MSG_TO_LANG = 1146 // 发送文字过长
CODE_KeyWords_ERROR = 1147 // 存在敏感词
CODE_JUMP_SELF_ERROR = 1150 //不允许跳转到自己房间
CODE_PARAM_ERROR = 1151 // 参数错误
CODE_AUDIO_KEY_GENERATE = 1152 // 频道Key生成出错
CODE_HA_INCONSISTENT = 1158 // ha服务中用户不存在，reload操作
CODE_HA_UPDATE_NO_CHANGE = 1159 // 信息无更更析
CODE_PKG_PASS = 1300 //该消息包忽略
CODE_ROOM_LIVE_HASLIVE = 1207 // 录屏直播已存在
CODE_ROOM_LIVE_ISEXIT = 1208 // 已下播
CODE_ROOM_CHAT_LOW_GRADE = 1209 // vip等级低
CODE_SOCKET_AUTH_THRIDID_VERIFYFAIL = 310 // 第三方GameID验证失败
CODE_TRADE_LACCOUNT_NOT_ONLINE = 1202 // 结算用户不在线
CODE_TRADE_COIN_LESS = 1206 // 余额不足
CODE_TRADE_ERR_GIFT_SELF = 1203 //不能给自己送礼
CODE_FREQUERCY = 1005 // 操作太频繁
```
## 5.问题解决
### 5.1 鬼麦问题
* 如果出现某用户不在麦位上，但是又能听到声音的异常情况，需要在notifyRoomAudioVolumeIndication内监听判断如果某用户有音浪但是不在麦位上就通过muteRemoteAudio将其静音。
* 如果该用后在后续正常上麦，就取消对其的静音操作。