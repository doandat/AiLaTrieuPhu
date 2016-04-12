//
//  BaseViewController.m
//  AiLaTrieuPhu
//
//  Created by DatDV on 4/8/16.
//  Copyright (c) 2016 amb. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.widthMainScreen = [UIScreen mainScreen].bounds.size.width;
    self.heightMainScreen = [UIScreen mainScreen].bounds.size.height;
    
    [self loadData];
    
}

- (void)loadData{
    /**
     *  Test request data
     */
    NSArray *arrQuestion = [AppService getQuestionWithCategory:@"" level:@"1" limit:@"20"];
    NSLog(@"finish:%@",arrQuestion);

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
