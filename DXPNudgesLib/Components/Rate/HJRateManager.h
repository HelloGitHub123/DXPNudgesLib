//
//  HJRateManager.h
//  DITOApp
//
//  Created by 李标 on 2022/9/12.
//  Rate 点评 类型

#import <Foundation/Foundation.h>
#import "MonolayerView.h"
#import "NudgesBaseModel.h"
#import "NudgesModel.h"

@protocol RateEventDelegate <NSObject>

/// eg: 按钮点击事件
/// @param jumpType 跳转类型
/// @param url 跳转路由 or 路径
- (void)RateClickEventByType:(KButtonsUrlJumpType)jumpType Url:(NSString *)url;

/// eg:提交评分
- (void)RateSubmitByScore:(double)score thumb:(NSInteger)thumbsScore;
@end


NS_ASSUME_NONNULL_BEGIN

@interface HJRateManager : NSObject

@property (nonatomic, assign) id<RateEventDelegate> delegate;

@property (nonatomic, strong) MonolayerView *monolayerView;

@property (nonatomic, strong) NudgesBaseModel *baseModel;

@property (nonatomic, strong) NudgesModel *nudgesModel;

+ (instancetype)sharedInstance;
@end

NS_ASSUME_NONNULL_END
