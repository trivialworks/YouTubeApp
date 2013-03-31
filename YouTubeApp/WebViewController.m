//
//  WebViewController.m
//  YouTubeApp
//
//  Created by Dhirendra Singh on 09/10/12.
//  Copyright (c) 2012 dhirendra@trivialworks.com. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

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
    NSURL *url = [NSURL URLWithString:stringUrl];
    NSURLRequest *httpReq = [NSURLRequest requestWithURL:url];
    
    [webView loadRequest:httpReq];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)GoBack:(id)sender{
    
    [self dismissModalViewControllerAnimated:YES];
}

-(void)loadUrla:(NSString *)LoadUrl{
    stringUrl=LoadUrl;
    NSURL *url = [NSURL URLWithString:stringUrl];
    NSURLRequest *httpReq = [NSURLRequest requestWithURL:url];
    
    //[webView loadRequest:httpReq];
}
@end
