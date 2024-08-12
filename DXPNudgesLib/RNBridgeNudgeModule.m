//
//  RNBridgeNudgeModule.m
//  DXPNudge
//
//  Created by 李标 on 2024/8/7.
//

#import "RNBridgeNudgeModule.h"
#import "HJNudgesManager.h"

@interface RNBridgeNudgeModule ()

@end


@implementation RNBridgeNudgeModule

#if __has_include(<React/RCTRootView.h>)

/* React Native 和  原生 之间的导出桥接模块 */
RCT_EXPORT_MODULE(RNBridgeNudgeModule);

// 告诉nudges当前RN页面的名称，用于数据库筛选当前页面的nudge
RCT_EXPORT_METHOD(setCurrentPageName:(NSString *)pageName) {
  dispatch_async(dispatch_get_main_queue(), ^{
    [HJNudgesManager sharedInstance].currentPageName = pageName;
    // 开始启动，获取nudges 配置数据列表
    [[HJNudgesManager sharedInstance] start];
  });
}

#endif

@end
