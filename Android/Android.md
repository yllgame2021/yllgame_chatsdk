# Android YllGameChatSDK接入文档

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
 implementation(name: 'YllGameChat_lib_1.0.0', ext: 'aar')
 implementation 'androidx.appcompat:appcompat:1.2.0'
 //androidx
 implementation 'androidx.core:core-ktx:1.6.0'
 implementation 'androidx.appcompat:appcompat:1.2.0'
 implementation 'androidx.constraintlayout:constraintlayout:2.0.4'
 implementation 'androidx.lifecycle:lifecycle-extensions:2.2.0'
 implementation 'androidx.lifecycle:lifecycle-runtime-ktx:2.3.1'
 implementation "androidx.lifecycle:lifecycle-viewmodel-ktx:2.3.1"
 implementation 'androidx.lifecycle:lifecycle-livedata-ktx:2.3.1'
 //material
 implementation 'com.google.android.material:material:1.3.0-alpha03'
 //Protobuf插件
 //Protobuf插件
 implementation 'com.googlecode.protobuf-java-format:protobuf-java-format:1.4'
 implementation 'com.google.protobuf:protobuf-java:3.17.1'
 implementation 'com.google.protobuf:protobuf-java-util:3.17.1'
 //Java注解库
 implementation "javax.annotation:javax.annotation-api:1.2"
 //Kotlin基础库
 implementation "org.jetbrains.kotlin:kotlin-stdlib-jdk8:1.4.31"
 implementation 'org.jetbrains.kotlinx:kotlinx-coroutines-android:1.4.1'
 //OkHttp
 implementation 'com.squareup.okhttp3:okhttp:4.9.0'
 implementation 'com.squareup.okhttp3:logging-interceptor:4.9.0'
 //Gson
 implementation 'com.google.code.gson:gson:2.8.9'
 //声网
 implementation 'io.agora.rtc:full-sdk:3.7.0'
 implementation 'io.agora.rtc:full-screen-sharing:3.7.0'
 //Room引入
 implementation 'androidx.room:room-runtime:2.2.5'
 annotationProcessor "androidx.room:room-compiler:2.2.5"
 implementation "androidx.room:room-ktx:2.2.5"
 //liveDataBus
 implementation 'com.jeremyliao:live-event-bus-x:1.6.0'
 ```
 
 ### 1.2设置项目的libs文件目录
 在主项目APP下build.gradle 中的android加入
  ``` Groovy
 repositories {
        flatDir {
            dirs 'libs'
        }
    }
 ```
 ### 1.3设置项目的插件
 在主项目APP下build.gradle 中的plugins加入
  ``` Groovy
plugins {
    id 'kotlin-android'
    id 'com.google.protobuf'
    id 'io.michaelrocks.paranoid'
    id 'kotlin-android-extensions'
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
 ### 2.1初始化、进房
 ``` kotlin
    /**
     * 初始化项目、进房
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
 fun onConnectionChange(statCode: Int)
 //        const val CONNECTING = 1
        const val CONNECTED = 2
        const val DISCONNECTED = -1
        const val WAITINGRECONNECT = -2
    //发送图片消息通知
    fun notifySayImage(notifySayImage: YGChatNotifySayImageEntity)
    //通知用户进出房间
    fun notifyUserLog(userLogEntity: YGChatNotifyRoomUserLogEntity)
    //通知用户上麦
    fun notifyUserMicUp(micUpEntity: YGChatNotifyRoomMicUpEntity)
    //通知用户邀请上麦
    fun notifyUserInviteMicUp(inviteUpEntity: YGChatNotifyRoomMicInviteUpEntity)
    //通知用户下麦
    fun notifyUserMicDown(micDownEntity: YGChatNotifyRoomMicDownEntity)
    //通知用户被提下麦
    fun notifyUserKickMic(userMicKickEntity: YGChatNotifyRoomUserMicKickEntity)
    //通知用户锁麦
    fun notifyUserMicLocked(micLockedEntity: YGChatNotifyRoomMicLockedEntity)
    //通知用户解锁麦
    fun notifyUserMicUnLocked(micUnLockedEntity: YGChatNotifyRoomMicUnLockedEntity)
    //通知用户禁言/解除禁言
    fun notifyRoomUserSilence(silenceEntity: YGChatNotifyRoomUserSilenceEntity)
    //通知用户踢出房间
    fun notifyRoomUserKick(userKickEntity: YGChatNotifyRoomUserKickEntity)
    //通知取消房间管理员
    fun notifyRoomManagerDown(managerDownEntity: YGChatNotifyRoomManagerDownEntity)
    //通知升级房间管理员
    fun notifyRoomMemberUp(memberUpEntity: YGChatNotifyRoomMemberUpEntity)
    //房间封禁
    fun notifyRoomUserBan(userBannedEntity: YGChatNotifyRoomUserBannedEntity)
    //房间广播
    fun notifySystemBroadcast(systemBroadcastEntity: YGChatNotifySystemBroadcastEntity)
    //管理后台封禁用户
    fun notifyRoomSystemUserBan(systemUserBanEntity: YGChatNotifySystemUserBanEntity)
    //通知收到文字消息
    fun notifySayText(messageEntity: YGChatNotifySendMessageEntity)
    //通知收到表情包
    fun notifySaySticker(messageEntity: YGChatNotifyRoomStickerEntity)
    //通知收到礼物
    fun sendGift(sendGiftEntity: YGChatNotifySendGiftEntity)
    //房间信息改变
    fun notifyRoomInfoChange(changeEntity: YGChatNofityRoomInfoChangeEntity)
    //麦位声波指示器
    fun notifyRoomAudioVolumeIndication(
        audioChatVolumes: List<AudioChatVolume>,
        totalVolume: Int
    )
     /**
     * 播放状态
     * @param playerState PlayerState
     * @see MusicPlayerCommand.PlayerState.STATE_PLAYING 播放中
     * @see MusicPlayerCommand.PlayerState.STATE_PAUSED 暂停
     * @see MusicPlayerCommand.PlayerState.STATE_STOPPED 停止
     * @see MusicPlayerCommand.PlayerState.STATE_ERROR 错误
     */
    fun onPlayerState(playerState: MusicPlayerCommand.PlayerState)
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
 ### 2.23获取房间管理列表
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
  ### 2.31获取房间锁价格
 ``` kotlin
    /**
     * 获取房间锁价格
     * @param ygChatCallback YGChatCallback<Int> 回调 成功返回价格 失败返回当前错误码
     */
    fun roomLockPrice(ygChatCallback: YGChatCallback<Int>)
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.roomLockPrice(); ```
  ### 2.32获取房间等级配置
 ``` kotlin
    /**
     * 获取房间等级配置
     * @param ygChatCallback YGChatCallback<YGChatRoomLevelEntity> 回调 成功房间管理列表模型 失败返回当前错误码
     */
    fun roomNextLevelConfig(ygChatCallback: YGChatCallback<YGChatRoomLevelEntity>)
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.roomNextLevelConfig(); ```
  ### 2.33自己麦克风禁麦
 ``` kotlin
    /**
     *自己麦克风禁麦
     * @param micMuted Boolean true 不采集麦克风 false 采集麦克风
     * @return Int 0返回调用成功 <0调用失败了
     */
    fun muteLocalMic(micMuted: Boolean)
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.muteLocalMic(); ```
 ### 2.34静音某个麦
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
 ### 2.35静音全部麦
  ``` kotlin
    /**
     * 静音全部麦
     * @param audioMuted Boolean true 静音 false 非静音
     * @return Int 0返回调用成功 <0调用失败了
     */
    fun muteAllRemoteAudio(audioMuted: Boolean)
 ```
 - 示例：``` YllGameChatSdk.INSTANCE.muteAllRemoteAudio(); ```
  ### 2.36 房间背景音乐
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
