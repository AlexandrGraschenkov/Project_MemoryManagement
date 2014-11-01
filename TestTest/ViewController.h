//
//  ViewController.h
//  TestTest
//
//  Created by Alexander on 31.10.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (atomic, strong) NSNumber *n1; // weak, copy
@property (nonatomic, weak) NSObject *n2;
@property (nonatomic, assign) int k;

@end

