//
//  UIImage+UIImage_DBImageBlender.h
//  UIImageBlend
//
//  Created by Daniel Bonates on 5/10/13.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (UIImage_DBImageBlender)

+ (UIImage *)blendOverlay:(UIImage *)coverImage withBaseImage:(UIImage *)baseImage highlightImage:(UIImage *)highlightImage highlightMode:(int)highlightMode usehighlight:(BOOL)usehighlight currentCoverXoffset:(float)currentCoverXoffset currentCoverYoffset:(float)currentCoverYoffset currentHighlightXoffset:(float)currentHighlightXoffset currentHighlightYoffset:(float)currentHighlightYoffset;

@end
