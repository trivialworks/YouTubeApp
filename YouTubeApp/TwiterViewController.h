//
//  TwiterViewController.h
//  YouTubeApp
//
//  Created by Dhirendra Singh on 17/09/12.
//  Copyright (c) 2012 dhirendra@trivialworks.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TwiterViewController : UIViewController{
    
    NSMutableArray *array;
    NSMutableArray *video;
       NSMutableArray *discription;
    UITableView *table;
    
     NSMutableArray *tweets;
}
@property(nonatomic,retain)NSMutableArray *array;
@property(nonatomic,retain)NSMutableArray *video;
@property(nonatomic,retain)NSMutableArray *discription;
@property(nonatomic,retain)IBOutlet UITableView *table;


- (void)fetchTweets;
@end
