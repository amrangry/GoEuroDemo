//
//  TransportationData+Manager.h
//  TransportationDemo
//
//  Created by Amr Elghadban on 8/8/16.
//  Copyright © 2016 fekretna. All rights reserved.
//

#import "TransportationData.h"

@interface TransportationData (Manager)
+(void) getDataForURLString:(NSString *)urlString onSuccess:(void (^)(NSMutableArray * results))success andFailure:(void (^)(NSString *error))failure;
@end
