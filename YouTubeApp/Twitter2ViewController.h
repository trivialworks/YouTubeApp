//
//  Twitter2ViewController.h
//  YouTubeApp
//
//  Created by Dhirendra Singh on 09/10/12.
//  Copyright (c) 2012 dhirendra@trivialworks.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Twitter2ViewController : UITableViewController{
    
    UITableView *Table;
    NSMutableArray *tblcreated_at;
    NSMutableArray *tblDiscription;
    NSMutableArray *tblText;
    NSMutableArray *tblProgileImage;
    
    NSMutableData * xmlDatas;
    NSMutableString *currentName;
    NSString * currentStringValue;
    

}


-(IBAction)end:(id)sender;

- (void)fetchTweets;
-(void)getTwitterFeeds;

@property(nonatomic,retain)IBOutlet UITableView *Table;
@property(nonatomic,retain) NSString * currentStringValue;

@end
