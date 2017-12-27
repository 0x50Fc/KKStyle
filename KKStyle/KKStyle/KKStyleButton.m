//
//  KKStyleButton.m
//  KKStyle
//
//  Created by hailong11 on 2017/12/25.
//  Copyright © 2017年 mofang.cn. All rights reserved.
//

#import "KKStyleButton.h"
#import "KKStyleProperty.h"

@implementation KKStyleButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void) refreshStatus {
    if(![self isEnabled]) {
        [self kk_setStatus:@"disabled"];
    } else if([self isSelected]) {
        [self kk_setStatus:@"selected"];
    } else if([self isHighlighted]) {
        [self kk_setStatus:@"hover"];
    } else {
        [self kk_setStatus:nil];
    }
}

-(void) setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    [self refreshStatus];
}

-(void) setSelected:(BOOL)selected {
    [super setSelected:selected];
    [self refreshStatus];
}

-(void) setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    [self refreshStatus];
}

@end
