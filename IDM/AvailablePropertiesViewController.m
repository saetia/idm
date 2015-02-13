//
//  AvailablePropertiesViewController.m
//  IDM
//
//  Created by Joel Glovacki on 10/24/14.
//  Copyright (c) 2014 Company B. All rights reserved.
//

#import "AvailablePropertiesViewController.h"
#import "PropertyTableViewCell.h"
#import "PropertyDetailViewController.h"
#import "Event.h"
#import "AppDelegate.h"
#import "AFNetworking/AFHTTPRequestOperationManager.h"
@interface AvailablePropertiesViewController ()

@end

@implementation AvailablePropertiesViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title=@" ";
    
    self.selectedProperties = [[NSMutableArray alloc] init];

    id delegate = [[UIApplication sharedApplication] delegate];
    self.managedObjectContext = [delegate managedObjectContext];

    //id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][0];
    //AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    //if (![sectionInfo numberOfObjects] && !appDelegate.didFetchResults) [self seedData];
    //[NSFetchedResultsController deleteCacheWithName:@"Master"];
    self.fetchedResultsController = nil;

}

- (void)viewDidAppear:(BOOL)animated {
    [NSFetchedResultsController deleteCacheWithName:@"Master"];
    [super viewDidAppear:animated];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    if ([[self.tableView indexPathsForSelectedRows] containsObject:indexPath]){
        [cell.checkmark setAlpha:1];
    } else {
        [cell.checkmark setAlpha:0];
    }
    
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
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        NSManagedObject *object = [[self fetchedResultsController] objectAtIndexPath:indexPath];
        PropertyDetailViewController *controller = (PropertyDetailViewController *)[segue destinationViewController];
        [controller setDetailItem:object];
        [controller setShouldPreventRFP:YES];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
    if ([[segue identifier] isEqualToString:@"requestForProposal"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSArray *indexPaths = [self.tableView indexPathsForSelectedRows];
        NSManagedObject *object = [[self fetchedResultsController] objectAtIndexPath:indexPath];
        PropertyDetailViewController *controller = (PropertyDetailViewController *)[segue destinationViewController];
        [controller setDetailItem:object];
    }
}


-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    PropertyTableViewCell *cell = (PropertyTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    [cell.checkmark setAlpha:0];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PropertyTableViewCell *cell = (PropertyTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    [cell.checkmark setAlpha:1];
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

    
    
    
    
    
    //NSPredicate *predicate = [NSPredicate predicateWithFormat:@"weddings contains[c] %@", @NO];
    //NSPredicate *predicate = [NSPredicate predicateWithFormat:@"weddings == NO"];
    //NSPredicate *predicate = [NSPredicate predicateWithFormat:@"weddings == 0"];
    
    //NSPredicate *predicate = [NSPredicate predicateWithFormat:@"weddings == 0"];
    //NSPredicate *predicate2 = [NSPredicate predicateWithFormat:@"name contains[c] 'Plaza'"];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSMutableArray *predicates = [[NSMutableArray alloc] init];
    
    NSArray *count = @[@10,@41,@101,@201,@300];
    
    //PARTY NEEDS
    if (appDelegate.IDMPartyNeeds == IDMPartyNeedsOnlyCatering){
        [predicates addObject:[NSPredicate predicateWithFormat:@"catering == 1"]];
    }
    if (appDelegate.IDMPartyNeeds == IDMPartyNeedsOnlyRooms){
        [predicates addObject:[NSPredicate predicateWithFormat:@"room_block == 1"]];
        [predicates addObject:[NSPredicate predicateWithFormat:@"rooms >= %d", [count[appDelegate.IDMPartySize] integerValue]]];
    }
    if (appDelegate.IDMPartyNeeds == IDMPartyNeedsRoomsAndCatering){
        [predicates addObject:[NSPredicate predicateWithFormat:@"catering == 1"]];
        [predicates addObject:[NSPredicate predicateWithFormat:@"room_block == 1"]];
        [predicates addObject:[NSPredicate predicateWithFormat:@"rooms >= %d", [count[appDelegate.IDMPartySize] integerValue]]];
    }
    
    //PARTY TYPE
    if (appDelegate.IDMPartyType == IDMPartyTypeCorporate){
        [predicates addObject:[NSPredicate predicateWithFormat:@"corporate_association == 1"]];
        [predicates addObject:[NSPredicate predicateWithFormat:@"max_corporate_association >= %d", [count[appDelegate.IDMPartySize] integerValue]]];
    }
    
    if (appDelegate.IDMPartyType == IDMPartyTypeSocial){
        [predicates addObject:[NSPredicate predicateWithFormat:@"social_leisure == 1"]];
        [predicates addObject:[NSPredicate predicateWithFormat:@"max_social_leisure >= %d", [count[appDelegate.IDMPartySize] integerValue]]];
    }
    
    if (appDelegate.IDMPartyType == IDMPartyTypeWedding){
        [predicates addObject:[NSPredicate predicateWithFormat:@"weddings == 1"]];
        [predicates addObject:[NSPredicate predicateWithFormat:@"max_wedding >= %d", [count[appDelegate.IDMPartySize] integerValue]]];
    }
    
    NSPredicate *compoundPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:predicates];
    
    NSLog(@"%@",compoundPredicate);
    
    [fetchRequest setPredicate:compoundPredicate];

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
