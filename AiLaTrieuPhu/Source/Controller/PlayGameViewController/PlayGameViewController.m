//
//  PlayGameViewController.m
//  AiLaTrieuPhu
//
//  Created by DatDV on 4/11/16.
//  Copyright (c) 2016 amb. All rights reserved.
//

#import "PlayGameViewController.h"

@interface PlayGameViewController (){
    
    
    __weak IBOutlet UIView *viewQuestion;
    __weak IBOutlet UIView *subViewQuestion;
    __weak IBOutlet NSLayoutConstraint *constraintWidthViewQuestion;
    __weak IBOutlet NSLayoutConstraint *constraintCenterViewQuestion;
    
    __weak IBOutlet UIView *viewContainAnswer;
    __weak IBOutlet UIView *viewAnswer1;
    __weak IBOutlet UIView *viewAnswer2;
    __weak IBOutlet UIView *viewAnswer3;
    __weak IBOutlet UIView *viewAnswer4;
    
    __weak IBOutlet NSLayoutConstraint *constraintHeightViewQuestion;
 
    __weak IBOutlet NSLayoutConstraint *constraintTopAnswer1;
    __weak IBOutlet NSLayoutConstraint *constraintBtnTop1;
    __weak IBOutlet NSLayoutConstraint *constraintBtnTop2;
    __weak IBOutlet NSLayoutConstraint *constraintBtnTop3;
    
    __weak IBOutlet NSLayoutConstraint *constraintCenterAnswer1;
    __weak IBOutlet NSLayoutConstraint *constraintCenterAnswer2;
    __weak IBOutlet NSLayoutConstraint *constraintCenterAnswer3;
    __weak IBOutlet NSLayoutConstraint *constraintCenterAnswer4;
    
    
    
    IBOutlet UIView *viewLevel;
    
    __weak IBOutlet UIButton *btnAnswer1;
    __weak IBOutlet UIButton *btnAnswer2;
    __weak IBOutlet UIButton *btnAnswer3;
    __weak IBOutlet UIButton *btnAnswer4;
    
    BOOL checkChange;
    NSInteger loopCount;
    NSTimer *timer;
    
}

@end

@implementation PlayGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    viewLevel.frame = CGRectMake(-self.widthMainScreen, 0, self.widthMainScreen, self.heightMainScreen);
    [self.view addSubview:viewLevel];
    
    UITapGestureRecognizer *tapOnVideoRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDismissViewLevel:)];
    
    [viewLevel addGestureRecognizer:tapOnVideoRecognizer];
    
    
    constraintCenterAnswer1.constant = constraintCenterAnswer3.constant = -self.widthMainScreen;
    
    constraintCenterAnswer2.constant = constraintCenterAnswer4.constant = self.widthMainScreen;
    
//    CGRect frameViewQuestion = viewQuestion.frame;
//    frameViewQuestion.size.width = 0;
//    viewQuestion.frame = frameViewQuestion;
    
    constraintWidthViewQuestion.constant = 0;
    constraintCenterViewQuestion.constant = -self.widthMainScreen;
    
    [btnAnswer1 addTarget:self action:@selector(btnAnswer1:) forControlEvents:UIControlEventTouchUpInside];
    [btnAnswer2 addTarget:self action:@selector(btnAnswer2:) forControlEvents:UIControlEventTouchUpInside];
    [btnAnswer3 addTarget:self action:@selector(btnAnswer3:) forControlEvents:UIControlEventTouchUpInside];
    [btnAnswer4 addTarget:self action:@selector(btnAnswer4:) forControlEvents:UIControlEventTouchUpInside];

    checkChange = YES;
    loopCount = 0;

}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    subViewQuestion.layer.cornerRadius = 5;
    if ([UIScreen mainScreen].bounds.size.height < 568) {
        constraintBtnTop1.constant = constraintBtnTop2.constant = constraintBtnTop3.constant = (viewContainAnswer.frame.size.height - 35*4-10)/3;
        constraintHeightViewQuestion.constant = 140;

    }else{
        constraintTopAnswer1.constant = 15;
    }
}


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [UIView animateWithDuration:2
                     animations:^{
                         CGRect frame = viewLevel.frame;
                         frame.origin.x = 0;
                         viewLevel.frame = frame;
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                     }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) tapDismissViewLevel: (UITapGestureRecognizer *)recognizer
{
    //Code to handle the gesture
    [UIView animateWithDuration:2
                     animations:^{
                         CGRect frame = viewLevel.frame;
                         frame.origin.x = -self.widthMainScreen;
                         viewLevel.frame = frame;
//                         constraintCenterAnswer1.constant = constraintCenterAnswer3.constant = constraintCenterAnswer2.constant = constraintCenterAnswer4.constant = 0;
                         
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                         [UIView animateWithDuration:1
                                          animations:^{
//                                              CGRect frameViewQuestion = viewQuestion.frame;
//                                              frameViewQuestion.size.width = 0;
//                                              viewQuestion.frame = frameViewQuestion;
                                              
                                              constraintWidthViewQuestion.constant = self.widthMainScreen;

                                              
                                              constraintCenterViewQuestion.constant = 0;
                                              constraintCenterAnswer1.constant = constraintCenterAnswer3.constant = constraintCenterAnswer2.constant = constraintCenterAnswer4.constant = 0;
                                              [self.view layoutIfNeeded];
                                              
                                          }
                                          completion:^(BOOL finished){
                                              NSLog(@"Done!");
                                          }];

                     }];
}

#pragma mark action button answer
- (void)btnAnswer1:(id)sender{
    timer = [NSTimer scheduledTimerWithTimeInterval: 0.1
                                             target: self
                                           selector: @selector(handleTimer)
                                           userInfo: nil
                                            repeats: YES];
}

- (void)btnAnswer2:(id)sender{
    
}

- (void)btnAnswer3:(id)sender{
    
}

- (void)btnAnswer4:(id)sender{
    
}

- (void)handleTimer{
    if (loopCount >= 20) {
        if (timer) {
            [timer invalidate];
            timer = nil;
        }
//        [timer invalidate];
//        timer = nil;
        btnAnswer1.backgroundColor = [UIColor blueColor];
        loopCount = 0;
        [UIView animateWithDuration:2
                         animations:^{
                             CGRect frame = viewLevel.frame;
                             frame.origin.x = 0;
                             viewLevel.frame = frame;
                         }
                         completion:^(BOOL finished){
                             NSLog(@"Done!");
                             [self setLayoutFirst];
                         }];

        
    }else{
        if (checkChange) {
            btnAnswer1.backgroundColor = [UIColor redColor];
            checkChange = NO;
        }else{
            btnAnswer1.backgroundColor = [UIColor greenColor];
            checkChange = YES;
        }
        loopCount++;
    }
}

- (void)setLayoutFirst{
    
    constraintCenterAnswer1.constant = constraintCenterAnswer3.constant = -self.widthMainScreen;
    
    constraintCenterAnswer2.constant = constraintCenterAnswer4.constant = self.widthMainScreen;
    
    //    CGRect frameViewQuestion = viewQuestion.frame;
    //    frameViewQuestion.size.width = 0;
    //    viewQuestion.frame = frameViewQuestion;
    
    constraintWidthViewQuestion.constant = 0;
    constraintCenterViewQuestion.constant = -self.widthMainScreen;
    
    [btnAnswer1 addTarget:self action:@selector(btnAnswer1:) forControlEvents:UIControlEventTouchUpInside];
    [btnAnswer2 addTarget:self action:@selector(btnAnswer2:) forControlEvents:UIControlEventTouchUpInside];
    [btnAnswer3 addTarget:self action:@selector(btnAnswer3:) forControlEvents:UIControlEventTouchUpInside];
    [btnAnswer4 addTarget:self action:@selector(btnAnswer4:) forControlEvents:UIControlEventTouchUpInside];

}
@end
