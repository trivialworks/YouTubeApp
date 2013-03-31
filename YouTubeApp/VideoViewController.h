//
//  VideoViewController.h
//  YouTubeApp
//
//  Created by Dhirendra Singh on 17/09/12.
//  Copyright (c) 2012 dhirendra@trivialworks.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GDataYouTube.h"
//#import "GDataServiceGoogleYouTube.h"
#import "GDataServiceGoogleYouTube.h"
@interface VideoViewController : UIViewController{
    
    IBOutlet UIViewController *viewController2;
    IBOutlet UIWebView *webView;
    IBOutlet UILabel *title2;
    GDataFeedYouTubeVideo *feed;
    IBOutlet UITableView *tblView;
}
- (void)embedYouTube:(NSString *)urlString frame:(CGRect)frame;
- (IBAction)back;


@property (nonatomic, retain) GDataFeedYouTubeVideo *feed;
@end
