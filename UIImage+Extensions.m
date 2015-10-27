//
//  UIImage+Extensions.m
//  ImageTest
//
//  Created by 瓜木 on 15/10/27.
//  Copyright © 2015年 黄飞. All rights reserved.
//

#import "UIImage+Extensions.h"

@implementation UIImage (Extensions)




+ (UIImage *)streImageNamed:(NSString *)imageName
{
    if (imageName == nil) {
        return nil;
    }
    UIImage *image = [UIImage imageNamed:imageName];
    UIImage *streImage = [image stretchableImageWithLeftCapWidth:image.size.width/2 topCapHeight:image.size.height/2];
    return streImage;
}

+ (UIImage *)streImageNamed:(NSString *)imageName capX:(CGFloat)x capY:(CGFloat)y
{
    if (imageName == nil) {
        return nil;
    }
    UIImage *image = [UIImage imageNamed:imageName];
    UIImage *streImage = [image stretchableImageWithLeftCapWidth:x topCapHeight:y];
    return streImage;
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, size.width, size.height, 8, 4 * size.width, colorSpace, (CGBitmapInfo)kCGImageAlphaPremultipliedFirst);
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    
    UIImage *image = [UIImage imageWithCGImage:imageMasked];
    
    CGImageRelease(imageMasked);
    
    return image;
}

- (UIImage *)imageByScalingToSize:(CGSize)targetSize{
    
    
    
    
    
    float actualHeight = self.size.height;
    float actualWidth = self.size.width;
    
    
    
    float targetH = targetSize.height;
    
    float targetW = targetSize.width;
    //if(actualHeight==480 && actualWidth==320){
    
    
    //return self;
    
    //}
    
    float imgRatio = actualWidth/actualHeight;
    //float maxRatio = 320.0/480.0;
    
    float maxRatio = targetW/targetH;
    
    
    if (actualHeight > targetH ||  actualWidth > targetW) {
        
        
        if(imgRatio < maxRatio){
            imgRatio = targetH / actualHeight;
            actualWidth = imgRatio * actualWidth;
            actualHeight = targetH;
        }
        else{
            imgRatio = targetW / actualWidth;
            actualHeight = imgRatio * actualHeight;
            actualWidth = targetW;
        }
        
        NSLog(@"resize image !\n ");
    }
    else{
        NSLog(@"old image !\n ");
        
        return self;
    }
    
    //actualWidth =300; actualHeight=400;
    CGRect rect = CGRectMake(0.0, 0.0, actualWidth, actualHeight);
    
    UIGraphicsBeginImageContext(rect.size);
    
    [self drawInRect:rect];
    
    UIImage *resized = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return resized;
}





@end
