//
//  HomeViewController.m
//  AiLaTrieuPhu
//
//  Created by DatDV on 4/8/16.
//  Copyright (c) 2016 amb. All rights reserved.
//

#import "HomeViewController.h"
#import "PlayGameViewController.h"

@interface HomeViewController (){
    AVAudioPlayer* audioPlayer;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.]
    [self.navigationController setNavigationBarHidden:YES];
    [self.btnStart addTarget:self action:@selector(btnStart:) forControlEvents:UIControlEventTouchUpInside];
    

    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSString* path = [[NSBundle mainBundle] pathForResource:@"bgmusic" ofType:@"mp3"];
    NSURL* file = [NSURL fileURLWithPath:path];
    // thanks @gebirgsbaerbel
    
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:file error:nil];
    [audioPlayer prepareToPlay];
    if ([audioPlayer isPlaying]) {
        [audioPlayer pause];
    } else {
        [audioPlayer play];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)btnStart:(id)sender{
    PlayGameViewController *playGameVC = [[PlayGameViewController alloc]initWithNibName:@"PlayGameViewController" bundle:nil];
    [self.navigationController pushViewController:playGameVC animated:YES];
    
    if ([audioPlayer isPlaying]) {
        [audioPlayer pause];
    }
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
