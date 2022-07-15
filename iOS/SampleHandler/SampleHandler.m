//
//  SampleHandler.m
//  BroadcastUploadExtension
//
//  Created by 758 on 2022/4/22.
//


#import "SampleHandler.h"
#import <YllGameChatSDK/YllGameChatSDK.h>

@interface SampleHandler()<YllGameChatDelegate>


@end

@implementation SampleHandler

- (void)broadcastStartedWithSetupInfo:(NSDictionary<NSString *,NSObject *> *)setupInfo {
    // User has requested to start the broadcast. Setup info from the UI extension can be supplied but optional.
    XXXX表示的是AppGroups的BundleID,请联系我们获取
     [[YllGameChatSDK getInstance] ygc_startBroadcastWithDelegate:self withAppGroups:@"XXXX"];
}

- (void)broadcastPaused {
    // User has requested to pause the broadcast. Samples will stop being delivered.
    [[YllGameChatSDK getInstance] ygc_pausedBroadcast];
}

- (void)broadcastResumed {
    // User has requested to resume the broadcast. Samples delivery will resume.
    [[YllGameChatSDK getInstance] ygc_resumedBroadcast];
}

- (void)broadcastFinished {
    // User has requested to finish the broadcast.
    [[YllGameChatSDK getInstance] ygc_finishedBroadcast];
}

- (void)processSampleBuffer:(CMSampleBufferRef)sampleBuffer withType:(RPSampleBufferType)sampleBufferType {
    [[YllGameChatSDK getInstance] ygc_sendBufferWithBuffer:sampleBuffer bufferType:sampleBufferType];
}

-(void)ygc_broadcastFinishedWithReason:(YGC_REPLAY_REASON)reason error:(NSError *)error{
    [self finishBroadcastWithError:error];
}

@end
