//
//  BaseViewController.h
//  TransportationDemo
//
//  Created by Amr Elghadban on 8/7/16.
//  Copyright © 2016 fekretna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong)  NSMutableArray *arrayOfResults;
@end
