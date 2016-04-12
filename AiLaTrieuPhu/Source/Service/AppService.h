//
//  AppService.h
//  AiLaTrieuPhu
//
//  Created by DatDV on 4/11/16.
//  Copyright (c) 2016 amb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"
#import "config.h"

@interface AppService : NSObject
+ (NSDictionary*) getDicFromUrlString:(NSString*)urlString;
+ (NSArray *) getQuestionWithCategory: (NSString *)category level: (NSString *)level limit: (NSString *)limit;



@end
