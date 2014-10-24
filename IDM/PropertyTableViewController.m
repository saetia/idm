//
//  PropertyTableViewController.m
//  IDM
//
//  Created by Joel Glovacki on 10/15/14.
//  Copyright (c) 2014 Company B. All rights reserved.
//

#import "PropertyTableViewController.h"
#import "PropertyTableViewCell.h"
#import "PropertyDetailViewController.h"
#import "Event.h"

@interface PropertyTableViewController ()

@end

@implementation PropertyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    id delegate = [[UIApplication sharedApplication] delegate];
    self.managedObjectContext = [delegate managedObjectContext];

    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][0];

    if (![sectionInfo numberOfObjects]) [self seedData];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        [NSFetchedResultsController deleteCacheWithName:@"Master"];
        self.fetchedResultsController = nil;
    }
    return self;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    return [sectionInfo numberOfObjects];
}


- (void)configureCell:(PropertyTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
    NSManagedObject *object = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.name.text = [[object valueForKey:@"name"] description];
    
    cell.backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:[[object valueForKey:@"name"] description]] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0]];
    
    UIView *background = [[UIView alloc] initWithFrame:cell.frame];
    background.backgroundColor = [UIColor colorWithRed:0.25 green:0.61 blue:0.82 alpha:1];
    
    cell.selectedBackgroundView = background;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 147;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PropertyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"propertyCell" forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}


#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"pickedProperty"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSManagedObject *object = [[self fetchedResultsController] objectAtIndexPath:indexPath];
        PropertyDetailViewController *controller = (PropertyDetailViewController *)[segue destinationViewController];
        [controller setDetailItem:object];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/






- (void)seedData {
    
    NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
    
    NSArray *json = @[
                      @{
                          @"name":                       @"Edgewater Resort",
                          @"location":                   @"Door County, Wisconsin",
                          
                          //event types
                          @"meetings":                   @NO,
                          @"catering":                   @NO,
                          @"room_block":                 @YES,
                          
                          //group types
                          @"corporate_association":      @YES,
                          @"social_leisure":             @YES,
                          @"weddings":                   @YES,
                          
                          @"rooms":                      @32,
                          @"meeting_sqft":               @0,
                          
                          @"food":                       @"The Old Post Office Restaurant",
                          
                          @"max_corporate_association":  @0,
                          @"max_social_leisure":         @0,
                          @"max_wedding":                @0,
                          
                          @"website":                    @"edge-waterresort.com",
                          @"body":                       @"<h3>Increased revenue 40% through revenue management and GDS connectivity</h3>"
                          "<p>The Edgewater Resort dates back to the early 1900s as a center for community life in the tiny fishing village of Ephraim, Wisconsin. Today it continues its prominence as one of Door County’s premier historic waterfront properties. The resort completed a major renovation in the 1990s with the 32-room property made up of unique “Eagle Harbor View” one & two-bedroom suites, cottages and traditional guest rooms.</p>"
                          "<p>The resort is open year-round in this seasonal market and offers dining at the Old Post Office restaurant, its name a reflection upon its previous community role. IDM provides management services to both the hotel operation and condominium association of the resort. Our leadership increased revenues 40% though strategic internet exposure and aggressive revenue management.</p>",
                          
                          
                          },
                      @{
                          @"name":                       @"Hotel Julien Dubuque",
                          @"location":                   @"Dubuque, Iowa",
                          
                          //event types
                          @"meetings":                   @YES,
                          @"catering":                   @YES,
                          @"room_block":                 @YES,
                          
                          //group types
                          @"corporate_association":      @YES,
                          @"social_leisure":             @YES,
                          @"weddings":                   @YES,
                          
                          @"rooms":                      @133,
                          @"meeting_sqft":               @15000,
                          
                          @"food":                       @"Caroline's Restaurant and The Riverboat Lounge",
                          
                          @"max_corporate_association":  @425,
                          @"max_social_leisure":         @425,
                          @"max_wedding":                @300,
                          
                          @"website":                    @"hoteljuliendubuque.com",
                          @"body":                       @"<h3>A landmark that brought new life to Dubuque’s historic district</h3>"
                          "<p>With its key position on the Mississippi’s “Great River Road,” Dubuque, Iowa, features an expansive historic downtown district. At the district’s center stood the timeworn Hotel Julien Dubuque. With more than 100 years of now faded eminence, an enlightened ownership group reached out to IDM to serve as the Development Consultant to bring the historic property back to life and to relevance for today’s business traveler and leisure guest.</p>"
                          "<p>A renovation and restoration effort totaling more than $33M was undertaken. IDM managed the development team and repositioned the hotel in the marketplace. Reopened in September 2009, Hotel Julien Dubuque is now a full-service, 133-room hotel offering more than 15,000 square feet of meeting and banquet space, Caroline’s Restaurant, The Riverboat Lounge and Potosa Spa.</p>"
                          "<p>Moreover, the hotel has served as a springboard to continued re-development in downtown Dubuque. Today, the hotel is positioned at the highest level of service and accommodations in the Tri-State area and outperforms its competition in daily rate, revenue and revenue per available room. IDM continues to provide ongoing Hotel Management Services for Hotel Julien Dubuque.</p>",
                          
                          
                          },
                      @{
                          @"name":                       @"Hotel Marshfield",
                          @"location":                   @"Marshfield, Wisconsin",
                          
                          //event types
                          @"meetings":                   @YES,
                          @"catering":                   @YES,
                          @"room_block":                 @YES,
                          
                          //group types
                          @"corporate_association":      @YES,
                          @"social_leisure":             @YES,
                          @"weddings":                   @YES,
                          
                          @"rooms":                      @99,
                          @"meeting_sqft":               @8250,
                          
                          @"food":                       @"Libby McNeill's",
                          
                          @"max_corporate_association":  @325,
                          @"max_social_leisure":         @325,
                          @"max_wedding":                @300,
                          
                          @"website":                    @"hotelmarshfield.com",
                          @"body":                       @"<h3>A true comeback story – Marshfield hotel returns as stylish Midwest boutique</h3>"
                          "<p>When the exhausted Clearwaters Hotel in Marshfield ultimately closed, a community-minded local investor stepped up to purchase the distressed property at Sherriff’s sale. The owner says he immediately had buyer’s remorse, realizing that his company had no real experience in hotels or hotel re-development. They turned to IDM. Based on our analysis that the market was ripe for an independent boutique hotel, IDM convinced ownership to make a major investment – paving the way for a complete hotel transformation of which the community is now extremely proud.</p>"
                          "<p>The hotel, a vintage 1969 Holiday Inn, had been the largest conference center in Central Wisconsin. IDM managed the redevelopment, provided technical Development Consulting, and created the concept for a new brand. Working with the architect, general contractor, interior designer and a marketing firm, IDM delivered Hotel Marshfield. The massive renovation took the building down to the studs and reconfigured the meeting, dining and recreation spaces.</p>"
                          "<p>The transition has been amazing, resulting in 99 fresh and modern guest rooms, including extended-stay suites. Hotel Marshfield employs 100 full and part-time employees and is the choice in market for corporate and association meetings, weddings and events, as well as a much-needed full-service hotel experience for Marshfield Clinic physicians and visiting families. IDM continues to provide Management Services to Hotel Marshfield.</p>",
                          
                          
                          },
                      
                      @{
                          @"name":                       @"Jefferson Street Inn",
                          @"location":                   @"Wausau, Wisconsin",
                          
                          //event types
                          @"meetings":                   @YES,
                          @"catering":                   @YES,
                          @"room_block":                 @YES,
                          
                          //group types
                          @"corporate_association":      @YES,
                          @"social_leisure":             @YES,
                          @"weddings":                   @YES,
                          
                          @"rooms":                      @100,
                          @"meeting_sqft":               @15000,
                          
                          @"food":                       @"City Grill Bistro",
                          
                          @"max_corporate_association":  @700,
                          @"max_social_leisure":         @700,
                          @"max_wedding":                @495,
                          
                          @"website":                    @"jeffersonstreetinn.com",
                          @"body":                       @"<h3>Breathing new life into Wausau’s historic river district </h3>"
                          "<p>Focused on what downtown revitalization could do for its economy, the City of Wausau offered TIF incentives to develop a City Center Conference Hotel. The municipality turned to IDM in 2005 to help lead the effort. Our team developed a business-class community partnership condominium hotel to finance the development of Jefferson Street Inn. This highly successful boutique hotel is owned by local businesses and individual investors, reinforcing community support and long-term success. IDM provided extensive Development Consulting services and remains the Management Company hired by the hotel condominium association.</p>"
                          "<p>In 2008, only three years after opening, the hotel was expanded to 100 guestrooms and suites offering more than 15,000 square feet of meeting and banquet facilities and is a unique model for public-private partnerships in creative hotel financing and economic development. The project remains an example of successful public-private partnerships in downtown hotel development and urban renewal.</p>"
                          "<p>To provide the necessary food & beverage experience at Jefferson Street Inn, City Grill is an upscale, casual contemporary dining spot for daily lunch and dinner. City Grill also offers eight meeting and banquet rooms accommodating groups of up to 450 persons. IDM created the identity, branding and menus for the freestanding independent restaurant. Guests of the Jefferson Street Inn who utilize City Grill and the banquet facilities feel a full service hotel experience.</p>",
                          
                          
                          },
                      @{
                          @"name":                       @"The Plaza Hotel & Café",
                          @"location":                   @"Milwaukee, Wisconsin",
                          
                          //event types
                          @"meetings":                   @YES,
                          @"catering":                   @NO,
                          @"room_block":                 @YES,
                          
                          //group types
                          @"corporate_association":      @YES,
                          @"social_leisure":             @YES,
                          @"weddings":                   @NO,
                          
                          @"rooms":                      @82,
                          @"meeting_sqft":               @0,
                          
                          @"food":                       @"Café at The Plaza",
                          
                          @"max_corporate_association":  @20,
                          @"max_social_leisure":         @20,
                          @"max_wedding":                @0,
                          
                          @"website":                    @"plazahotelmilwaukee.com",
                          @"body":                       @"<h3>A revitalization of an iconic Milwaukee landmark</h3>"
                          "<p>Downtown Milwaukee’s only boutique, historic and extended stay hotel truly needed an infusion of energy. IDM provided a guiding hand in re-positioning this venerable asset to make it a more compelling choice for young travelers and business people. IDM was hired by the owners to revitalize The Plaza Hotel, a fixture on the city’s eclectic lower east side.</p>"
                          "<p>To improve efficiencies and increase revenue, IDM brought new technology to the hotel including property and restaurant management softwares and a renewed online presence. Revitalization continues with a faithful renewal of public spaces and guest rooms, all driven by a team of likeminded professionals.</p>"
                          "<p>By offering a fresh perspective on staffing, amenities and marketing, IDM is in the midst of revamping this Art Deco hotel. The Plaza demonstrates IDM’s philosophy that historic significance and modern relevance can be a powerful combination in urban hotel repositioning.</p>",
                          
                          
                          },
                      @{
                          @"name":                       @"Cranberry Country Lodge",
                          @"location":                   @"Tomah, Wisconsin",
                          
                          //event types
                          @"meetings":                   @YES,
                          @"catering":                   @YES,
                          @"room_block":                 @YES,
                          
                          //group types
                          @"corporate_association":      @YES,
                          @"social_leisure":             @YES,
                          @"weddings":                   @YES,
                          
                          @"rooms":                      @93,
                          @"meeting_sqft":               @10000,
                          
                          @"food":                       @"Cran-Beary Pub",
                          
                          @"max_corporate_association":  @300,
                          @"max_social_leisure":         @300,
                          @"max_wedding":                @200,
                          
                          @"website":                    @"cranberrycountrylodge.com",
                          @"body":                       @"<h3>Struggling Northwoods hotel gets assistance to succeed</h3>"
                          "<p>After falling on hard times, the Cranberry Country Lodge went into receivership in early 2014. IDM was contacted to help and was hired as the Asset Manager – we immediately got to work.</p>"
                          "<p>Cranberry Country Lodge is located in Tomah, Wisconsin. The 93 room hotel and conference center offers an aquatic center (free to guests), comfy lounge, expansive meeting space and an inviting Northwoods atmosphere.</p>"
                          "<p>As the Asset Manager, IDM hired all current employees and quickly brought the team up-to-speed so operations could continue as soon as possible. We installed a new property management system, took over the bookkeeping services and updated the website.</p>"
                          "We are currently in the process of stabilizing the business and are marketing the property for sale. Please contact us should you be interested.",
                          
                          
                          },
                      @{
                          @"name":                       @"Ramada Janesville",
                          @"location":                   @"Janesville, Wisconsin",
                          
                          //event types
                          @"meetings":                   @YES,
                          @"catering":                   @YES,
                          @"room_block":                 @YES,
                          
                          //group types
                          @"corporate_association":      @YES,
                          @"social_leisure":             @YES,
                          @"weddings":                   @YES,
                          
                          @"rooms":                      @101,
                          @"meeting_sqft":               @8000,
                          
                          @"food":                       @"Starter's Restaurant",
                          
                          @"max_corporate_association":  @300,
                          @"max_social_leisure":         @300,
                          @"max_wedding":                @250,
                          
                          @"website":                    @"ramada.com",
                          @"body":                       @"<h3>A rock bottom property is now seeing better days</h3>"
                          "<p>IDM’s track record of turning around bank-owned assets has resulted in repeat business from many receivers. Such was the case with a 102-room property in Janesville, Wisconsin. Once a popular hotel bar and meeting place, the Best Western Midway Motor Lodge and Left Guard Restaurant had experienced three receiverships and multiple owners who did not reinvest in the property and eventually lost the brand flag. Therefore the current bank turned to IDM to refresh the property. IDM implemented a plan that included staffing, training and overall management.</p>"
                          "<p>Overseeing extensive capital improvements, IDM managed the renovations and rebranding and now operates the property and F&B operation as the Ramada Janesville. The bank expects to hold the property for up to five years.</p>",
                          
                          
                          },
                      ];
    
    
    
    
    for (NSDictionary *property in json){
        
        Event *event = (Event*)[NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:context];
        
        event.created_at = [NSDate date];
        event.name = [property objectForKey:@"name"];
        event.location = [property objectForKey:@"location"];
        
        //event types
        event.meetings = [property objectForKey:@"meetings"];
        event.catering = [property objectForKey:@"catering"];
        event.room_block = [property objectForKey:@"room_block"];
        
        //group types
        event.corporate_association = [property objectForKey:@"corporate_association"];
        event.social_leisure = [property objectForKey:@"social_leisure"];
        event.weddings = [property objectForKey:@"weddings"];
        
        event.rooms = [property objectForKey:@"rooms"];
        event.meeting_sqft = [property objectForKey:@"meeting_sqft"];
        
        event.food = [property objectForKey:@"food"];
        
        event.max_corporate_association = [property objectForKey:@"max_corporate_association"];
        event.max_social_leisure = [property objectForKey:@"max_social_leisure"];
        event.max_wedding = [property objectForKey:@"max_wedding"];
        
        
        event.website = [property objectForKey:@"website"];
        event.body = [property objectForKey:@"body"];
        
        
        
    }
    
    // Save the context.
    NSError *error = nil;
    if (![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
}







#pragma mark - Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *sortDescriptors = @[sortDescriptor];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"Master"];
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;
    
    NSError *error = nil;
    if (![self.fetchedResultsController performFetch:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _fetchedResultsController;
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        default:
            return;
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    UITableView *tableView = self.tableView;
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self configureCell:(PropertyTableViewCell *)[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}

/*
 // Implementing the above methods to update the table view in response to individual changes may have performance implications if a large number of changes are made simultaneously. If this proves to be an issue, you can instead just implement controllerDidChangeContent: which notifies the delegate that all section and object changes have been processed.
 
 - (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
 {
 // In the simplest, most efficient, case, reload the table view.
 [self.tableView reloadData];
 }
 */




@end
