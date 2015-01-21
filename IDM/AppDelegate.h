//
//  AppDelegate.h
//  IDM
//
//  Created by Joel Glovacki on 10/14/14.
//  Copyright (c) 2014 Company B. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

typedef NS_ENUM(NSInteger, IDMPartyNeeds) {
    IDMPartyNeedsOnlyRooms,
    IDMPartyNeedsOnlyCatering,
    IDMPartyNeedsRoomsAndCatering
};

typedef NS_ENUM(NSInteger, IDMPartySize) {
    IDMPartySizeTen,
    IDMPartySizeForty,
    IDMPartySizeOneHundred,
    IDMPartySizeTwoHundred,
    IDMPartySizeThreeHundred
};

typedef NS_ENUM(NSInteger, IDMPartyType) {
    IDMPartyTypeCorporate,
    IDMPartyTypeWedding,
    IDMPartyTypeSocial
};


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property int IDMPartyType;
@property int IDMPartySize;
@property int IDMPartyNeeds;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end

