#import "RCTFBSDKAppLink.h"
#import "React/RCTLog.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>
#import "React/RCTLog.h"

@implementation RCTFBSDKAppLink{
  NSURL *appLinkUrl;
}
// This RCT (React) "macro" exposes the current module to JavaScript
RCT_EXPORT_MODULE(FBAppLink);

RCT_REMAP_METHOD(get,
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
  dispatch_async(dispatch_get_main_queue(), ^{
    [FBSDKAppLinkUtility fetchDeferredAppLink:^(NSURL *url, NSError *error) {
       if (error) {
        RCTLogInfo(@"FBAppLink Received error while fetching deferred app link %@", error);
          reject(@"error", @"There were an error", error);
      }
      if (url) {
        self->appLinkUrl = url;
        [[UIApplication sharedApplication] openURL:url];
        NSString* volumeString = [NSString stringWithFormat:@"%@", self->appLinkUrl];
        resolve(volumeString);
      }else{
        resolve(null);
      }
    }];
  });
}

@end