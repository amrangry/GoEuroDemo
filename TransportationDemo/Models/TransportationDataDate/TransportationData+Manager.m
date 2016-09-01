//
//  TransportationData+Manager.m
//  TransportationDemo
//
//  Created by Amr Elghadban on 8/8/16.
//  Copyright © 2016 fekretna. All rights reserved.
//

#import "TransportationData+Manager.h"
#import "ThreadHelper.h"
#import "TimeManager.h"
@implementation TransportationData (Manager)



+(void) getDataForURLString:(NSString *)urlString onSuccess:(void (^)(NSMutableArray * results))success andFailure:(void (^)(NSString *error))failure {
    
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",urlString]];
   
   // NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[url standardizedURL]];
    NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:url
                            cachePolicy:NSURLRequestReturnCacheDataElseLoad
                        timeoutInterval:60];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            //  NSString* newStr = [NSString stringWithUTF8String:[data bytes]];
            
            NSError *jsonError;
            NSDictionary *jsonReturn = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
            
            
            
            if (!jsonError ) {
                
                if ([jsonReturn isKindOfClass:[NSNull class]]) {
                    runInUIThread(^{
                        success(nil);
                    });
                }else{
                    
                    NSMutableArray *results = [[NSMutableArray alloc] init];
                    for (NSDictionary *dict in jsonReturn) {
                        
                        TransportationData *dataModel = [[TransportationData alloc] initWithDictionary:dict];
                        
                        NSDate *departualDate=  [TimeManager convertStringtoDateWithFormat:@"hh:mm" dateString:dataModel.departure_time];
                        NSDate *arrivalDate=  [TimeManager convertStringtoDateWithFormat:@"hh:mm" dateString:dataModel.arrival_time];
                        
                        double arrivalAsDouble=[arrivalDate timeIntervalSince1970]*1000;
                        double departualAsDouble=[departualDate timeIntervalSince1970]*1000;
                        
                        
                        dataModel.arrivalDate=arrivalDate;
                        dataModel.departualDate=departualDate;
                        dataModel.arrivalAsDouble=arrivalAsDouble;
                        dataModel.departualAsDouble=departualAsDouble;
                        
                        
                        [results addObject:dataModel];
                    }
                    
                    runInUIThread(^{
                        success(results);
                    });
                    
                }
            }  else {
                
                runInUIThread(^{
                    if (jsonError)
                        failure(jsonError.localizedDescription);
                    else {
                        success(nil);
                    }
                });
                
            }
        }
        
        else
            runInUIThread(^{
                failure(error.localizedDescription);
            });
    }];
    [task resume];
    
}



@end
