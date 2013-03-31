//
//  MoveObjectViewController.m
//  YouTubeApp
//
//  Created by Dhirendra Singh on 13/09/12.
//  Copyright (c) 2012 dhirendra@trivialworks.com. All rights reserved.
//
   //this is comment
#import "MoveObjectViewController.h"
#import "VideoViewController.h"
#import "iAd/ADBannerView.h"
#import <QuartzCore/QuartzCore.h>
#import "ShowVideoViewController.h"
//#import "LocalSearchViewController.h"

@interface MoveObjectViewController (PrivateMethods)
- (GDataServiceGoogleYouTube *)youTubeService;

@end

@implementation MoveObjectViewController
@synthesize adBannerView = _adBannerView,tblViewCell;
@synthesize adBannerViewIsVisible = _adBannerViewIsVisible;
@synthesize feed,array,video,table,Label,Label2,Label3;

//AI39si52gLOd-QxuczZKzBWaD1Jto7wYemVbbq0GNGGY0DdwKsc9MCQr97hB-mTkVcC-YG8qCY_dwKZWr6aaTbMTYcXAIad9gQ
- (void)viewDidLoad {
    NSLog(@"loading");
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"53709.jpg"]];
    //UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"03164.jpg"]];
    //[tempImageView setFrame:self.table.frame]; 
    //self.table.backgroundView=tempImageView;
    
    self.table.backgroundView = tempImageView;
    self.table.backgroundColor=[UIColor blackColor];
    self.table.separatorColor=[UIColor colorWithRed:82 green:102 blue:100 alpha:.2f];
    
    GDataServiceGoogleYouTube *service = [self youTubeService];
    
    NSString *uploadsID = kGDataYouTubeUserFeedIDUploads;
    NSURL *feedURL = [GDataServiceGoogleYouTube youTubeURLForUserID:@"anujsingh115"
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
    //self.descrip=(GDataDescriptionRecord *)aFeed;
    
	[table reloadData];
    

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
    NSLog(@"%d",[[feed entries] count]);
    return [[feed entries] count];
}




// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.
	GDataEntryBase *entry = [[feed entries ] objectAtIndex:indexPath.row];
   // GDataEntryBase *entry2 = [[feed itemsForDescription] objectAtIndex:indexPath.row];
    //GDataDescriptionRecord *disc=[[descrip ]]
	NSString *title = [[entry title] stringValue];
    NSLog(@"%@",[entry XMLElement]);
   
   // NSString *Contents=[[entry content]stringValue];
	NSArray *thumbnails = [[(GDataEntryYouTubeVideo *)entry mediaGroup] mediaThumbnails];
    
                          
    NSString *Contents=[[entry publishedDate]stringValue];
   
    //GDataEntryBase *entry1=[[entry itemsForDescription] objectAtIndex:indexPath.row];
     //NSLog(@"%@",[entry1 title]);
	//cell.textLabel.text = title;
	
	NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[[thumbnails objectAtIndex:0] URLString]]];
	
    Label = [[UILabel alloc] initWithFrame:CGRectMake(110,3, 240, 45)];
    Label2 = [[UILabel alloc] initWithFrame:CGRectMake(110,53, 240, 38)];
    Label3=[[UILabel alloc]initWithFrame:CGRectMake(110, 40, 240, 38)];
    Label.numberOfLines=0;
    Label.textColor=[UIColor redColor];
    Label.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(20.0)];
    
    Label2.textColor=[UIColor grayColor];
    Label2.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(15.0)];
	// Configure the cell.
	
	//NSArray *thumbnails = [[(GDataEntryYouTubeVideo *)entry mediaGroup] mediaThumbnails];
    //tblViewCell.textLabel.text=entry;
	Label.text = title;
    Label2.text=Contents;
    Label3.text=[[entry publishedDate]stringValue];
    Label.backgroundColor=[UIColor clearColor];
    Label2.backgroundColor=[UIColor clearColor];
    Label.textColor=[UIColor whiteColor];
    Label2.textColor=[UIColor orangeColor];
    Label2.font=[UIFont fontWithName:@"Arial" size:(12)];
    
    
    Label3.backgroundColor=[UIColor clearColor];
    Label3.textColor=[UIColor whiteColor];
    Label3.textColor=[UIColor orangeColor];
    Label3.font=[UIFont fontWithName:@"Arial" size:(12)];
    
    
    Label.font = [UIFont fontWithName:@"Helvetica-Bold" size:(14.0)];
    
    cell.detailTextLabel.text=Contents;
    cell.textLabel.textColor=[UIColor whiteColor];
    cell.textLabel.text=title;
    cell.imageView.image = [UIImage imageWithData:data];
    //  [cell.imageView setHighlighted:YES];
   // [cell addSubview:Label];
   //[cell addSubview:Label2];
    //[cell addSubview:Label3];
    
    return cell;
}

- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath {
    
    GDataEntryBase *entry2 = [[feed entries] objectAtIndex:indexPath.row];
    NSArray *contents = [[(GDataEntryYouTubeVideo *)entry2 mediaGroup] mediaContents];
    
    title2.text = [[entry2 title] stringValue];
    
    
    ShowVideoViewController *showVideo=[[ShowVideoViewController alloc]init];
    [self presentModalViewController:showVideo animated:YES];
    //[showVideo embedYouTube:[NSURL URLWithString:[[contents objectAtIndex:0] URLString]];
    [showVideo embedYouTube:[NSURL URLWithString:[[contents objectAtIndex:0] URLString]]
                 frame:CGRectMake(70, 100, 200, 200)];
    
}

//@implementation MyTubeAppController (Private)
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

- (IBAction)back{
    [self dismissModalViewControllerAnimated:YES];
}


- (void)dealloc {
    [super dealloc];
}



@end
