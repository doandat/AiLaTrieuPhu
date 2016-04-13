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
    
    __weak IBOutlet UIImageView *imageAnswer1;
    __weak IBOutlet UIImageView *imageAnswer2;
    __weak IBOutlet UIImageView *imageAnswer3;
    __weak IBOutlet UIImageView *imageAnswer4;
    
    __weak IBOutlet UILabel *lbAnswer1;
    __weak IBOutlet UILabel *lbAnswer2;
    __weak IBOutlet UILabel *lbAnswer3;
    __weak IBOutlet UILabel *lbAnswer4;
    
    
    
    BOOL checkChange;
    NSInteger loopCount;
    NSTimer *timer;
    NSString *indexAnswerTrue;
    NSInteger indexQuestionNext;
    BOOL isReady;
//    AVAudioPlayer* audioPlayer;
    
}
@property (nonatomic, strong) AFSoundPlayback *playback;
@property (nonatomic, strong) AFSoundQueue *queue;

@property (nonatomic, strong) NSMutableArray *items;

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
    indexAnswerTrue = @"1";
    isReady = NO;
    indexQuestionNext = 0;
    
    

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
    [UIView animateWithDuration:1
                     animations:^{
                         CGRect frame = viewLevel.frame;
                         frame.origin.x = 0;
                         viewLevel.frame = frame;
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                     }];
    
    AFSoundItem *item1 = [[AFSoundItem alloc] initWithLocalResource:@"luatchoi_b.mp3" atPath:nil];
    AFSoundItem *item2 = [[AFSoundItem alloc] initWithLocalResource:@"ready.mp3" atPath:nil];

    
    _items = [NSMutableArray arrayWithObjects:item1,item2, nil];
    _queue = [[AFSoundQueue alloc] initWithItems:_items];
    [_queue playCurrentItem];
    
    [_queue listenFeedbackUpdatesWithBlock:^(AFSoundItem *item) {
        
        NSLog(@"Item duration: %ld - time elapsed: %ld", (long)item.duration, (long)item.timePlayed);
    } andFinishedBlock:^(AFSoundItem *nextItem) {
        if (!nextItem) {
            [_queue pause];
            [_queue clearQueue];
            [self dismissViewFifteenQuestion:indexQuestionNext];
            
        }
        NSLog(@"Finished item, next one is %@", nextItem.title);
    }];


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) tapDismissViewLevel: (UITapGestureRecognizer *)recognizer
{
    //Code to handle the gesture
    isReady = YES;
    [self dismissViewFifteenQuestion:indexQuestionNext];
}

#pragma mark dismiss view fifteen question
-(void)dismissViewFifteenQuestion:(NSInteger)indexQuestion{
    [UIView animateWithDuration:1
                     animations:^{
                         CGRect frame = viewLevel.frame;
                         frame.origin.x = -self.widthMainScreen;
                         viewLevel.frame = frame;
                         //                         constraintCenterAnswer1.constant = constraintCenterAnswer3.constant = constraintCenterAnswer2.constant = constraintCenterAnswer4.constant = 0;
                         
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                         if (isReady) {
                              [_queue pause];
                              [_queue clearQueue];

                             [self setSoundQuestionNext:indexQuestionNext];
                             [UIView animateWithDuration:1
                                              animations:^{
                                                  constraintWidthViewQuestion.constant = self.widthMainScreen;
                                                  constraintCenterViewQuestion.constant = 0;
                                                  constraintCenterAnswer1.constant = constraintCenterAnswer3.constant = constraintCenterAnswer2.constant = constraintCenterAnswer4.constant = 0;
                                                  [self.view layoutIfNeeded];
                                                  
                                              }
                                              completion:^(BOOL finished){
                                                  NSLog(@"Done!");
//                                                  [_queue pause];
//                                                  [_queue clearQueue];
                                                  
                                              }];
                         }else{
                             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message"
                                                                             message:@"Bạn đã sẵn sàng chơi?."
                                                                            delegate:self
                                                                   cancelButtonTitle:@"Huỷ bỏ"
                                                                   otherButtonTitles:@"Đồng ý",nil];
                             [alert show];

                         }
                         
                     }];

}

#pragma mark set sound question next
-(void)setSoundQuestionNext:(NSInteger )indexQuestion{
    if (indexQuestion == 0) {
        
        AFSoundItem *item1 = [[AFSoundItem alloc] initWithLocalResource:@"gofind.mp3" atPath:nil];
        AFSoundItem *item2 = [[AFSoundItem alloc] initWithLocalResource:@"ques1.mp3" atPath:nil];
        
        
        _items = [NSMutableArray arrayWithObjects:item1,item2, nil];
        _queue = [[AFSoundQueue alloc] initWithItems:_items];
        [_queue playCurrentItem];
        
        [_queue listenFeedbackUpdatesWithBlock:^(AFSoundItem *item) {
            
            NSLog(@"Item duration: %ld - time elapsed: %ld", (long)item.duration, (long)item.timePlayed);
        } andFinishedBlock:^(AFSoundItem *nextItem) {
            if (!nextItem) {
                [_queue pause];
                [_queue clearQueue];
//                [self dismissViewFifteenQuestion:indexQuestionNext];
                
            }
            NSLog(@"Finished item, next one is %@", nextItem.title);
        }];
    }
}
#pragma mark action button answer
- (void)btnAnswer1:(id)sender{
    timer = [NSTimer scheduledTimerWithTimeInterval: 0.1
                                             target: self
                                           selector: @selector(handleTimer:)
                                           userInfo:@"1"
                                            repeats: YES];
}

- (void)btnAnswer2:(id)sender{
    timer = [NSTimer scheduledTimerWithTimeInterval: 0.1
                                             target: self
                                           selector: @selector(handleTimer:)
                                           userInfo:@"2"
                                            repeats: YES];

}

- (void)btnAnswer3:(id)sender{
    timer = [NSTimer scheduledTimerWithTimeInterval: 0.1
                                             target: self
                                           selector: @selector(handleTimer:)
                                           userInfo:@"3"
                                            repeats: YES];

}

- (void)btnAnswer4:(id)sender{
    timer = [NSTimer scheduledTimerWithTimeInterval: 0.1
                                             target: self
                                           selector: @selector(handleTimer:)
                                           userInfo:@"4"
                                            repeats: YES];

}

- (void)handleTimer:(NSTimer*)theTimer{
    NSLog (@"Got the string: %@", (NSString*)[theTimer userInfo]);
    NSString *btnStringSelected = (NSString*)[theTimer userInfo];
    if ([btnStringSelected isEqualToString:indexAnswerTrue]) {
        [self changeStateAnswerTrue];
    }else{
        [self changeStateAnswerFail:btnStringSelected];
        [self changeStateAnswerTrue];
        
    }
    
}

#pragma mark config state answer true

- (void)changeStateAnswer1True{
    if (checkChange) {
        [imageAnswer1 setImage:IMAGE_ANSWER_TRUE_1];
        checkChange = NO;
    }else{
        [imageAnswer1 setImage:IMAGE_ANSWER_TRUE_2];
        checkChange = YES;
    }
}

- (void)changeStateAnswer2True{
    if (checkChange) {
        [imageAnswer2 setImage:IMAGE_ANSWER_TRUE_1];
        checkChange = NO;
    }else{
        [imageAnswer2 setImage:IMAGE_ANSWER_TRUE_2];
        checkChange = YES;
    }
}

- (void)changeStateAnswer3True{
    if (checkChange) {
        [imageAnswer3 setImage:IMAGE_ANSWER_TRUE_1];
        checkChange = NO;
    }else{
        [imageAnswer3 setImage:IMAGE_ANSWER_TRUE_2];
        checkChange = YES;
    }
}

- (void)changeStateAnswer4True{
    if (checkChange) {
        [imageAnswer4 setImage:IMAGE_ANSWER_TRUE_1];
        checkChange = NO;
    }else{
        [imageAnswer4 setImage:IMAGE_ANSWER_TRUE_2];
        checkChange = YES;
    }
}

- (void)changeStateAnswerTrue{
    if ([indexAnswerTrue isEqualToString:@"1"]) {
        if (loopCount >= 20) {
            if (timer) {
                [timer invalidate];
                timer = nil;
            }
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
            [self changeStateAnswer1True];
            loopCount++;
        }
    }else if([indexAnswerTrue isEqualToString:@"2"]){
        if (loopCount >= 20) {
            if (timer) {
                [timer invalidate];
                timer = nil;
            }
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
            [self changeStateAnswer2True];
            loopCount++;
        }
    }else if([indexAnswerTrue isEqualToString:@"3"]){
        if (loopCount >= 20) {
            if (timer) {
                [timer invalidate];
                timer = nil;
            }
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
            [self changeStateAnswer3True];
            loopCount++;
        }
    }else if([indexAnswerTrue isEqualToString:@"4"]){
        if (loopCount >= 20) {
            if (timer) {
                [timer invalidate];
                timer = nil;
            }
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
            [self changeStateAnswer4True];
            loopCount++;
        }
    }
}

#pragma mark config state answer fail
- (void)changeStateAnswerFail:(NSString *)indexButton{
    if ([indexButton isEqualToString:@"1"]) {
        [imageAnswer1 setImage:IMAGE_ANSWER_FAIL];
    }else if ([indexButton isEqualToString:@"2"]){
        [imageAnswer2 setImage:IMAGE_ANSWER_FAIL];
    }else if ([indexButton isEqualToString:@"3"]){
        [imageAnswer3 setImage:IMAGE_ANSWER_FAIL];
    }else if ([indexButton isEqualToString:@"4"]){
        [imageAnswer4 setImage:IMAGE_ANSWER_FAIL];
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
    [imageAnswer1 setImage:IMAGE_BACKGROUND_ANSWER];
    [imageAnswer2 setImage:IMAGE_BACKGROUND_ANSWER];
    [imageAnswer3 setImage:IMAGE_BACKGROUND_ANSWER];
    [imageAnswer4 setImage:IMAGE_BACKGROUND_ANSWER];


}
@end
