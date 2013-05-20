//
//  ViewController.h
//  ImageBlender
//
//  Created by Daniel Bonates on 5/10/13.
//  Copyright (c) 2013 Daniel Bonates. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) NSArray *covers;
@property (strong, nonatomic) NSMutableArray *highlightModes;
@property (strong, nonatomic) NSArray *highlightModeNames;
@property (weak, nonatomic) IBOutlet UILabel *hghlightModeLabel;
@property (weak, nonatomic) IBOutlet UIStepper *xOffsetStepper;
@property (weak, nonatomic) IBOutlet UIStepper *yOffsetStepper;

@property (weak, nonatomic) IBOutlet UIStepper *changeYoffset;
@property (weak, nonatomic) IBOutlet UILabel *xOffsetLabel;
@property (weak, nonatomic) IBOutlet UILabel *yOffsetLabel;

- (IBAction)changeHighLightBlendMode:(id)sender;
- (IBAction)changeCover:(id)sender;
- (IBAction)defineOffsetTarget:(id)sender;
- (IBAction)changeXoffset:(id)sender;
- (IBAction)changeYoffset:(id)sender;


- (IBAction)highlightOnOff:(id)sender;
@end
