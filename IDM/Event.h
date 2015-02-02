//
//  Event.h
//  IDM
//
//  Created by Joel Glovacki on 10/14/14.
//  Copyright (c) 2014 Company B. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Event : NSManagedObject

@property (nonatomic, retain) NSString * header_image;
@property (nonatomic, retain) NSString * list_view_background;
@property (nonatomic, retain) NSString * body;
@property (nonatomic, retain) NSNumber * catering;
@property (nonatomic, retain) NSNumber * corporate_association;
@property (nonatomic, retain) NSDate * created_at;
@property (nonatomic, retain) NSString * food;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSNumber * max_corporate_association;
@property (nonatomic, retain) NSNumber * max_social_leisure;
@property (nonatomic, retain) NSNumber * max_wedding;
@property (nonatomic, retain) NSNumber * meeting_sqft;
@property (nonatomic, retain) NSNumber * meetings;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * room_block;
@property (nonatomic, retain) NSNumber * rooms;
@property (nonatomic, retain) NSNumber * social_leisure;
@property (nonatomic, retain) NSString * website;
@property (nonatomic, retain) NSNumber * weddings;

@end
