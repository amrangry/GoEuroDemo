//
//  TransportationData.h
//  TransportationDemo
//
//  Created by Amr Elghadban on 8/8/16.
//  Copyright © 2016 fekretna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TransportationData : NSObject




@property (nonatomic, strong) NSString *id_value;
@property (nonatomic, strong) NSString *provider_logo;
@property (nonatomic, strong) NSNumber *price_in_euros;
@property (nonatomic, strong) NSString *departure_time;
@property (nonatomic, strong) NSString *arrival_time;
@property (nonatomic) NSNumber *number_of_stops;


@property (nonatomic, strong) NSDate *departualDate;
@property (nonatomic, strong)NSDate *arrivalDate;
@property (nonatomic)double arrivalAsDouble;
@property (nonatomic)double departualAsDouble;


-(instancetype)initWithDictionary:(NSDictionary *)Dictionary;



@end
