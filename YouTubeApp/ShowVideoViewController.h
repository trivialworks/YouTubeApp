//
//  ShowVideoViewController.h
//  YouTubeApp
//
//  Created by Dhirendra Singh on 05/10/12.
//  Copyright (c) 2012 dhirendra@trivialworks.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowVideoViewController : UIViewController{
 IBOutlet UIWebView *webView;
}


//@property(nonatomic,retain)IBOutlet UIWebView *webView;
- (void)embedYouTube:(NSString *)urlString frame:(CGRect)frame;
- (IBAction)back;
@end
