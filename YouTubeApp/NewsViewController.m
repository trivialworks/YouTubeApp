//
//  NewsViewController.m
//  YouTubeApp
//
//  Created by Dhirendra Singh on 17/09/12.
//  Copyright (c) 2012 dhirendra@trivialworks.com. All rights reserved.
//

#import "NewsViewController.h"
#import "NewDetailViewController.h"


@interface NewsViewController ()
-(NSString *) stringByStrippingHTML;
@end

@implementation NewsViewController
@synthesize arrayTitle,pubDate,discription,Table,discriptionHTML,currentStringValue;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
	NSLog(@"loading");
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"53709.jpg"]];

    
    self.Table.backgroundView = tempImageView;
    self.Table.backgroundColor=[UIColor blackColor];
    self.Table.separatorColor=[UIColor colorWithRed:82 green:102 blue:100 alpha:.2f];
    
    arrayTitle=[[NSMutableArray alloc]init];
    pubDate=[[NSMutableArray alloc]init];
    discription=[[NSMutableArray alloc]init];
    discriptionHTML=[[NSMutableArray alloc]init];
    
   xmlDatas=[[NSMutableData alloc]init];
    
    
    
    [super viewDidLoad];
    
    [self getNews];
}

-(void)getNews{
    
    NSString * reqURl=[NSString stringWithFormat:@"https://news.google.co.uk/news/feeds?pz=1&cf=all&ned=uk&hl=en&as_scoring=r&as_maxm=4&q=free+magics+tricks&as_qdr=a&as_drrb=q&as_mind=6&as_minm=3&cf=all&as_maxd=5&output=rss"];
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
    //[s release];
    depth = 0;
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    
    
    
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
    //[currentElement release];
    elementName = [elementName copy];
    
    if ([elementName isEqualToString:@"item"])
    {
        //[currentName release];
        flag=true;
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
    //NSString *str=currentStringValue;
    
    if(flag){
    
	if ([elementName isEqualToString:@"title"])
    {
        //NSLog(@"business  name=%@",currentStringValue);
        [arrayTitle addObject:currentStringValue];
    }
    
    if([elementName isEqualToString:@"description"]){
        //lblBusinessDiscription.text=currentStringValue;
        //NSLog(@"%@",[currentStringValue stringByStrippingHTML]);
        //NSString *strDis=[currentStringValue stringByStrippingHTML];
        NSString *str=  [self flattenHTML:currentStringValue];
        NSLog(@"%@",str);
        [discription addObject:str];
        [discriptionHTML addObject:currentStringValue];
    }
    
    if([elementName isEqualToString:@"pubDate"]){
        //lblBusinessCreatedOn.text=currentStringValue;
        
        [pubDate addObject:currentStringValue];
    }
    }
    

}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 100.0f;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    int a= arrayTitle.count;
    NSLog(@"here i count a %d",a);
    return arrayTitle.count;;
    
}




// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    
   // UILabel* Label = [[UILabel alloc] initWithFrame:CGRectMake(45,2, 250, 23)];
   // UILabel* Label2 = [[UILabel alloc] initWithFrame:CGRectMake(45,25, 250, 23)];
    
    
    
   // Label.numberOfLines=0;
   // Label.textColor=[UIColor blackColor];
   // Label.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(16.0)];
    
   // Label2.textColor=[UIColor grayColor];
    //Label2.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(12.0)];

	//Label.text = [arrayTitle objectAtIndex:indexPath.row];;
   // Label2.text=[discription objectAtIndex:indexPath.row];
 
    
    //[cell addSubview:Label];
    //[cell addSubview:Label2];
    NSString *strDis=[discription objectAtIndex:indexPath.row];
    NSString *trimmedString = [strDis stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    cell.textLabel.numberOfLines=2;
    cell.textLabel.text=[arrayTitle objectAtIndex:indexPath.row];
    cell.textLabel.textColor=[UIColor whiteColor];
    cell.detailTextLabel.numberOfLines=2;
    cell.detailTextLabel.frame=CGRectMake(45, 25, 250, 23);
    cell.detailTextLabel.text=trimmedString;//[discription objectAtIndex:indexPath.row];
    //cell.imageView.image=[UIImage imageNamed:@"news.png"];
    return cell;
}

- (NSString *)flattenHTML:(NSString *)html {
    
    NSScanner *thescanner;
    NSString *text = nil;
    
    thescanner = [NSScanner scannerWithString:html];
    
    while ([thescanner isAtEnd] == NO) {
        
        // find start of tag
        [thescanner scanUpToString:@"<" intoString:NULL] ;
        
        // find end of tag
        [thescanner scanUpToString:@">" intoString:&text] ;
        
        // replace the found tag with a space
        //(you can filter multi-spaces out later if you wish)
        html = [html stringByReplacingOccurrencesOfString:
                [ NSString stringWithFormat:@"%@>", text]
                                               withString:@" "];
        
    } // while //
    
    return html;
    
}
/*
-(NSString *) stringByStrippingHTML {
    NSRange r;
    NSString *s = [[self copy] autorelease];
    while ((r = [s rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString:@""];
    return s; }
 */
//- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath {
    
    
    
//}


- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath {
    NewDetailViewController *newsDetail=[[NewDetailViewController alloc]initWithNibName:@"NewDetailViewController" bundle:nil];
    [self presentModalViewController:newsDetail animated:YES];
    
    [newsDetail GetNewsDetail:[arrayTitle objectAtIndex:indexPath.row] newsDiscription:[discriptionHTML objectAtIndex:indexPath.row] date:[pubDate objectAtIndex:indexPath.row]];
    
}



- (UITableViewCellAccessoryType)tableView:(UITableView *)tv accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath {
	
	return UITableViewCellAccessoryDisclosureIndicator;
}
- (IBAction)back{
    [self dismissModalViewControllerAnimated:YES];
}


@end
