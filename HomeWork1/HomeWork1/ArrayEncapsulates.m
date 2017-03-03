//
//  ArrayEncapsulates.m
//  HomeWork1
//
//  Created by Родион Баглай on 02.03.17.
//  Copyright © 2017 Родион Баглай. All rights reserved.
//

#import "ArrayEncapsulates.h"



@interface ArrayEncapsulates()

@property(nonatomic,copy) NSArray* array;
@property(copy)  NSArray* (^dataProvider)(void);

@end

@implementation ArrayEncapsulates



- (instancetype)initWithDataProvider:(NSArray *(^)(void))dataProvider
{
    self = [super init];
    if (self) {
        self.dataProvider = [dataProvider copy];
                        //copy];
    }
    return self;
}


-(NSArray*) populate
{
    self.array = self.dataProvider();
    
    return self.array;
}


-(void) enumerateItems:(void(^)(id object,NSUInteger index)) block
{
    
    [self.array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop){
        
        block(obj, idx);
        NSUInteger count = 0;
     
        count += [obj integerValue];
      
        
            if (count == [self.array count]){
            *stop = YES;
            self.enumerationCompleteHandler();
                
        }
    }];
    
}


-(void) asyncItemAtIndex:(NSUInteger) index andBlock: (void(^)(NSString* string)) block
{
    
   
    NSString* itemArray = [NSString stringWithFormat:@"Значение массива = %@", self.array[index]];
    NSInteger delay = arc4random()%3+1;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        block(itemArray);
    });
    
    
}

@end
