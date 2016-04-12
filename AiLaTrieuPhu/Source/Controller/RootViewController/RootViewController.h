//
//  RootViewController.h
//  AiLaTrieuPhu
//
//  Created by DatDV on 4/8/16.
//  Copyright (c) 2016 amb. All rights reserved.
//

#import "BaseViewController.h"
#import "SWRevealViewController.h"

@class SWRevealViewController;

@interface RootViewController : BaseViewController

@property (nonatomic, strong) UINavigationController *navigation;

@property (strong, nonatomic) SWRevealViewController *viewController;

@property (weak, nonatomic) IBOutlet UIView *viewContain;

+(RootViewController*)sharedInstance;

@end
