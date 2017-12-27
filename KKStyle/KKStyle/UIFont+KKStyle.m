//
//  UIFont+KKStyle.m
//  KKStyle
//
//  Created by hailong11 on 2017/12/25.
//  Copyright © 2017年 mofang.cn. All rights reserved.
//

#import "UIFont+KKStyle.h"
#import "KKStylePixel.h"

@implementation UIFont (KKStyle)

+(UIFont *) kk_StyleValue:(id) value {
    
    if([value isKindOfClass:[UIFont class]]) {
        return value;
    }
    
    if([value isKindOfClass:[NSString class]]) {
        NSArray * vs = [value componentsSeparatedByString:@" "];
        CGFloat fontSize =0 ;
        for(NSString * v in vs) {
            if([v hasSuffix:@"px"]) {
                fontSize = [KKStylePixel pixel:v];
            } else if([v isEqualToString:@"bold"]) {
                return [UIFont boldSystemFontOfSize:fontSize];
            } else if([v isEqualToString:@"italic"]) {
                return [UIFont italicSystemFontOfSize:fontSize];
            } else {
                UIFont * vv = [UIFont fontWithName:v size:fontSize];
                if(vv) {
                    return vv;
                }
            }
        }
        return [UIFont systemFontOfSize:fontSize];
    }
    
    return nil;
}

@end
