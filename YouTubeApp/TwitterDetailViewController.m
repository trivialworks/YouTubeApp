//
//  TwitterDetailViewController.m
//  YouTubeApp
//
//  Created by Dhirendra Singh on 09/10/12.
//  Copyright (c) 2012 dhirendra@trivialworks.com. All rights reserved.
//

#import "TwitterDetailViewController.h"

@interface TwitterDetailViewController ()

@end

@implementation TwitterDetailViewController

@synthesize lblDescription,lblSreenName,ProfileImage,lblDateTime,lblText;

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
    
    lblDateTime.text=DateTime;
    lblDescription.text=description;
    lblSreenName.text=screenName;
    
    ProfileImage.image=images;
    
    lblText.text=text;
    [self.webview stringByEvaluatingJavaScriptFromString:text];
    //txtView.dataDetectorTypes=UIDataDetectorTypeLink;
    
	//lblText.dataDetectorTypes = UIDataDetectorTypeLink;

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)back{
    [self dismissModalViewControllerAnimated:YES];
}


-(void)GetTwitterDetail:(NSString *)twitertext ScreenName:(NSString *)ScreenName DateTime:(NSString *)Datetime description:(NSString *)Description image:(UIImage *)image{
    
    
    
    text=twitertext;
    screenName=ScreenName;
    DateTime=Datetime;
    description=Description;
    images=image;
    
    lblDateTime.text=DateTime;
    lblDescription.text=Description;
    lblSreenName.text=ScreenName;
    
    ProfileImage.image=image;
    lblText.text=text;
  
    [self.webview stringByEvaluatingJavaScriptFromString:twitertext];
}

@end
