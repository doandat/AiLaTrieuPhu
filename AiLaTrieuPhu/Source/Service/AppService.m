//
//  AppService.m
//  AiLaTrieuPhu
//
//  Created by DatDV on 4/11/16.
//  Copyright (c) 2016 amb. All rights reserved.
//

#import "AppService.h"

@implementation AppService

+(NSDictionary*)getDicFromUrlString:(NSString *)urlString{
    NSError *err = nil;
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url options:NSDataReadingMappedAlways error:&err];
    if (err) {
        return nil;
    }
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error: &err];
    if (err) {
        return nil;
    }
    return dic;
}

+ (NSArray *) getQuestionWithCategory: (NSString *)category level: (NSString *)level limit: (NSString *)limit{
    NSMutableArray *arrQuestion = [[NSMutableArray alloc]init];
    
    NSString *stringUrlRequest = [NSString stringWithFormat:@"%@?%@=%@&%@=%@&%@=%@&%@=%@&%@=%@",URL_GET_QUESTION,PAR_APP_ID,V_APP_ID,PAR_TYPE,V_TYPE,PAR_CATEGORY,category,PAR_LEVEL,level,PAR_LIMIT,limit];
    NSLog(@"stringUrlRequest:%@",stringUrlRequest);
    NSDictionary *dictionary = [self getDicFromUrlString:stringUrlRequest];
    if(dictionary){
        NSInteger status = [[dictionary objectForKey:K_STATUS] integerValue];
        if (status == 0) {
            NSLog(@"Error:%@",[dictionary objectForKey:K_MESSAGE]);
        }else{
            /**
             *   get data successful
             */
            NSDictionary *dicArrQuestion = [dictionary objectForKey:K_DATA];
            if (dicArrQuestion) {
                for (NSDictionary *dicQuestion in dicArrQuestion) {
                    Question *question = [Question new];
                    question.question =     [dicQuestion objectForKey:K_QUESTION];
                    question.answer1 =      [dicQuestion objectForKey:K_ANSWER_1];
                    question.answer2 =      [dicQuestion objectForKey:K_ANSWER_2];
                    question.answer3 =      [dicQuestion objectForKey:K_ANSWER_3];
                    question.answer4 =      [dicQuestion objectForKey:K_ANSWER_4];
                    question.answerTrue =   [dicQuestion objectForKey:K_ANSWER_TRUE];
                    question.answerAudio1 = [dicQuestion objectForKey:K_ANSWER_1_AUDIO];
                    question.answerAudio2 = [dicQuestion objectForKey:K_ANSWER_2_AUDIO];
                    question.answerAudio3 = [dicQuestion objectForKey:K_ANSWER_3_AUDIO];
                    question.answerAudio4 = [dicQuestion objectForKey:K_ANSWER_4_AUDIO];
                    
                    [arrQuestion addObject:question];
                }

            }
            NSLog(@"dicArrQuestion:%@",dicArrQuestion);
            

        }
    }
    
    
    
    return arrQuestion;
    
}


@end
