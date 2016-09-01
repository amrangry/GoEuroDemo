//
//  TimeManager.m
//  TransportationDemo
//
//  Created by Amr Elghadban on 8/10/16.
//  Copyright © 2016 fekretna. All rights reserved.
//

#import "TimeManager.h"
@implementation TimeManager


#pragma -mark converters
+(NSDate *) convertStringtoDateWithFormat:(NSString *)format dateString:(NSString *) dateString{
    
    NSLog(@"%@",dateString);
    
    NSString *dateValue = dateString;//@"01:02:2016-00:00:00";
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSString *formatString = format;//@"yyyy-MM-dd'T'HH:mm:ss.SSS";
    [formatter setDateFormat:formatString];
    formatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    
    NSDate *date = [formatter dateFromString:dateValue];
    
    return date;
    
}


+(NSDateComponents *)daysWithinEraFromDate:(NSDate *) startDate toDate:(NSDate *) endDate
{
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSUInteger unitFlags =NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit |NSHourCalendarUnit| NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    NSDateComponents *components = [gregorian components:unitFlags
                                                fromDate:startDate
                                                  toDate:endDate options:0];
    //    NSInteger *months = [components month];
    //    NSInteger *days = [components day];
    //    NSInteger *minute=[components minute];
    
    
    //    NSTimeInterval secondsBetween = [endDate timeIntervalSinceDate:currentDate];
    //    double numberOfDays = secondsBetween / 86400;
    //    //double minutes = numberOfDays / 3600;
    //    NSLog(@"There are %f days in between the two dates.", numberOfDays);
    return components;
}

+(TimeComponets *)timeIntervalsForDays:(NSDate *) startDate toDate:(NSDate *) endDate
{
    
    
    NSTimeInterval secondsBetween = [endDate timeIntervalSinceDate:startDate];
    int minutes=secondsBetween/60;
    int hours=secondsBetween/(60*60);
    //int days=secondsBetween/(60*60*24);
    int months=secondsBetween/(60*60*24*12);
    int years=secondsBetween/(60*60*24*12*365);
    int days = secondsBetween/86400;
    
    
    TimeComponets *tc=[TimeComponets new];
    tc.minutes=minutes;
    tc.hours=hours;
    tc.months=months;
    tc.years=years;
    tc.days=days;
    
    return tc;
}


+(NSDateComponents *)deferancesBetween2Dates:(NSDate *) startDate toDate:(NSDate *) endDate{
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSUInteger unitFlags =NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit |NSHourCalendarUnit| NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    NSDateComponents *components = [gregorian components:unitFlags
                                                fromDate:startDate
                                                  toDate:endDate options:0];
    return components;
}


@end
