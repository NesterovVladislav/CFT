//
//  ViewController.m
//  HomeWork1
//
//  Created by Родион Баглай on 02.03.17.
//  Copyright © 2017 Родион Баглай. All rights reserved.
//

#import "ViewController.h"
//#import "ArrayEncapsulates.h"

@interface ViewController ()

@property (nonatomic,strong)ArrayEncapsulates *arrayEncapsulates;
@property (nonatomic,copy) NSArray* arrayTemp;

@end

@implementation ViewController
{
    NSUInteger countItems ;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrayTemp = [[NSArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11", nil];
    
    self.arrayEncapsulates = [[ArrayEncapsulates alloc] initWithDataProvider:^NSArray *{
    
        return self.arrayTemp;
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void) showTextAllertController:(NSString*) messageTextAllert andTitleTextAllert:(NSString*) titleTextAllert
{
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:titleTextAllert
                                                                   message:messageTextAllert
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];

    
}


- (IBAction)actionPopulate:(UIButton *)sender {
    
        self.arrayTemp = [self.arrayEncapsulates populate];
    
        NSMutableString* mStr = [[NSMutableString alloc] init];
    
        for (NSString* tempElementArr in self.arrayTemp)
        {
            [mStr appendFormat:@"%@ ",tempElementArr];
        }
    
    [self showTextAllertController:mStr
                andTitleTextAllert:@"Populate"];

    
    
  
}



- (IBAction)actionEnumerate:(UIButton *)sender {
   
    countItems = 0;
    
   NSUInteger __block *countItemsPointer = &countItems;
   ViewController __weak *weakSelf = self;
    
    self.arrayEncapsulates.enumerationCompleteHandler = ^{
     
        NSString* stringText = [NSString stringWithFormat:@"Количество перебранных элементов = %ld", (long)*countItemsPointer];
        [weakSelf showTextAllertController:stringText
                        andTitleTextAllert:@"Enumarate"];
        };
  
    [self.arrayEncapsulates enumerateItems:^(id object, NSUInteger index) {
        countItems++;
    }];

    
}


- (IBAction)actionItemAtIndex:(UIButton*)sender {
    
    [self.arrayEncapsulates asyncItemAtIndex:3 andBlock:^(NSString *string) {
        [self showTextAllertController:string
                    andTitleTextAllert:@"Item at index"];
    }];
    
}
  


@end
