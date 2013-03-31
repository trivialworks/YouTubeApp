//
//  ShowVideoViewController.m
//  YouTubeApp
//
//  Created by Dhirendra Singh on 05/10/12.
//  Copyright (c) 2012 dhirendra@trivialworks.com. All rights reserved.
//

#import "ShowVideoViewController.h"

@interface ShowVideoViewController ()

@end

@implementation ShowVideoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)embedYouTube:(NSString *)urlString frame:(CGRect)frame {
   
	NSString *embedHTML = @"\
    <html><head>\
	<style type=\"text/css\">\
	body {\
	background-color: transparent;\
	color: white;\
	}\
	</style>\
	</head><body style=\"margin:0\">\
    <embed id=\"yt\" src=\"%@\" type=\"application/x-shockwave-flash\" \
	width=\"%0.0f\" height=\"%0.0f\"></embed>\
    </body></html>";
	NSString *html = [NSString stringWithFormat:embedHTML, urlString, webView.frame.size.width, frame.size.height];
	[webView loadHTMLString:html baseURL:nil];
}

- (IBAction)back{
    [self dismissModalViewControllerAnimated:YES];
}
@end
