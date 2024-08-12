//
//  NudgesConfigParametersModel.m
//  DITOApp
//
//  Created by 李标 on 2023/5/27.
//

#import "NudgesConfigParametersModel.h"

@implementation NudgesConfigParametersModel

- (id)init {
    self = [super init];
    if (self) {
        self.baseUrl = @"";
        self.identityType = KIdentityTypeType_Subscriber;
        self.identityId = 0;
        self.accNbr = @"";
        self.channelCode = @"";
        self.adviceCode = @"";
        self.appId = @"ditoapp";
    }
    return self;
}

@end
