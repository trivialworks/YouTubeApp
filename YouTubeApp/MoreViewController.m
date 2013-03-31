//
//  MoreViewController.m
//  YouTubeApp
//
//  Created by Dhirendra Singh on 06/10/12.
//  Copyright (c) 2012 dhirendra@trivialworks.com. All rights reserved.
//

#import "MoreViewController.h"
#import "TwitterDetailViewController.h"


@interface MoreViewController ()

@end

@implementation MoreViewController
@synthesize Table,currentStringValue;
NSMutableArray *arrayTweets;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    flag=false;
    [super viewDidLoad];
    
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"53709.jpg"]];
    //UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"03164.jpg"]];
    //[tempImageView setFrame:self.table.frame]; 
    //self.table.backgroundView=tempImageView;
    
    Table.backgroundView = tempImageView;
    Table.backgroundColor=[UIColor blackColor];
    Table.separatorColor=[UIColor colorWithRed:82 green:102 blue:100 alpha:.2f];
    //tweets=[[NSMutableArray alloc]init];
    //[tweets addObject:@"hello"];
    //[self fetchTweets];
    
    tblcreated_at=[[NSMutableArray alloc]init];
    tblDiscription=[[NSMutableArray alloc]init];
    tblProgileImage=[[NSMutableArray alloc]init];
    tblText=[[NSMutableArray alloc]init];
    tblname=[[NSMutableArray alloc]init];

    
    arrayTweets=[[NSMutableArray alloc]init];
    
   xmlDatas=[[NSMutableData alloc]init];
    [self getTwitterFeeds];
}




-(void)getTwitterFeeds{
    
    NSString * reqURl=[NSString stringWithFormat:@"http://api.twitter.com/1/statuses/user_timeline/freemagictricks.xml"];
	NSLog(@"Url : %@",reqURl);
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:reqURl]];
    NSURLConnection *conn=[[NSURLConnection alloc] initWithRequest:request delegate:self ];
    if (conn)
    {
        NSLog(@"connction successful");
    }
    else
    {
        NSLog(@"connction faild");
    }
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    //NSLog(@"%@",  [[NSString alloc] initWithData:xmlData encoding:NSUTF8StringEncoding] );
    
  	@try
    {
        //[spinner stopAnimating];
        NSLog(@"connection closed done!");
        NSString *xml = [[NSString alloc] initWithData:xmlDatas encoding:NSUTF8StringEncoding];
        NSData *data = [xml dataUsingEncoding:NSUTF8StringEncoding];
        NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:data];
        [xmlParser setDelegate:self];
        BOOL success = [xmlParser parse];
        if(success)
            NSLog(@"No Errors");
        // {  arr_bannerData=(NSMutableArray*)[[AdBannerSingleton sharedMySingleton] sayHello];}
        //NSLog(@"arr bannerdata=%@",arr_bannerData );}
        
        else
            NSLog(@"Error Error Error!!!");
        //[connection release];
        //[self.tblSimpleTable reloadData];
    }
    @catch (NSException *exception)
    {
        NSLog(@"exception=%@",exception.reason);
    }
   [Table reloadData];
}

#pragma mark -
#pragma mark <UITableViewDelegate, UITableViewDataSource> Methods

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	
	NSLog(@"Failed with error");
	
}
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    NSLog(@"Error=%@",parseError);
    
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
	
    
}

-   (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)theData
{
	
	NSLog(@"%d",[theData length]);
	[xmlDatas appendData:theData];
    NSLog(@"xmlData for Offer : %d",[xmlDatas length]);
    NSString *s = [[NSString alloc] initWithData:xmlDatas encoding:NSASCIIStringEncoding];
    [s release];
   // depth = 0;
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    
    
    
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
    
    elementName = [elementName copy];
    
    if ([elementName isEqualToString:@"item"])
    {
      
        
        currentName = [[NSMutableString alloc] init];
    }
	currentStringValue =@"";
    
    
    
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	currentStringValue = [currentStringValue stringByAppendingString:string];
    
}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
  
        if ([elementName isEqualToString:@"created_at"])
        {
            
            [tblcreated_at addObject:currentStringValue];
        }
        
        if([elementName isEqualToString:@"description"]){
            [tblDiscription addObject:currentStringValue];
        }
        
        if([elementName isEqualToString:@"text"]){
            
            [tblText addObject:currentStringValue];
        
        }
    if([elementName isEqualToString:@"profile_image_url"]){
        
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:currentStringValue]]];
        
        [tblProgileImage addObject:image];
    }
    if([elementName isEqualToString:@"name"]){
        
        [tblname addObject:currentStringValue];
    }
  
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 70.0f;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"Print twitter: %d",tblText.count);
    return tblText.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TweetCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    //NSDictionary *tweet = [arrayTweets objectAtIndex:indexPath.row];
    
    
    cell.textLabel.textColor=[UIColor whiteColor];
    //cell.indentationLevel = cell.indentationLevel + 1;
    cell.textLabel.text = [tblText objectAtIndex:indexPath.row];
    //cell.textLabel.lineBreakMode=YES;
    cell.textLabel.numberOfLines=2;
    cell.detailTextLabel.text = [tblcreated_at objectAtIndex:indexPath.row];
    cell.imageView.image=[tblProgileImage objectAtIndex:indexPath.row];
    
    return cell;
    
}

- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath {
    
    TwitterDetailViewController *showVideo=[[TwitterDetailViewController alloc]initWithNibName:@"TwitterDetailViewController" bundle:nil];
    
    
    
    
    [self presentModalViewController:showVideo animated:YES];
   [showVideo GetTwitterDetail:[tblText objectAtIndex:indexPath.row] ScreenName:[tblname objectAtIndex:indexPath.row] DateTime:[tblcreated_at objectAtIndex:indexPath.row] description:[tblDiscription objectAtIndex:indexPath.row] image:[tblProgileImage objectAtIndex:indexPath.row]];
    [showVideo release];
    
   
    
    
}



@end
