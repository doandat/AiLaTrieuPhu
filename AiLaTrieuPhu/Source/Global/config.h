//
//  config.h
//  ThiepMung
//
//  Created by Doan Dat on 3/11/16.
//  Copyright © 2016 Amobi. All rights reserved.
//

#ifndef config_h
#define config_h


//URL

#define URL_HOST                @"http://content.amobi.vn/"
#define URL_GET_QUESTION        @"http://content.amobi.vn/api/quizgame"



// parameters

#define PAR_APP_ID              @"app_id"
#define PAR_TYPE                @"type"
#define PAR_LEVEL               @"level"
#define PAR_CATEGORY            @"category"
#define PAR_LIMIT               @"limit"
#define PAR_USER                @"user_name"
#define PAR_PASSWORD            @"password"

#define V_APP_ID                @"832799120072886"
#define V_TYPE                  @"get-data"
#define V_USER                  @"amobi"
#define V_PASSWORD              @"amobi@#123"

//Key
#define K_STATUS                @"status"
#define K_MESSAGE               @"message"
#define K_DATA                  @"data"
#define K_QUESTION              @"question"
#define K_ANSWER_1              @"answer_1"
#define K_ANSWER_2              @"answer_2"
#define K_ANSWER_3              @"answer_3"
#define K_ANSWER_4              @"answer_4"
#define K_ANSWER_TRUE           @"answer_true"
#define K_QUESTION_AUDIO        @"question_audio"
#define K_ANSWER_1_AUDIO        @"answer_1_audio"
#define K_ANSWER_2_AUDIO        @"answer_2_audio"
#define K_ANSWER_3_AUDIO        @"answer_3_audio"
#define K_ANSWER_4_AUDIO        @"answer_4_audio"


//backgroudcolor
#define NAVIGATIONBAR_COLOR  [UIColor colorWithRed:2/255.0 green:136/255.0 blue:209/255.0 alpha:1.0f]
#define VIEW_COLOR  [UIColor colorWithRed:3/255.0 green:169/255.0 blue:245/255.0 alpha:1.0f]
#define SELECTED_COLOR  [UIColor colorWithRed:40/255.0 green:169/255.0 blue:245/255.0 alpha:1.0f]

#define SEPARATOR_COLOR  [UIColor colorWithRed:27/255.0f green:156/255.0f blue:222/255.0f alpha:1.0f]

//image
#define IMAGE_BACKGROUND_ANSWER     [UIImage imageNamed:@"dialog_btn_0.png"]
#define IMAGE_ANSWER_TRUE_1         [UIImage imageNamed:@"dialog_btn_0.png"]
#define IMAGE_ANSWER_TRUE_2         [UIImage imageNamed:@"dialog_btn_1.png"]
#define IMAGE_ANSWER_FAIL           [UIImage imageNamed:@"btn_answer_fail.png"]



////
#define IMAGE_BACK                  [UIImage imageNamed:@"btn_back.png"]
#define IMAGE_CLOSE                 [UIImage imageNamed:@"close.png"]
#define IMAGE_FAVORITE              [UIImage imageNamed:@"favorite.png"]
#define IMAGE_FAVORITED             [UIImage imageNamed:@"favorited.png"]
#define IMAGE_CAMERA                [UIImage imageNamed:@"camera.png"]
#define IMAGE_ICON_DEFAUL           [UIImage imageNamed:@"icon_defaul.png"]
#define IMAGE_ADD_PICTURE           [UIImage imageNamed:@"addpicture.png"]
#define IMAGE_LIBRARY               [UIImage imageNamed:@"library.png"]
#define IMAGE_RELOAD                [UIImage imageNamed:@"reload.png"]
//#define IMAGE_BUTTON_TAKE_NOW_RESET [UIImage imageNamed:@"btn_reset_1"]
//#define IMAGE_ICON_CALENDAR_WHITE   [UIImage imageNamed:@"icon_calendar_white"]
//#define IMAGE_ICON_PILL_WHITE       [UIImage imageNamed:@"icon_pill_white"]
//#define IMAGE_ICON_NOTIFICATION     [UIImage imageNamed:@"icon_notification"]

//FONT
#define FONT_ROBOTO_MEDIUM(z)  [UIFont fontWithName:@"Roboto-Regular" size:(z)]
#define FONT_ROBOTO_REGULAR(z)  [UIFont fontWithName:@"Roboto-Regular" size:(z)]


#endif /* config_h */
