#import "RCTFBSDKAppLink.h"

#import <React/RCTUtils.h>

@implementation RCTFBSDKAppLink

RCT_EXPORT_MODULE(FBAppLink);

- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}

#pragma mark - React Native Methods

RCT_REMAP_METHOD(fetchDeferredAppLink,
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
   [FBSDKAppLinkUtility fetchDeferredAppLink:^(NSURL *url, NSError *error) {
       if (error) {
        RCTLogInfo(@"FBAppLink Received error while fetching deferred app link %@", error);
          reject(@"error", @"There were an error", error);
      }
      if (url) {
      NSString* appLinkUrl = url;
      [[UIApplication sharedApplication] openURL:url];
      NSString* volumeString = [NSString stringWithFormat:@"%@", appLinkUrl];
      resolve(volumeString);
      }else{
        resolve(url);
      }
    }];
  // [FBSDKAppLinkUtility fetchDeferredAppLink:^(NSURL *url, NSError *error) {
  //   if (error) {
  //     NSLog(@"Received error while fetching deferred app link %@", error);
  //   }

  //   if (url) {
  //     NSString* appLink = [NSString stringWithFormat:@"%@", url];
  //     resolve(appLink);
  //   }else{
  //     resolve(nil);
  //   }
  // }];
}

@end

//  [FBSDKAppLinkUtility fetchDeferredAppLink:^(NSURL *url, NSError *error) {
//        if (error) {
//         RCTLogInfo(@"FBAppLink Received error while fetching deferred app link %@", error);
//           reject(@"error", @"There were an error", error);
//       }
//       if (url) {
//       self->appLinkUrl = url;
//       [[UIApplication sharedApplication] openURL:url];
//       NSString* volumeString = [NSString stringWithFormat:@"%@", self->appLinkUrl];
//       resolve(volumeString);
//       }else{
//         resolve(url);
//       }
//     }];