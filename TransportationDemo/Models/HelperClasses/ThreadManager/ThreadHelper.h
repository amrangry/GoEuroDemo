//
//  ThreadHelper.h
//  MeTV
//
//  Created by Islam Metwally on 3/8/15.
//  Copyright (c) 2015 Islam Metwally. All rights reserved.
//

#import <Foundation/Foundation.h>

void runInUIThread(void (^block) (void));

void runInBackGround(void (^block) (void));

