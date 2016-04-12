//
//  Question.h
//  AiLaTrieuPhu
//
//  Created by DatDV on 4/11/16.
//  Copyright (c) 2016 amb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property (nonatomic) NSString *questionId;
@property (nonatomic) NSString *category;
@property (nonatomic) NSString *level;
@property (nonatomic) NSString *question;
@property (nonatomic) NSString *answer1;
@property (nonatomic) NSString *answer2;
@property (nonatomic) NSString *answer3;
@property (nonatomic) NSString *answer4;
@property (nonatomic) NSString *answerTrue;
@property (nonatomic) NSString *questionAudio;
@property (nonatomic) NSString *answerAudio1;
@property (nonatomic) NSString *answerAudio2;
@property (nonatomic) NSString *answerAudio3;
@property (nonatomic) NSString *answerAudio4;


@end
