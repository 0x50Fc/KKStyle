//
//  UIView+KKStyle.m
//  KKStyle
//
//  Created by hailong11 on 2017/12/25.
//  Copyright © 2017年 mofang.cn. All rights reserved.
//

#import "UIView+KKStyle.h"
#import "UIColor+KKStyle.h"
#import "UIFont+KKStyle.h"
#import "KKStylePixel.h"

@implementation UIView (KKStyle)

-(void) kk_onStyleChanged {
    [super kk_onStyleChanged];
    NSString * status = [self kk_status];
    for(UIView * v in [self subviews]) {
        [v kk_setInStatus:status];
    }
}

-(void) kk_setStyle:(id) value forKey:(NSString *) key {
    
    [super kk_setStyle:value forKey:key];
    
    if([key isEqualToString:@"background-color"]) {
        self.backgroundColor = [UIColor kk_StyleValue:value];
    } else if([key isEqualToString:@"border-color"]) {
        self.layer.borderColor = [UIColor kk_StyleValue:value].CGColor;
    } else if([key isEqualToString:@"border-width"]) {
        self.layer.borderWidth = [KKStylePixel pixel:value];
    } else if([key isEqualToString:@"border-radius"]) {
        self.layer.cornerRadius = [KKStylePixel pixel:value];
    } else if([key isEqualToString:@"shadow"]) {
        NSArray * vs = [value componentsSeparatedByString:@" "];
        CGSize p = CGSizeZero;
        if([vs count] >0) {
            p.width = [KKStylePixel pixel:vs[0]];
        }
        if([vs count] >1) {
            p.height = [KKStylePixel pixel:vs[1]];
        }
        self.layer.shadowOffset = p;
        
        if([vs count] > 2) {
            self.layer.shadowRadius = [KKStylePixel pixel:vs[2]];
        }
        
        if([vs count] > 3) {
            self.layer.shadowColor = [UIColor kk_StyleValue:vs[3]].CGColor;
        }
    }
    
}

@end

@implementation UILabel (KKStyle)


-(void) kk_setStyle:(id) value forKey:(NSString *) key {
    [super kk_setStyle:value forKey:key];
    
    if([key isEqualToString:@"color"]) {
        self.textColor = [UIColor kk_StyleValue:value];
    } else if([key isEqualToString:@"font"]) {
        self.font = [UIFont kk_StyleValue:value];
    } else if([key isEqualToString:@"text-align"]) {
        if([@"right" isEqualToString:value]) {
            self.textAlignment = NSTextAlignmentRight;
        } else if([@"center" isEqualToString:value]) {
            self.textAlignment = NSTextAlignmentCenter;
        } else if([@"justified" isEqualToString:value]) {
            self.textAlignment = NSTextAlignmentJustified;
        } else {
            self.textAlignment = NSTextAlignmentLeft;
        }
    }
    
}

@end

@implementation UITextView (KKStyle)

-(void) kk_setStyle:(id) value forKey:(NSString *) key {
    [super kk_setStyle:value forKey:key];
    
    if([key isEqualToString:@"color"]) {
        self.textColor = [UIColor kk_StyleValue:value];
    } else if([key isEqualToString:@"font"]) {
        self.font = [UIFont kk_StyleValue:value];
    } else if([key isEqualToString:@"text-align"]) {
        if([@"right" isEqualToString:value]) {
            self.textAlignment = NSTextAlignmentRight;
        } else if([@"center" isEqualToString:value]) {
            self.textAlignment = NSTextAlignmentCenter;
        } else if([@"justified" isEqualToString:value]) {
            self.textAlignment = NSTextAlignmentJustified;
        } else {
            self.textAlignment = NSTextAlignmentLeft;
        }
    }
    
}

@end
