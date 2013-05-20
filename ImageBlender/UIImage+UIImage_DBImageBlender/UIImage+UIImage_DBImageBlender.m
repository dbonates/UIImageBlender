//
//  UIImage+UIImage_DBImageBlender.m
//  UIImageBlend
//
//  Created by Daniel Bonates on 5/10/13.
//
//

#import "UIImage+UIImage_DBImageBlender.h"

@implementation UIImage (UIImage_DBImageBlender)


+ (UIImage *)blendOverlay:(UIImage *)coverImage withBaseImage:(UIImage *)baseImage highlightImage:(UIImage *)highlightImage highlightMode:(int)highlightMode usehighlight:(BOOL)usehighlight currentCoverXoffset:(float)currentCoverXoffset currentCoverYoffset:(float)currentCoverYoffset currentHighlightXoffset:(float)currentHighlightXoffset currentHighlightYoffset:(float)currentHighlightYoffset
{
    
    CGPoint coverImageOffset = CGPointMake(currentCoverXoffset, currentCoverYoffset);
    CGPoint highlightImageOffset = CGPointMake(currentHighlightXoffset, currentHighlightYoffset);
    UIGraphicsBeginImageContext(CGSizeMake(baseImage.size.width, baseImage.size.height));
    [baseImage drawInRect:CGRectMake(0, 0, baseImage.size.width, baseImage.size.height)];
    [coverImage drawInRect:CGRectMake(coverImageOffset.x, coverImageOffset.y, coverImage.size.width, coverImage.size.height) blendMode:kCGBlendModeMultiply alpha:1];
    if (usehighlight) [highlightImage drawInRect:CGRectMake(highlightImageOffset.x, highlightImageOffset.y, highlightImage.size.width, highlightImage.size.height) blendMode:highlightMode alpha:1];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end

/*
 kCGBlendModeNormal,
 kCGBlendModeMultiply,
 kCGBlendModeScreen,
 kCGBlendModeOverlay,
 kCGBlendModeDarken,
 kCGBlendModeLighten,
 kCGBlendModeColorDodge,
 kCGBlendModeColorBurn,
 kCGBlendModeSoftLight,
 kCGBlendModeHardLight,
 kCGBlendModeDifference,
 kCGBlendModeExclusion,
 kCGBlendModeHue,
 kCGBlendModeSaturation,
 kCGBlendModeColor,
 kCGBlendModeLuminosity,
 kCGBlendModeClear,
 kCGBlendModeCopy,
 kCGBlendModeSourceIn,
 kCGBlendModeSourceOut,
 kCGBlendModeSourceAtop,
 kCGBlendModeDestinationOver,
 kCGBlendModeDestinationIn,
 kCGBlendModeDestinationOut,
 kCGBlendModeDestinationAtop,
 kCGBlendModeXOR,
 kCGBlendModePlusDarker,
 kCGBlendModePlusLighter
*/