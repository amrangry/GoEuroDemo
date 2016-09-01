//
//  TransportationData.m
//  TransportationDemo
//
//  Created by Amr Elghadban on 8/8/16.
//  Copyright © 2016 fekretna. All rights reserved.
//

#import "TransportationData.h"

@implementation TransportationData






#define Key_id_value @"id_value"
#define Key_provider_logo @"provider_logo"
#define Key_price_in_euros @"price_in_euros"
#define Key_departure_time @"departure_time"
#define Key_arrival_time @"arrival_time"
#define Key_number_of_stops @"number_of_stops"

-(instancetype)initWithDictionary:(NSDictionary *)Dictionary{
    
    self=[super init];
    if (self) {
        NSDictionary *JSONDictionary=Dictionary;
        
        if (JSONDictionary) {
            for (NSString *key in JSONDictionary) {
                if ([key isEqualToString:@"id"]) {
                    NSString *value=[JSONDictionary objectForKey:@"id"];
                    [self setValue:value forKey:@"id_value"];
                }else{
                    [self setValue:[JSONDictionary valueForKey:key] forKey:key];}
            }
            
        }
    }
    
    return self;
}


- (void)encodeWithCoder:(NSCoder *)encoder {
    //Encode properties, other class variables, etc
    
    
    [encoder encodeObject:self.id_value forKey:Key_id_value];
    [encoder encodeObject:self.provider_logo forKey:Key_provider_logo];
    [encoder encodeObject:self.price_in_euros forKey:Key_price_in_euros];
    [encoder encodeObject:self.departure_time forKey:Key_departure_time];
    [encoder encodeObject:self.arrival_time forKey:Key_arrival_time];
    [encoder encodeObject:self.number_of_stops forKey:Key_number_of_stops];
    
    
    
    
}

- (id)initWithCoder:(NSCoder *)decoder {
    
    if((self = [super init])) {
        //decode properties, other class vars
        self.id_value = [decoder decodeObjectForKey:Key_id_value];
        self.provider_logo = [decoder decodeObjectForKey:Key_provider_logo];
        self.price_in_euros= [decoder decodeObjectForKey:Key_price_in_euros];
        self.departure_time= [decoder decodeObjectForKey:Key_departure_time];
        self.arrival_time = [decoder decodeObjectForKey:Key_arrival_time];
        self.number_of_stops = [decoder decodeObjectForKey:Key_number_of_stops];
        
        
    }
    return self;
}


@end
