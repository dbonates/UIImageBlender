//
//  ViewController.m
//  ImageBlender
//
//  Created by Daniel Bonates on 5/10/13.
//  Copyright (c) 2013 Daniel Bonates. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+UIImage_DBImageBlender.h"

@interface ViewController ()
@end

@implementation ViewController

int currentCoverIndex;
int currentHighlightIndex;
BOOL usehighlight;
float currentCoverXoffset;
float currentCoverYoffset;
float currentHighlightXoffset;
float currentHighlightYoffset;
BOOL changingCoverOffset;

@synthesize xOffsetStepper = xOffsetStepper;
@synthesize yOffsetStepper = yOffsetStepper;
@synthesize imageView = imageView;
@synthesize xOffsetLabel = xOffsetLabel;
@synthesize yOffsetLabel = yOffsetLabel;


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    currentCoverIndex = 0;
    currentHighlightIndex = 2;
    usehighlight = YES;
    currentCoverXoffset = 38;
    currentCoverYoffset = 1;
    currentHighlightXoffset = 39;
    currentHighlightYoffset = 0;
    changingCoverOffset = YES;
    
    xOffsetStepper.value = currentCoverXoffset;
    [self updateOffsetLabel];
    
    self.covers = @[@"127",@"128",@"133",@"135",@"134"];
        
    self.highlightModeNames = @[@"kCGBlendModeNormal",
                                    @"kCGBlendModeMultiply",
                                    @"kCGBlendModeScreen",
                                    @"kCGBlendModeOverlay",
                                    @"kCGBlendModeDarken",
                                    @"kCGBlendModeLighten",
                                    @"kCGBlendModeColorDodge",
                                    @"kCGBlendModeColorBurn",
                                    @"kCGBlendModeSoftLight",
                                    @"kCGBlendModeHardLight",
                                    @"kCGBlendModeDifference",
                                    @"kCGBlendModeExclusion",
                                    @"kCGBlendModeHue",
                                    @"kCGBlendModeSaturation",
                                    @"kCGBlendModeColor",
                                    @"kCGBlendModeLuminosity",
                                    @"kCGBlendModeClear",
                                    @"kCGBlendModeCopy",
                                    @"kCGBlendModeSourceIn",
                                    @"kCGBlendModeSourceOut",
                                    @"kCGBlendModeSourceAtop",
                                    @"kCGBlendModeDestinationOver",
                                    @"kCGBlendModeDestinationIn",
                                    @"kCGBlendModeDestinationOut",
                                    @"kCGBlendModeDestinationAtop",
                                    @"kCGBlendModeXOR",
                                    @"kCGBlendModePlusDarker",
                                    @"kCGBlendModePlusLighter"];
    
    self.highlightModes = [NSMutableArray arrayWithCapacity:self.highlightModeNames.count];
    for (int i=0; i< self.highlightModeNames.count; i++) {
        self.highlightModes[i] = [NSNumber numberWithInt:i];

    }
    
    
    [self updateImage];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeHighLightBlendMode:(id)sender {
    currentHighlightIndex++;
    
    if (currentHighlightIndex >= self.highlightModes.count) {
        currentHighlightIndex = 0;
    }
    [self updateImage];
}

- (IBAction)changeCover:(id)sender {
    
    currentCoverIndex++;
    
    if (currentCoverIndex >= self.covers.count) {
        currentCoverIndex = 0;
    }
    [self updateImage];
}

- (IBAction)defineOffsetTarget:(id)sender {
    UISegmentedControl *segControl  = (UISegmentedControl *)sender;
    if (segControl.selectedSegmentIndex == 0) {
        changingCoverOffset = YES;
        xOffsetStepper.value = currentCoverXoffset;
        yOffsetStepper.value = currentCoverYoffset;
    }
    else
    {
        changingCoverOffset = NO;
        xOffsetStepper.value = currentHighlightXoffset;
        yOffsetStepper.value = currentHighlightYoffset;
    }
    [self updateOffsetLabel];
}

- (void)updateOffsetLabel
{
    if (changingCoverOffset)
    {
        xOffsetLabel.text = [NSString stringWithFormat:@"%2.f", currentCoverXoffset];
        yOffsetLabel.text = [NSString stringWithFormat:@"%2.f", currentCoverYoffset];
    }
    else
    {
        xOffsetLabel.text = [NSString stringWithFormat:@"%2.f", currentHighlightXoffset];
        yOffsetLabel.text = [NSString stringWithFormat:@"%2.f", currentHighlightYoffset];
    }
}

- (IBAction)changeXoffset:(id)sender {
    UIStepper *stepper = (UIStepper *)sender;
    
    if (changingCoverOffset) {
        currentCoverXoffset = stepper.value;
    }
    else
    {
        currentHighlightXoffset = stepper.value;
    }
    [self updateOffsetLabel];
    [self updateImage];
}

- (IBAction)changeYoffset:(id)sender {
    UIStepper *stepper = (UIStepper *)sender;
    
    if (changingCoverOffset) {
        currentCoverYoffset = stepper.value;
    }
    else
    {
        currentHighlightYoffset = stepper.value;
    }
    [self updateOffsetLabel];
    [self updateImage];
}

- (IBAction)highlightOnOff:(id)sender {
    usehighlight:usehighlight = !usehighlight;
    [self updateImage];
}


- (void)updateImage
{
    NSString *currentCoverIamgeName = [self.covers objectAtIndex:currentCoverIndex];
    imageView.image = [UIImage blendOverlay:[UIImage imageNamed:currentCoverIamgeName]
                              withBaseImage:[UIImage imageNamed:@"magazine_mockup_base"]
                             highlightImage:[UIImage imageNamed:@"magazine_mockup_reflexo"]
                              highlightMode:currentHighlightIndex
                               usehighlight:usehighlight
                        currentCoverXoffset:currentCoverXoffset
                       currentCoverYoffset:currentCoverYoffset
                    currentHighlightXoffset:currentHighlightXoffset
                    currentHighlightYoffset:currentHighlightYoffset
                        overlayCoverSize:CGSizeMake(150,200)
                       overlayHighlightSize:CGSizeMake(150,200)
                       ];
    self.hghlightModeLabel.text = [NSString stringWithFormat:@"%@, (%d)", self.highlightModeNames[currentHighlightIndex], currentHighlightIndex];
}
@end
