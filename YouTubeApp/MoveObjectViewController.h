//
//  MoveObjectViewController.h
//  YouTubeApp
//
//  Created by Dhirendra Singh on 13/09/12.
//  Copyright (c) 2012 dhirendra@trivialworks.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GDataYouTube.h"
//#import "GDataServiceGoogleYouTube.h"


@interface MoveObjectViewController : UIViewController{
   // GDataFeedYouTubeVideo *feed;
    
    IBOutlet UIViewController *viewController2;
    IBOutlet UIWebView *webView;
    IBOutlet UILabel *title2;
    
    GDataFeedYouTubeVideo *feed;
    GDataDescriptionRecord *descrip;
    
    NSMutableArray *array;
    NSMutableArray *video;
    //NSMutableArray *discription;
    UITableViewCell *tblViewCell;
    UIView *_contentView;
    id _adBannerView;
    BOOL _adBannerViewIsVisible;
    
    UITableView *table;
    UILabel* Label ;
    UILabel* Label2 ;
    UILabel* Label3 ;


}
- (IBAction)back;

//- (void)embedYouTube:(NSString *)urlString frame:(CGRect)frame;
- (IBAction)back;


@property (nonatomic, retain) GDataFeedYouTubeVideo *feed;
//@property (nonatomic, retain) GDataDescriptionRecord *descrip;
@property(nonatomic,retain)NSMutableArray *array;
@property(nonatomic,retain)NSMutableArray *video;

@property(nonatomic,retain)IBOutlet  UITableViewCell *tblViewCell;
@property(nonatomic,retain)IBOutlet UITableView *table; 
@property(nonatomic,retain)IBOutlet UILabel* Label3 ;
@property(nonatomic,retain)IBOutlet UILabel* Label2 ;
@property(nonatomic,retain)IBOutlet UILabel* Label ;

@property (nonatomic, retain) id adBannerView;
@property (nonatomic) BOOL adBannerViewIsVisible;
//@property (nonatomic, retain) GDataFeedYouTubeVideo *feed;
@end
