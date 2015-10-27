//
//  UIImage+Extensions.h
//  ImageTest
//
//  Created by 瓜木 on 15/10/27.
//  Copyright © 2015年 黄飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extensions)



/*!
 @abstract      获取一个可拉伸的UIImage
 @param         imageName  图片名称
 @result        UIImage autorelease的对象
 */
+ (UIImage *)streImageNamed:(NSString *)imageName;
+ (UIImage *)streImageNamed:(NSString *)imageName capX:(CGFloat)x capY:(CGFloat)y;

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
- (UIImage *)imageByScalingToSize:(CGSize)targetSize;
@end
