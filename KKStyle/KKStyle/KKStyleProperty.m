//
//  KKStyleProperty.m
//  KKStyle
//
//  Created by hailong11 on 2017/12/25.
//  Copyright © 2017年 mofang.cn. All rights reserved.
//

#import "KKStyleProperty.h"

#include <objc/runtime.h>

@interface KKStyle() {
    NSMutableDictionary * _propertys;
}

-(void) setToObject:(NSObject *) object;

@end

@implementation KKStyle

+(CGFloat) UnitRPX {
    static CGFloat v = 0;
    if(v == 0) {
        v = 750 / [UIScreen mainScreen].bounds.size.width;
    }
    return v;
}

+(CGFloat) UnitPX {
    return 1.0f;
}

-(instancetype) init {
    if((self = [super init])) {
        _propertys = [[NSMutableDictionary alloc] initWithCapacity:4];
    }
    return self;
}

-(void) kk_set:(NSDictionary *) propertys {
    _propertys = [[NSMutableDictionary alloc] initWithDictionary:propertys];
}

/**
 * #ffffff
 * #fff
 * #ffffffff
 */
-(void) kk_setBackgroundColor:(id) value {
    _propertys[@"background-color"] = value;
}

/**
 * #ffffff
 * #fff
 * #ffffffff
 */
-(void) kk_setColor:(id) value {
    _propertys[@"color"] = value;
}

/**
 * 1px
 * bold 1px
 * fontname 1px
 */
-(void) kk_setFont:(id) value {
    _propertys[@"font"] = value;
}

-(void) kk_setBorderWidth:(id) value {
    _propertys[@"border-width"] = value;
}

-(void) kk_setBorderColor:(id) value {
    _propertys[@"border-color"] = value;
}

-(void) kk_setBorderRadius:(id) value {
    _propertys[@"border-radius"] = value;
}

/**
 * 1px 1px 5px #ffffff
 */
-(void) kk_setShadow:(id) value {
    _propertys[@"shadow"] = value;
}

-(void) kk_setOpacity:(id) value {
    _propertys[@"opacity"] = value;
}

/**
 * left center right
 */
-(void) kk_setTextAlign:(id) value {
    _propertys[@"text-align"] = value;
}

-(void) setToObject:(NSObject *) object {
    NSEnumerator * keyEnum = [_propertys keyEnumerator];
    NSString * key;
    while((key = [keyEnum nextObject])) {
        id v = [_propertys valueForKey:key];
        [object kk_setStyle:v forKey:key];
    }
}
@end

@implementation NSObject(KKStyle)

-(void) kk_setStyle:(id) value forKey:(NSString *) key {
    
}

-(NSString *) kk_status {
    NSString * v = objc_getAssociatedObject(self, "_kk_status");
    if(v == nil) {
        v = objc_getAssociatedObject(self, "_kk_in_status");
    }
    return v;
}

-(void) kk_setStatus:(NSString *) status {
    objc_setAssociatedObject(self, "_kk_status", status, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self kk_onStyleChanged];
}

-(void) kk_setInStatus:(NSString *) status {
    objc_setAssociatedObject(self, "_kk_in_status", status, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self kk_onStyleChanged];
}

-(void) kk_onStyleChanged {
    NSMutableDictionary * v = objc_getAssociatedObject(self, "_kk_styles");
    NSString * status = [self kk_status];
    if(status == nil){
        status = @"";
    }
    KKStyle * style = [v valueForKey:status];
    [style setToObject:self];
}

-(void) kk_setStyle:(void (^)(KKStyle * style)) block status:(NSString *) status {
    NSMutableDictionary * v = objc_getAssociatedObject(self, "_kk_styles");
    if(v == nil) {
        v = [[NSMutableDictionary alloc] initWithCapacity:4];
        objc_setAssociatedObject(self, "_kk_styles", v, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    if(status == nil) {
        status = @"";
    }
    KKStyle * style = [v valueForKey:status];
    if(style == nil) {
        style = [[KKStyle alloc] init];
        [v setValue:style forKey:status];
    }
    block(style);
}


@end
