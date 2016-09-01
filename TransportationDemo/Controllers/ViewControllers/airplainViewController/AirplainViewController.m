//
//  AirplainViewController.m
//  TransportationDemo
//
//  Created by Amr Elghadban on 8/15/16.
//  Copyright © 2016 fekretna. All rights reserved.
//

#import "AirplainViewController.h"
#import "BusViewController.h"
#import "TransportationDemo-Swift.h"
#import "TransportationData.h"
#import "TransportationData+Manager.h"
#import "MBProgressHUD.h"
#import "TimeManager.h"
#import "NSString+Utilites.h"


@implementation AirplainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    
    [TransportationData getDataForURLString:@"https://api.myjson.com/bins/w60i" onSuccess:^(NSMutableArray *results) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
        busArray=results;
        super.arrayOfResults=busArray;
        [tableViewRef reloadData];
    } andFailure:^(NSString *error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
    } ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"TransportationTableViewCell";
    TransportationTableViewCell *cell=[tableViewRef dequeueReusableCellWithIdentifier:CellIdentifier];
    //  NSLog(@" in 2 ");
    
    
    if (!cell) {
        cell = [[TransportationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // cell.selectionStyle = UITableViewCellSelectionStyleNone;
    // cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];

    if (indexPath.row % 2) {
        
        [cell.sepratorView setBackgroundColor:[UIColor colorWithRed:((0.0) / 255.0) green:((116.0) / 255.0) blue:((154) / 255.0) alpha:1.0]];
    }else {
         [cell.sepratorView setBackgroundColor:[UIColor colorWithRed:((235.0) / 255.0) green:((101.0) / 255.0) blue:((29) / 255.0) alpha:1.0]];
    }
    //blue  0 116 154
    // org  235 101 29
    TransportationData *dataModel=[busArray objectAtIndex:indexPath.row];
    
    
    
    
    
    
    
    /*  [dataModel.departure_time stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:[NSString stringWithFormat@"0"]]];
     NSString *arrivalTime = [NSString stringWithFormat:@"%g", dataModel.arrival_time];
     NSString *departureTime = [NSString stringWithFormat:@"%g", dataModel.departure_time]; */
    
    
    cell.departureTimeLbi.text=dataModel.departure_time;
    cell.arrivalTimeLbi.text=dataModel.arrival_time;
    cell.durationTimeLbl.text=@"20 h";
    NSLog(@"strop :%@",dataModel.number_of_stops);
    NSNumber *number_of_stops=[NSNumber numberWithInt:0];
    
    if ([number_of_stops isEqualToNumber:dataModel.number_of_stops]) {
        
        cell.numberOfStopLbi.text=@"Direct";
        cell.numberOfStopImage.image=[UIImage imageNamed:@"Center Direction"];
    }else{
        
        cell.numberOfStopLbi.text=[NSString stringWithFormat:@"%@",dataModel.number_of_stops];
    }
    
    
    [cell.priceImageView setBackgroundColor:[UIColor greenColor]];
    cell.priceImageView.layer.cornerRadius = 10.0;
    cell.priceImageView.layer.masksToBounds = YES;
    cell.priceImageView.layer.allowsEdgeAntialiasing=YES;
    
    NSString *price=[NSString stringWithFormat:@"%@",dataModel.price_in_euros];
    price=[price stringByRoundingNumber:dataModel.price_in_euros andFormater:NSNumberFormatterRoundUp toPositionRightOfDecimal:2 ];
    
    //  cell.priceLbl.text=[NSString stringWithFormat:@"%@%@",price,@"€"];
    cell.priceLbl.text=[NSString stringWithFormat:@"%@",price];
    /*start animating*/
    [cell.imageProgress startAnimating];
    cell.imageProgress.hidden=NO;
    
    NSString *urlString=dataModel.provider_logo;
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url=[NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad
                                            timeoutInterval:60];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
                                  {
                                      if (!error) {
                                          NSString *dataString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                          // NSLog(@"dataString: %@", dataString);
                                          
                                          if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
                                              NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
                                              //NSLog(@"dataTaskWithRequest HTTP status code: %ld", (long)statusCode);
                                              
                                              if(statusCode == 200){
                                                  dispatch_async(dispatch_get_main_queue(),^
                                                                 {
                                                                     if ( error == nil && data ){
                                                                         UIImage *urlImage = [[UIImage alloc] initWithData:data];
                                                                         cell.thumbnilImage.image = urlImage;
                                                                         cell.imageProgress.hidden=YES;
                                                                         [cell.imageProgress stopAnimating];
                                                                     }
                                                                 });
                                              }else if (statusCode==404){
                                                  //  NSLog(@"dataTaskWithRequest error: %@", error);
                                                  
                                                  [self setRandomImageForCellForRowAtIndexPath:indexPath];
                                              }
                                          }
                                      } else{
                                          //  NSLog(@"dataTaskWithRequest error: %@", error);
                                          
                                          [self setRandomImageForCellForRowAtIndexPath:indexPath];
                                      }
                                  }];
    [task resume];
    
    
    return  cell;
}

//This function is where all the magic happens
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //1. Setup the CATransform3D structure
    CATransform3D rotation;
    rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
    rotation.m34 = 1.0/ -600;
    
    
    //2. Define the initial state (Before the animation)
    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
    cell.layer.shadowOffset = CGSizeMake(10, 10);
    cell.alpha = 0;
    
    cell.layer.transform = rotation;
    cell.layer.anchorPoint = CGPointMake(0, 0.5);
    
    
    //3. Define the final state (After the animation) and commit the animation
    [UIView beginAnimations:@"rotation" context:NULL];
    [UIView setAnimationDuration:0.8];
    cell.layer.transform = CATransform3DIdentity;
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    [UIView commitAnimations];
    
}


-(void)setRandomImageForCellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TransportationTableViewCell *cell =  [tableViewRef cellForRowAtIndexPath:indexPath];
    int x= arc4random_uniform(5);
    NSString *imageName=[NSString stringWithFormat:@"bus_%d",x];
    [cell.thumbnilImage setImage:[UIImage imageNamed:imageName]];
    [cell.imageProgress stopAnimating];
    cell.imageProgress.hidden=YES;
}



/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */





bool isPriceOrderAsecendingAirPlain=NO;
- (IBAction)priceBtnPressed:(id)sender {
    
    
    [self setFocusButtonFroSorting:3];
    isPriceOrderAsecendingAirPlain=!isPriceOrderAsecendingAirPlain;
    
    
    if (isPriceOrderAsecendingAirPlain) {
        [sender setBackgroundImage:[UIImage imageNamed:@"arrow_down"]forState:UIControlStateNormal];
        
    }else{
        
        [sender setBackgroundImage:[UIImage imageNamed:@"arrow_up"]forState:UIControlStateNormal];
    }
    NSSortDescriptor* sortOrder = [NSSortDescriptor sortDescriptorWithKey: @"price_in_euros"
                                                                ascending: isPriceOrderAsecendingAirPlain];
    NSArray * sortedArray=  [busArray sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortOrder]];
    busArray=[NSMutableArray arrayWithArray:sortedArray];
    super.arrayOfResults=busArray;
    [tableViewRef reloadData];
}



bool isDeparturalTimeOrederAscendingAirPlain=NO;
- (IBAction)departureTimeBtnPressed:(id)sender {
    
    [self setFocusButtonFroSorting:1];
    isDeparturalTimeOrederAscendingAirPlain=!isDeparturalTimeOrederAscendingAirPlain;
    
    
    if (isDeparturalTimeOrederAscendingAirPlain) {
        [sender setBackgroundImage:[UIImage imageNamed:@"arrow_down"]forState:UIControlStateNormal];
        
    }else{
        
        [sender setBackgroundImage:[UIImage imageNamed:@"arrow_up"]forState:UIControlStateNormal];
    }
    
    
    NSSortDescriptor* sortOrder = [NSSortDescriptor sortDescriptorWithKey: @"departualDate"
                                                                ascending: isDeparturalTimeOrederAscendingAirPlain];
    NSArray * sortedArray=  [busArray sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortOrder]];
    busArray=[NSMutableArray arrayWithArray:sortedArray];
    super.arrayOfResults=busArray;
    [tableViewRef reloadData];
}


bool isArrivalTimeOrderAscendingAirPlain=NO;
- (IBAction)arrivalTimeBtnPressed:(id)sender {
    
    [self setFocusButtonFroSorting:2];
    isArrivalTimeOrderAscendingAirPlain=!isArrivalTimeOrderAscendingAirPlain;
    
    if (isArrivalTimeOrderAscendingAirPlain) {
        [sender setBackgroundImage:[UIImage imageNamed:@"arrow_down"]forState:UIControlStateNormal];
        
    }else{
        
        [sender setBackgroundImage:[UIImage imageNamed:@"arrow_up"]forState:UIControlStateNormal];
    }
    
    NSSortDescriptor* sortOrder = [NSSortDescriptor sortDescriptorWithKey: @"arrivalDate"
                                                                ascending: isArrivalTimeOrderAscendingAirPlain];
    NSArray * sortedArray=  [busArray sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortOrder]];
    busArray=[NSMutableArray arrayWithArray:sortedArray];
    super.arrayOfResults=busArray;
    [tableViewRef reloadData];
    
    
}


-(void)setFocusButtonFroSorting:(int)senderTag{
    
    
    [depFocusView setBackgroundColor:[UIColor whiteColor]];
    [arrivalFocusView setBackgroundColor:[UIColor whiteColor]];
    [priceFocusView setBackgroundColor:[UIColor whiteColor]];
    
    
    [departurBtn setBackgroundImage:[UIImage imageNamed:@"arrow_org"]forState:UIControlStateNormal];
    [arrivalBtn setBackgroundImage:[UIImage imageNamed:@"arrow_org"]forState:UIControlStateNormal];
    [priceBtn setBackgroundImage:[UIImage imageNamed:@"arrow_org"]forState:UIControlStateNormal];
    
    
    
    switch (senderTag) {
        case 1:
            [depFocusView setBackgroundColor:[UIColor colorWithRed:((255.0) / 255.0) green:((128.0) / 255.0) blue:((0.0) / 255.0) alpha:1.0]];
            break;
        case 2:
            [arrivalFocusView setBackgroundColor:[UIColor colorWithRed:((255.0) / 255.0) green:((128.0) / 255.0) blue:((0.0) / 255.0) alpha:1.0]];
            break;
        case 3:
            [priceFocusView setBackgroundColor:[UIColor colorWithRed:((255.0) / 255.0) green:((128.0) / 255.0) blue:((0.0) / 255.0) alpha:1.0]];
            break;
        default:
            break;
    }
    
}






@end
