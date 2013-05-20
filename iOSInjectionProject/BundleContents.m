/*
    Generated for Injection of class implementations
*/

#define INJECTION_NOIMPL
#define INJECTION_BUNDLE InjectionBundle4

#import "/Users/danielbonates/Library/Application Support/Developer/Shared/Xcode/Plug-ins/InjectionPlugin.xcplugin/Contents/Resources/BundleInjection.h"

#undef _instatic
#define _instatic extern

#undef _inglobal
#define _inglobal extern

#undef _inval
#define _inval( _val... ) /* = _val */

#import "/Users/danielbonates/ios_apps/ImageBlender/ImageBlender/UIImage+UIImage_DBImageBlender.m"


@interface InjectionBundle4 : NSObject
@end
@implementation InjectionBundle4

+ (void)load {
    extern Class OBJC_CLASS_$_UIImage;
	[BundleInjection loadedClass:INJECTION_BRIDGE(Class)(void *)&OBJC_CLASS_$_UIImage notify:4];
    [BundleInjection loadedNotify:4];
}

@end

