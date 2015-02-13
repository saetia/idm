//
//  AppDelegate.m
//  IDM
//
//  Created by Joel Glovacki on 10/14/14.
//  Copyright (c) 2014 Company B. All rights reserved.
//

#import "AppDelegate.h"
#import "Event.h"
#import "AFNetworking/AFHTTPRequestOperationManager.h"
#import "Underscore.h"
#define _ Underscore

@interface AppDelegate () <UISplitViewControllerDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self seedData];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [self saveContext];
}


@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"IDM" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"IDM.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    if (_managedObjectContext != nil) return _managedObjectContext;

    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) return nil;
    
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

- (void)deleteAllEntities:(NSString *)nameEntity
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:nameEntity];
    [fetchRequest setIncludesPropertyValues:NO]; //only fetch the managedObjectID
    
    NSError *error;
    NSArray *fetchedObjects = [[self managedObjectContext] executeFetchRequest:fetchRequest error:&error];
    for (NSManagedObject *object in fetchedObjects){
        [[self managedObjectContext] deleteObject:object];
    }
    
    error = nil;
    [[self managedObjectContext] save:&error];
}



- (void)seedData {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *fingerprint = [defaults objectForKey:@"fingerprint"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:@"http://idmhospitality.com/wp-content/themes/idm/api/index.php" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"checking fingerprints: %@ vs %@", fingerprint, responseObject[@"fingerprint"]);
        
        if ([fingerprint isEqualToString:responseObject[@"fingerprint"]]) return;

        [self deleteAllEntities:@"Event"];
        
        NSLog(@"Seeding Data: %@", responseObject);
        
        for (NSDictionary *property in responseObject[@"results"]){
            
            Event *event = (Event *)[NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:[self managedObjectContext]];
            
            event.created_at = [NSDate date];
            event.name = [property objectForKey:@"name"];
            event.location = [property objectForKey:@"location"];
            //event.header_image = [property objectForKey:@"header_image"];
            event.list_view_background = [property objectForKey:@"list_view_background"];

            //event types
            event.meetings = [NSNumber numberWithBool: Underscore.any(property[@"event_possibilities"], ^BOOL (NSString *eventPossibility) {
                return [eventPossibility isEqualToString:@"meetings"];
            })];
            event.catering = [NSNumber numberWithBool: Underscore.any(property[@"event_possibilities"], ^BOOL (NSString *eventPossibility) {
                return [eventPossibility isEqualToString:@"catering"];
            })];
            event.room_block = [NSNumber numberWithBool: Underscore.any(property[@"event_possibilities"], ^BOOL (NSString *eventPossibility) {
                return [eventPossibility isEqualToString:@"room_block"];
            })];
            
            //group types
            event.corporate_association = [NSNumber numberWithBool: Underscore.any(property[@"groups_accepted"], ^BOOL (NSString *eventPossibility) {
                return [eventPossibility isEqualToString:@"corporate_association"];
            })];
            event.social_leisure = [NSNumber numberWithBool: Underscore.any(property[@"groups_accepted"], ^BOOL (NSString *eventPossibility) {
                return [eventPossibility isEqualToString:@"social_leisure"];
            })];
            event.weddings = [NSNumber numberWithBool: Underscore.any(property[@"groups_accepted"], ^BOOL (NSString *eventPossibility) {
                return [eventPossibility isEqualToString:@"weddings"];
            })];
            
            NSDictionary *overview_content = _.find(property[@"sections"], ^BOOL (NSDictionary *obj) {
                return [obj[@"title"] isEqualToString:@"Overview"];
            });
            NSDictionary *catering_content = _.find(property[@"sections"], ^BOOL (NSDictionary *obj) {
                return [obj[@"title"] isEqualToString:@"Catering"];
            });
            NSDictionary *rooms_content = _.find(property[@"sections"], ^BOOL (NSDictionary *obj) {
                return [obj[@"title"] isEqualToString:@"Rooms"];
            });
            NSDictionary *meetings_events_content = _.find(property[@"sections"], ^BOOL (NSDictionary *obj) {
                return [obj[@"title"] isEqualToString:@"Meetings & Events"];
            });

            event.catering_content = catering_content[@"details"];
            event.meetings_events_content = meetings_events_content[@"details"];
            event.rooms_content = rooms_content[@"details"];
            event.overview_content = overview_content[@"details"];
            event.rooms = @([[property objectForKey:@"number_of_rooms"] intValue]);
            event.meeting_sqft = @([[property objectForKey:@"meeting_square_footage"] intValue]);
            event.food = [property objectForKey:@"restaurant"];
            event.max_corporate_association = @([[property objectForKey:@"max_corporate_association"] intValue]);
            event.max_social_leisure = @([[property objectForKey:@"max_social_leisure"] intValue]);
            event.max_wedding = @([[property objectForKey:@"max_wedding"] intValue]);
            
            //event.website = [property objectForKey:@"website"];
            event.body = [property objectForKey:@"html"];
            
        }
        
        NSError *error = nil;
        if (![[self managedObjectContext] save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
        
        [defaults setObject:responseObject[@"fingerprint"] forKey:@"fingerprint"];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}


@end
