 //
//  NewDetailViewController.m
//  YouTubeApp
//
//  Created by Dhirendra Singh on 09/10/12.
//  Copyright (c) 2012 dhirendra@trivialworks.com. All rights reserved.
//

#import "NewDetailViewController.h"
#import "WebViewController.h"

@interface NewDetailViewController ()

@end

@implementation NewDetailViewController
@synthesize lblTitle,webView,lblDate;
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
    
    webView.delegate = self;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)GetNewsDetail:(NSString *)NewsTitle newsDiscription:(NSString *)newsDiscription date:(NSString *)date{
    
    lblTitle.text=NewsTitle;
    
    [webView loadHTMLString:newsDiscription baseURL:nil];
    
    lblDate.text=date;
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
   
    /*
    NSLog(@"expected:%d, got:%d", UIWebViewNavigationTypeLinkClicked, navigationType);
    
    NSURL *url = request.URL;
	NSString *urlString = url.absoluteString;
    if(urlString!=@""||urlString!=nil){
	NSLog(@"%@",urlString);
	
    WebViewController *webViewControl=[[WebViewController alloc]initWithNibName:@"WebViewController" bundle:nil];
     [webViewControl loadUrla:urlString];
    [self presentModalViewController:webViewControl animated:YES];
   
         return YES;
    }else{
        
         return NO;
    }
         return YES;
    }else{
        
        //return NO;
    }
   */
    if (navigationType == UIWebViewNavigationTypeLinkClicked) {
    webView.frame=CGRectMake(6, 51, 308, 664);
    lblDate.hidden=YES;
    lblTitle.hidden=YES;
    }
//return NO;


}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    //[[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad
    if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation))
    {
        webView.frame=CGRectMake(6, 100, 500, 664);
        
    }else{
        
        webView.frame=CGRectMake(6, 51, 308, 664);
    }
    
}

-(IBAction)GOBack:(id)sender{
    
     [self dismissModalViewControllerAnimated:YES];
}
@end
