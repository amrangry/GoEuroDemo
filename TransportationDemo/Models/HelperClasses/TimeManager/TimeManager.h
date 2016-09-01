//
//  TimeManager.h
//  TransportationDemo
//
//  Created by Amr Elghadban on 8/10/16.
//  Copyright © 2016 fekretna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TimeComponets.h"
@interface TimeManager : NSObject


#pragma -mark converters
+(NSDate *) convertStringtoDateWithFormat:(NSString *)format dateString:(NSString *) dateString;
+(TimeComponets *)timeIntervalsForDays:(NSDate *) startDate toDate:(NSDate *) endDate;
+(NSDateComponents *)daysWithinEraFromDate:(NSDate *) startDate toDate:(NSDate *) endDate;
+(NSDateComponents *)deferancesBetween2Dates:(NSDate *) startDate toDate:(NSDate *) endDate;

@end
