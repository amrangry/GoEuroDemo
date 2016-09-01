//
//  NSString+Utilites.m
//  TransportationDemo
//
//  Created by Amr Elghadban on 8/11/16.
//  Copyright © 2016 fekretna. All rights reserved.
//

#import "NSString+Utilites.h"

@implementation NSString (Utilites)



- (NSString *)stringByRoundingNumber:(NSNumber *)number andFormater:(NSNumberFormatterRoundingMode)roundingMode
      toPositionRightOfDecimal:(NSUInteger)position
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setMaximumFractionDigits:position];
    [formatter setRoundingMode:roundingMode];
    NSString *numberString = [formatter stringFromNumber:number];
    return numberString;
}



-(void) show:(id)sender{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:self preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okay = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:okay];
    [sender presentViewController:alert animated:YES completion:nil];
}
@end
