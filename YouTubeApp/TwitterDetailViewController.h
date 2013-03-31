//
//  TwitterDetailViewController.h
//  YouTubeApp
//
//  Created by Dhirendra Singh on 09/10/12.
//  Copyright (c) 2012 dhirendra@trivialworks.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TwitterDetailViewController : UIViewController{
    
    UIImageView *ProfileImage;
    UILabel *lblText;
    UILabel *lblSreenName;
    UILabel *lblDateTime;
    UILabel *lblDescription;
    
    NSString *text;
    NSString *screenName;
    NSString *DateTime;
    NSString *description;
    UIImage *images;

    UIWebView *webview;
    
}




- (IBAction)back;
@property(nonatomic,readonly)IBOutlet UIImageView *ProfileImage;

@property(nonatomic,readonly)IBOutlet UILabel *lblText;
@property(nonatomic,readonly)IBOutlet UILabel *lblSreenName;
@property(nonatomic,readonly)IBOutlet UILabel *lblDateTime;
@property(nonatomic,readonly)IBOutlet UILabel *lblDescription;
@property(nonatomic,retain)IBOutlet UIWebView *webview;


-(void)GetTwitterDetail:(NSString *)twitertext ScreenName:(NSString *)ScreenName DateTime:(NSString *)Datetime description:(NSString *)Description image:(UIImage *)image;
@end
