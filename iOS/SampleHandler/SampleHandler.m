//
//  SampleHandler.m
//  BroadcastUploadExtension
//
//  Created by 758 on 2022/4/22.
//


#import "SampleHandler.h"
#import <YllGameChatSDK/YllGameChatSDK-Swift.h>

@interface SampleHandler()<YllGameChatDelegate>


@end

@implementation SampleHandler

- (void)broadcastStartedWithSetupInfo:(NSDictionary<NSString *,NSObject *> *)setupInfo {
    // User has requested to start the broadcast. Setup info from the UI extension can be supplied but optional.
    [[YllGameChatSDK getInstance] ygc_startBroadcast:self];
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
    [[YllGameChatSDK getInstance] ygc_sendBuffer:sampleBuffer bufferType:sampleBufferType];
}

- (void)ygc_broadcastFinishedWithReason:(YGC_REPLAY_REASON)reason {
    switch (reason) {
        case CONNECT_FAILED:
            [self finishBroadcastWithError:[[NSError alloc] initWithDomain:@"" code:0 userInfo:nil]];
            break;
        case DISCONNECT:
            [self finishBroadcastWithError:[[NSError alloc] initWithDomain:@"" code:0 userInfo:nil]];
            break;
        case INITIATIVE_STOP:
            [self finishBroadcastWithError:[[NSError alloc] initWithDomain:@"" code:0 userInfo:nil]];
            break;
        default:
            break;
    }
}

@end
