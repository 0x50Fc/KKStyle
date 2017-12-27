//
//  KKStyleProperty.h
//  KKStyle
//
//  Created by hailong11 on 2017/12/25.
//  Copyright © 2017年 mofang.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KKStyle : NSObject

+(CGFloat) UnitRPX;

+(CGFloat) UnitPX;

-(void) kk_set:(NSDictionary *) propertys;

/**
 * #ffffff
 * #fff
 * #ffffffff
 */
-(void) kk_setBackgroundColor:(id) value;

/**
 * #ffffff
 * #fff
 * #ffffffff
 */
-(void) kk_setColor:(id) value;

/**
 * 1px
 * bold 1px
 * fontname 1px
 */
-(void) kk_setFont:(id) value;

-(void) kk_setBorderWidth:(id) value;

-(void) kk_setBorderColor:(id) value;

-(void) kk_setBorderRadius:(id) value;

/**
 * 1px 1px 5px #ffffff
 */
-(void) kk_setShadow:(id) value;

-(void) kk_setOpacity:(id) value;

/**
 * left center right justified
 */
-(void) kk_setTextAlign:(id) value;


@end

@interface NSObject(KKStyle)

-(void) kk_setStyle:(id) value forKey:(NSString *) key;

-(void) kk_onStyleChanged;

-(NSString *) kk_status;

-(void) kk_setStatus:(NSString *) status;

-(void) kk_setInStatus:(NSString *) status;

-(void) kk_setStyle:(void (^)(KKStyle * style)) block status:(NSString *) status;

@end


