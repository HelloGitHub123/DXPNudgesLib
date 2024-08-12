//
//  HJFeedBackManager.h
//  DITOApp
//
//  Created by 李标 on 2022/9/18.
//

#import <Foundation/Foundation.h>
#import "MonolayerView.h"
#import "NudgesBaseModel.h"
#import "NudgesModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol FeedBackEventDelegate <NSObject>

/// eg: 按钮点击事件
/// @param jumpType 跳转类型
/// @param url 跳转路由 or 路径
- (void)FeedBackClickEventByType:(KButtonsUrlJumpType)jumpType Url:(NSString *)url;
@end


@interface HJFeedBackManager : NSObject

@property (nonatomic, assign) id<FeedBackEventDelegate> delegate;

@property (nonatomic, strong) MonolayerView *monolayerView;

@property (nonatomic, strong) NudgesBaseModel *baseModel;

@property (nonatomic, strong) NudgesModel *nudgesModel;

+ (instancetype)sharedInstance;
@end

NS_ASSUME_NONNULL_END
