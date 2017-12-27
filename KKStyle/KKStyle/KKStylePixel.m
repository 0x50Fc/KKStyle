//
//  KKStylePixel.m
//  KKStyle
//
//  Created by hailong11 on 2017/12/25.
//  Copyright © 2017年 mofang.cn. All rights reserved.
//

#import "KKStylePixel.h"
#import "KKStyleProperty.h"

@implementation KKStylePixel

+(CGFloat) pixel:(id) value {
    if([value isKindOfClass:[NSNumber class]]) {
        return [value doubleValue];
    }
    if([value isKindOfClass:[NSString class]]) {
        if([value hasSuffix:@"rpx"]) {
            return [value doubleValue] * [KKStyle UnitRPX];
        } else {
            return [value doubleValue] * [KKStyle UnitPX];
        }
    }
    return 0;
}
@end
