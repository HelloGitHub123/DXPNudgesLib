//
//  HJAnnouncementManager.h
//  DITOApp
//
//  Created by 李标 on 2022/8/9.
//  弹框

#import <Foundation/Foundation.h>
#import "MonolayerView.h"
#import "NudgesBaseModel.h"
#import "NudgesModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol AnnouncementEventDelegate <NSObject>

/// eg: 按钮点击事件
/// @param jumpType 跳转类型
/// @param url 跳转路由 or 路径
- (void)AnnouncementClickEventByType:(KButtonsUrlJumpType)jumpType Url:(NSString *)url;
/// eg:提交评分
- (void)AnnouncementSubmitByScore:(NSInteger)score;
@end

@interface HJAnnouncementManager : NSObject

@property (nonatomic, assign) id<AnnouncementEventDelegate> delegate;

@property (nonatomic, strong) MonolayerView *monolayerView;

@property (nonatomic, strong) NudgesBaseModel *baseModel;

@property (nonatomic, strong) NudgesModel *nudgesModel;

+ (instancetype)sharedInstance;
@end

NS_ASSUME_NONNULL_END
