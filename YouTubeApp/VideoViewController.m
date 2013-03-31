//
//  VideoViewController.m
//  YouTubeApp
//
//  Created by Dhirendra Singh on 17/09/12.
//  Copyright (c) 2012 dhirendra@trivialworks.com. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()
- (GDataServiceGoogleYouTube *)youTubeService;
@end

@implementation VideoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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


@synthesize feed;

- (void)viewDidLoad {
	NSLog(@"loading");
   
    //UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"03164.jpg"]];
    //[tempImageView setFrame:self.table.frame]; 
    //self.table.backgroundView=tempImageView;
    
    
    
	GDataServiceGoogleYouTube *service = [self youTubeService];
    
	NSString *uploadsID = kGDataYouTubeUserFeedIDUploads;
	NSURL *feedURL = [GDataServiceGoogleYouTube youTubeURLForUserID:@"BmcCarmen"
														 userFeedID:uploadsID];
	
	[service fetchFeedWithURL:feedURL
                     delegate:self
            didFinishSelector:@selector(request:finishedWithFeed:error:)];
    
    [super viewDidLoad];	
}

- (void)request:(GDataServiceTicket *)ticket
finishedWithFeed:(GDataFeedBase *)aFeed
          error:(NSError *)error {
    
	self.feed = (GDataFeedYouTubeVideo *)aFeed;
    
	//[self.tableView reloadData];
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 70.0f;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[feed entries] count];
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
	NSString *html = [NSString stringWithFormat:embedHTML, urlString, frame.size.width, frame.size.height];
	[webView loadHTMLString:html baseURL:nil];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.
	GDataEntryBase *entry = [[feed entries] objectAtIndex:indexPath.row];
	NSString *title = [[entry title] stringValue];
	NSArray *thumbnails = [[(GDataEntryYouTubeVideo *)entry mediaGroup] mediaThumbnails];
    
	cell.textLabel.text = title;
	
	NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[[thumbnails objectAtIndex:0] URLString]]];
	cell.imageView.image = [UIImage imageWithData:data];
	
    return cell;
}
- (UITableViewCellAccessoryType)tableView:(UITableView *)tv accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath {
	
	return UITableViewCellAccessoryDisclosureIndicator;
}
- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath {
    
    GDataEntryBase *entry2 = [[feed entries] objectAtIndex:indexPath.row];
    NSArray *contents = [[(GDataEntryYouTubeVideo *)entry2 mediaGroup] mediaContents];
    
    title2.text = [[entry2 title] stringValue];
    
    [self presentModalViewController:viewController2 animated:YES];
    
    [self embedYouTube:[NSURL URLWithString:[[contents objectAtIndex:0] URLString]]
                 frame:CGRectMake(70, 100, 200, 200)];
    
}
- (IBAction)back{
    [self dismissModalViewControllerAnimated:YES];
}


//- (void)dealloc {
// [super dealloc];
//}


- (GDataServiceGoogleYouTube *)youTubeService {
	static GDataServiceGoogleYouTube* _service = nil;
	
	if (!_service) {
		_service = [[GDataServiceGoogleYouTube alloc] init];
		
		[_service setUserAgent:@"AppWhirl-UserApp-1.0"];
		//[_service setShouldCacheDatedData:YES];
		[_service setServiceShouldFollowNextLinks:YES];
	}
	
	// fetch unauthenticated
	[_service setUserCredentialsWithUsername:nil
                                    password:nil];
	
	return _service;
}



@end
