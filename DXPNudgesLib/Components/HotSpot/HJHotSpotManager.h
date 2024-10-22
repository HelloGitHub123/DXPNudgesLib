//
//  HJHotSpotManager.h
//  DITOApp
//
//  Created by 李标 on 2022/8/9.
//  Beacon

#import <Foundation/Foundation.h>
#import "MonolayerView.h"
#import "NudgesBaseModel.h"
#import "NudgesModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol HotSpotEventDelegate <NSObject>

/// eg: 按钮点击事件
/// @param jumpType 跳转类型
/// @param url 跳转路由 or 路径
- (void)HotSpotClickEventByType:(KButtonsUrlJumpType)jumpType Url:(NSString *)url;
@end


@interface HJHotSpotManager : NSObject

@property (nonatomic, assign) id<HotSpotEventDelegate> delegate;

@property (nonatomic, strong) MonolayerView *monolayerView;

@property (nonatomic, strong) NudgesBaseModel *baseModel;

@property (nonatomic, strong) NudgesModel *nudgesModel;

+ (instancetype)sharedInstance;

// 删除预览的nudges
- (void)removePreviewNudges;

@end

NS_ASSUME_NONNULL_END
