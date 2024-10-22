//
//  HJNPSManager.h
//  DITOApp
//
//  Created by 李标 on 2022/9/11.
//  NPS 单例管理

#import <Foundation/Foundation.h>
#import "NudgesModel.h"
#import "NudgesBaseModel.h"
#import "MonolayerView.h"

NS_ASSUME_NONNULL_BEGIN

@protocol NPSEventDelegate <NSObject>

/// eg:按钮点击事件
/// @param jumpType 跳转类型
/// @param url 跳转路由 or 路径
- (void)NPSClickEventByType:(KButtonsUrlJumpType)jumpType Url:(NSString *)url;
/// eg:提交评分
- (void)NPSSubmitByScore:(NSInteger)score;
@end


@interface HJNPSManager : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, strong) NudgesBaseModel *baseModel;

@property (nonatomic, strong) NudgesModel *nudgesModel;

@property (nonatomic, assign) id<NPSEventDelegate> delegate;

@property (nonatomic, strong) MonolayerView *monolayerView;

/// eg: 移除对应的ToolTips
- (void)removeNudges;

// 删除预览的nudges
- (void)removePreviewNudges;

@end

NS_ASSUME_NONNULL_END
