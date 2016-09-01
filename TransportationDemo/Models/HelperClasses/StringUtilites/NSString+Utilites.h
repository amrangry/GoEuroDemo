//
//  NSString+Utilites.h
//  TransportationDemo
//
//  Created by Amr Elghadban on 8/11/16.
//  Copyright © 2016 fekretna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define TrimString( object ) [object stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]

@interface NSString (Utilites)


-(void) show:(id)sender;
- (NSString *)stringByRoundingNumber:(NSNumber *)number andFormater:(NSNumberFormatterRoundingMode)roundingMode
            toPositionRightOfDecimal:(NSUInteger)position;



/*
 
 [aNumber stringByRounding:NSNumberFormatterRoundUp toPositionRightOfDecimal:2];
 I can use it to round to integers by passing in 0 as the second parameter:
 
 [aNumber stringByRounding:NSNumberFormatterRoundPlain toPositionRightOfDecimal:0];
 
 
 */
@end
