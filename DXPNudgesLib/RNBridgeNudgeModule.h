//
//  RNBridgeNudgeModule.h
//  DXPNudge
//
//  Created by 李标 on 2024/8/7.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#if __has_include(<React/RCTRootView.h>)
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>
#endif

NS_ASSUME_NONNULL_BEGIN

#if __has_include(<React/RCTRootView.h>)
@interface RNBridgeNudgeModule : RCTEventEmitter<RCTBridgeModule>

#else

@interface RNBridgeNudgeModule : NSObject

#endif
@end


NS_ASSUME_NONNULL_END
