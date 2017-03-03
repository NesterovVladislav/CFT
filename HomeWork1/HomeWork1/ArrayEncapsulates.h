//
//  ArrayEncapsulates.h
//  HomeWork1
//
//  Created by Родион Баглай on 02.03.17.
//  Copyright © 2017 Родион Баглай. All rights reserved.
//

#import <Foundation/Foundation.h>

//typedef NSArray* (^DataProvider)();

@interface ArrayEncapsulates : NSObject



@property(copy) void (^enumerationCompleteHandler)(void);


//initiliazation
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithDataProvider:(NSArray *(^)(void))dataProvider;


//Methods

-(NSArray*) populate;
-(void) enumerateItems:(void(^)(id object,NSUInteger index)) block;
-(void) asyncItemAtIndex:(NSUInteger) index andBlock: (void(^)(NSString* string)) block;

@end
