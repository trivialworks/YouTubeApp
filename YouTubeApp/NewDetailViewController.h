//
//  NewDetailViewController.h
//  YouTubeApp
//
//  Created by Dhirendra Singh on 09/10/12.
//  Copyright (c) 2012 dhirendra@trivialworks.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewDetailViewController : UIViewController{
    
    UILabel *lblTitle;
    UILabel *lblDate;
    UIWebView *webView;
    
}

@property(nonatomic,retain)IBOutlet UILabel *lblTitle;
@property(nonatomic,retain)IBOutlet UILabel *lblDate;
@property(nonatomic,retain)IBOutlet UIWebView *webView;

-(void)GetNewsDetail:(NSString *)NewsTitle newsDiscription:(NSString *)newsDiscription date:(NSString *)date;


-(IBAction)GOBack:(id)sender;
@end
