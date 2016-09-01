//
//  BaseViewController.m
//  TransportationDemo
//
//  Created by Amr Elghadban on 8/7/16.
//  Copyright © 2016 fekretna. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _arrayOfResults=[NSMutableArray new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark  TableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    // Return the number of sections.
 
    if (_arrayOfResults.count>=1) {
        
        tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        tableView.backgroundView.hidden=YES;
        return 1;
        
    } else {
        
        // Display a message when the table is empty
        UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        
        messageLabel.text = @"";//@"There are no results, please try again";
        messageLabel.textColor = [UIColor blackColor];
        messageLabel.numberOfLines = 2;
        messageLabel.textAlignment = NSTextAlignmentCenter;
         messageLabel.font = [UIFont fontWithName:@"Palatino-Italic" size:20];
       // [messageLabel setFont:[UIFont fontWithName:CONST_font2 size:20]];
        
        [messageLabel sizeToFit];
        
        tableView.backgroundView = messageLabel;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    
    return 0;
    //return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_arrayOfResults count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell=[UITableViewCell new];
     NSLog(@" in 1 ");
    return cell;
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   /* shouldNavigateToRoot=NO;
    Fatwa  *fatwa=[archivedFatwaArrayResults objectAtIndex:indexPath.row];
    fatwa.Answer=[fatwa.Answer stringByDecodingHTMLEntities];
    fatwa.Question=[fatwa.Question stringByDecodingHTMLEntities];
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main"
                                                             bundle: nil];
    FatwaDetailsViewController *tabController = [mainStoryboard instantiateViewControllerWithIdentifier: @"FatwaDetailsController"];
    
    tabController.fatwaModel=fatwa;
    
    [self.navigationController pushViewController:tabController animated:YES];
    */
    
}


@end
