# UIImage+Blender Category

UIImage category for blending 3 uimages, considering blend mode. 

I've used it on a realtime magazine cover as you see in the example project. The main goal is to let the user upload a flat cover image extracted from their PDF file, and then we apply it on a magazine base mockup with blend multiply and then on top we apply the highlight image with a highlight blend.

Please [let me know](http://bonates.com) if you plan to use this code on your app or want to improve it!

## Setup

All you want is the UIImage+UIImage_DBImageBlender .h and .m on your project and do the import as usual:
<pre lang="objective-c">
<code>
#import "UIImage+UIImage_DBImageBlender.h"
</code>
</pre>
Then just use it:

example:

```objective-c

> currentCoverIndex = 0;
> usehighlight = YES;
> currentCoverXoffset = 38;
> currentCoverYoffset = 1;
> currentHighlightXoffset = 39;
> currentHighlightYoffset = 0;
> changingCoverOffset = YES;

imageView.image = [UIImage blendOverlay:[UIImage imageNamed:currentCoverIamgeName]
                               withBaseImage:[UIImage imageNamed:@"magazine_mockup_base"]
                              highlightImage:[UIImage imageNamed:@"magazine_mockup_reflexo"]
                               highlightMode:kCGBlendModeScreen
                                usehighlight:usehighlight
                         currentCoverXoffset:currentCoverXoffset
                        currentCoverYoffset:currentCoverYoffset
                     currentHighlightXoffset:currentHighlightXoffset
                     currentHighlightYoffset:currentHighlightYoffset
                         overlayCoverSize:CGSizeMake(150,200)
                        overlayHighlightSize:CGSizeMake(150,200)
                        ];
```
That's it! See the example project for a more cool and robust setup and testing parameters app.

And don't forget to tellme if you find it usefull! 