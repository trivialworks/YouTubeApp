//
//  MoreViewController.h
//  YouTubeApp
//
//  Created by Dhirendra Singh on 06/10/12.
//  Copyright (c) 2012 dhirendra@trivialworks.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoreViewController : UIViewController{
    

    
    NSMutableData * xmlDatas;
    NSMutableString *currentName;
    NSString * currentStringValue;
    
    UITableView *Table;
    NSMutableArray *tblcreated_at;
    NSMutableArray *tblDiscription;
    NSMutableArray *tblText;
    NSMutableArray *tblProgileImage;
    NSMutableArray *tblname;
    
    BOOL flag;
    int a;
   // NSData* data ;
}



- (void)fetchTweets;
-(void)getTwitterFeeds;

@property(nonatomic,retain)IBOutlet UITableView *Table;
@property(nonatomic,retain) NSString * currentStringValue;

@end
