//
//  ViewController.m
//  TestTest
//
//  Created by Alexander on 31.10.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "ViewController.h"

int sum2(int a, int b) {
    return a + b;
}

@interface ViewController ()
@end

@implementation ViewController
@synthesize n1 = n1, n2 = _n2;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    id obj = [NSObject new];//[NSString stringWithFormat:@"{%@}", @"dsf"];
    __weak id obj2 = obj;
    NSLog(@"%@", obj2);
    obj = nil;
    NSLog(@"%@", obj2);
    
    id(^incBlock)(id) = ^NSNumber*(NSNumber *numb) {
        NSInteger k = [numb integerValue];
        return @(k + 1);
    };
    incBlock = [incBlock copy];
    id(^toOBlock)(id) = ^NSString*(NSNumber *numb) {
        NSMutableString *str = [NSMutableString new];
        for (int k = 0; k < numb.intValue; k++) {
            [str appendString:@"O"];
        }
        return str;
    };
    NSArray *modificators = @[incBlock, toOBlock];
    
    NSArray *objects = @[@1, @2, @3];
    NSMutableArray *result = [NSMutableArray new];
    [objects enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
    {
        id mappedObj = obj;
        for (id(^block)() in modificators) {
            mappedObj = block(mappedObj);
        }
        [result addObject:mappedObj];
    }];
    NSLog(@"%@", result);
}

@end
