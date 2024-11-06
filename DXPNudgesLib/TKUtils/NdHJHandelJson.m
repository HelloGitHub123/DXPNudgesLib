//
//  NdHJHandelJson.m
//  youcaoping
//
//  Created by 在野 on 2018/11/29.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import "NdHJHandelJson.h"

@implementation NdHJHandelJson
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if (err) {
        NSLog(@"DXPNugges Log:=== json parsing failure：%@",err);
        return nil;
    }

    return dic;
}

//数组转为json字符串
+ (NSString *)arrayToJSONString:(NSMutableArray *)array {
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSString *jsonTemp = [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    //    NSString *jsonResult = [jsonTemp stringByReplacingOccurrencesOfString:@" " withString:@""];
    return jsonTemp;
}

+ (NSString *)convert2JSONWithDictionary:(NSDictionary *)dic {
    NSError *err;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:&err];
    
    NSString *jsonString = @"";
    if (!jsonData) {
        NSLog(@"DXPNugges Log:=== %@",err);
    } else {
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }

    NSLog(@"DXPNugges Log:=== jsonString=====%@",jsonString);
    return jsonString;
}


@end
