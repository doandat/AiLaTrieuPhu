//
//  RootViewController.m
//  AiLaTrieuPhu
//
//  Created by DatDV on 4/8/16.
//  Copyright (c) 2016 amb. All rights reserved.
//

#import "RootViewController.h"
#import "HomeViewController.h"
#import "SideBarViewController.h"

@interface RootViewController ()<SWRevealViewControllerDelegate>

@end

@implementation RootViewController

@synthesize viewController = _viewController;

static RootViewController *sharedInstance;

+(RootViewController*)sharedInstance {
    if (sharedInstance) {
        return sharedInstance;
    }
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];

    sharedInstance = self;
    // Do any additional setup after loading the view from its nib.
    HomeViewController *homeVC  = [[HomeViewController alloc] init];
    SideBarViewController *sidebarViewController = [[SideBarViewController alloc] init];
    
    SWRevealViewController *revealController = [[SWRevealViewController alloc] initWithRearViewController:sidebarViewController frontViewController:homeVC];
    revealController.delegate = self;
    
    self.viewController = revealController;
    
    self.navigation = [[UINavigationController alloc]initWithRootViewController:self.viewController];
    
    [self.navigationController setNavigationBarHidden:YES];
    
    
    CGRect frame = self.viewContain.bounds;
    
    self.navigation.view.frame = frame;
    self.navigation.view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.viewContain addSubview:self.navigation.view];
    [self addChildViewController:self.navigation];
}

- (void)revealController:(SWRevealViewController *)revealController didMoveToPosition:(FrontViewPosition)position
{
    if(position == FrontViewPositionLeft) {
        revealController.frontViewController.view.userInteractionEnabled = YES;
    } else {
        revealController.frontViewController.view.userInteractionEnabled = NO;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

