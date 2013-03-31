//
//  TricksViewController.m
//  YouTubeApp
//
//  Created by Dhirendra Singh on 17/09/12.
//  Copyright (c) 2012 dhirendra@trivialworks.com. All rights reserved.
//

#import "TricksViewController.h"

@interface TricksViewController ()

@end

@implementation TricksViewController
@synthesize array,video,discription,table;
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
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (void)viewDidLoad {
	NSLog(@"loading");
    
    array=[[NSMutableArray alloc]init];
    video=[[NSMutableArray alloc]init];
    discription=[[NSMutableArray alloc]init];
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"53709.jpg"]];
    //UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"03164.jpg"]];
    //[tempImageView setFrame:self.table.frame]; 
    //self.table.backgroundView=tempImageView;
    
    self.table.backgroundView = tempImageView;
    self.table.backgroundColor=[UIColor blackColor];
    self.table.separatorColor=[UIColor colorWithRed:82 green:102 blue:100 alpha:.2f];
    
    [discription addObject:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. "];
    [discription addObject:@"Sed laoreet nulla eget libero ultricies vel mollis turpis feugiat."];
    [discription addObject:@"Mauris commodo tincidunt venenatis."];
    [discription addObject:@"Morbi massa metus, feugiat at condimentum a, auctor et sapien. "];
    [discription addObject:@"Donec non nibh lectus, ut convallis ipsum. "];
    [discription addObject:@"Aenean nulla orci, pulvinar sit amet bibendum sit amet,"];
    [discription addObject:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit"];
    
    [array addObject:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit"];
    [array addObject:@"Aenean nulla orci, pulvinar sit amet bibendum sit amet,"];
    [array addObject:@"Donec non nibh lectus, ut convallis ipsum. "];
    [array addObject:@"Morbi massa metus, feugiat at condimentum a, auctor et sapien. "];
    [array addObject:@"Mauris commodo tincidunt venenatis."];
    [array addObject:@"Sed laoreet nulla eget libero ultricies vel mollis turpis feugiat."];
    [array addObject:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. "];
    
    
    [video addObject:@"Tricks.png"];
    [video addObject:@"Tricks.png"];
    [video addObject:@"Tricks.png"];
    [video addObject:@"Tricks.png"];
    [video addObject:@"Tricks.png"];
    [video addObject:@"Tricks.png"];
    [video addObject:@"Tricks.png"];
    
    
    
    [super viewDidLoad];	
}




#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 95.0f;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    int a= array.count;
    NSLog(@"here i count a %d",a);
    return array.count;;
    
}




// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    UILabel* Label = [[UILabel alloc] initWithFrame:CGRectMake(50,8, 240, 45)];
    UILabel* Label2 = [[UILabel alloc] initWithFrame:CGRectMake(50,53, 240, 38)];
    Label.numberOfLines=0;
    Label.textColor=[UIColor redColor];
    Label.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(20.0)];
    
    Label2.textColor=[UIColor grayColor];
    Label2.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(15.0)];
	// Configure the cell.
	NSString *entry = [array objectAtIndex:indexPath.row];
	NSString *title =entry;
	//NSArray *thumbnails = [[(GDataEntryYouTubeVideo *)entry mediaGroup] mediaThumbnails];
    //tblViewCell.textLabel.text=entry;
	
    Label2.text=[discription objectAtIndex:indexPath.row];
    
    Label.backgroundColor=[UIColor clearColor];
    Label2.backgroundColor=[UIColor clearColor];
    
    Label.text = title;
    
    Label.textColor=[UIColor whiteColor];
    Label2.textColor=[UIColor orangeColor];
    Label2.font=[UIFont fontWithName:@"Arial" size:(12)];
    Label.font = [UIFont fontWithName:@"Helvetica-Bold" size:(14.0)];
    //  [cell.imageView setHighlighted:YES];
    [cell addSubview:Label];
    [cell addSubview:Label2];
	cell.imageView.image=[UIImage imageNamed:[video objectAtIndex:indexPath.row]];
    
    
    
    return cell;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
}
//- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath {
    
    
    
//}
- (UITableViewCellAccessoryType)tableView:(UITableView *)tv accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath {
	
	return UITableViewCellAccessoryDisclosureIndicator;
}
- (IBAction)back{
    [self dismissModalViewControllerAnimated:YES];
}



@end
