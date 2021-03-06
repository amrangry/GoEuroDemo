//
//  BusViewController.h
//  TransportationDemo
//
//  Created by Amr Elghadban on 8/7/16.
//  Copyright © 2016 fekretna. All rights reserved.
//

#import "BaseViewController.h"

@interface BusViewController : BaseViewController{


    __weak IBOutlet UITableView *busTableView ;
    
    
    __weak IBOutlet UIView *depFocusView;
    __weak IBOutlet UIView *arrivalFocusView;
    __weak IBOutlet UIView *priceFocusView;
    
    
    NSMutableArray *busArray;
    
    
    
    __weak IBOutlet UIButton *departurBtn;
    
    __weak IBOutlet UIButton *arrivalBtn;
    
    __weak IBOutlet UIButton *priceBtn;
    
    
    
    
}

- (IBAction)priceBtnPressed:(id)sender;
- (IBAction)departureTimeBtnPressed:(id)sender;
- (IBAction)arrivalTimeBtnPressed:(id)sender;

@end
