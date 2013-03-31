//
//  WebViewController.h
//  YouTubeApp
//
//  Created by Dhirendra Singh on 09/10/12.
//  Copyright (c) 2012 dhirendra@trivialworks.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController{
    
    UIWebView *webView;
    NSString *stringUrl;
}
@property(nonatomic, retain)IBOutlet UIWebView *webView;

-(IBAction)GoBack:(id)sender;

-(void)loadUrla:(NSString *)LoadUrl;
@end
