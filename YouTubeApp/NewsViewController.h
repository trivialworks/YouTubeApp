//
//  NewsViewController.h
//  YouTubeApp
//
//  Created by Dhirendra Singh on 17/09/12.
//  Copyright (c) 2012 dhirendra@trivialworks.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsViewController : UIViewController{
    
    NSMutableArray *arrayTitle;
    NSMutableArray *pubDate;
    NSMutableArray *discription;
    NSMutableArray *discriptionHTML;
    
    NSMutableData * xmlDatas;
    NSMutableString *currentName;
    NSString * currentStringValue;
    NSInteger depth;
   
    UITableView *Table;
    
    BOOL flag;
}
@property(nonatomic,retain)NSMutableArray *arrayTitle;
@property(nonatomic,retain)NSMutableArray *pubDate;
@property(nonatomic,retain)NSMutableArray *discription;
@property(nonatomic,retain)NSMutableArray *discriptionHTML;

@property(nonatomic,retain) NSString * currentStringValue;

@property(nonatomic,readonly)IBOutlet  UITableView *Table;

-(void)getNews;
@end
