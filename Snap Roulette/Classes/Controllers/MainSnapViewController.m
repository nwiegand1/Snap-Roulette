//
//  MainSnapViewController.m
//  Snap Roulette
//
//  Created by Jason Fieldman on 2/24/15.
//  Copyright (c) 2015 Jason Fieldman. All rights reserved.
//

#import "MainSnapViewController.h"
#import "SnapListViewController.h"

@interface MainSnapViewController ()

@end

@implementation MainSnapViewController

+ (MainSnapViewController*) sharedInstance {
    __strong static MainSnapViewController *singleton = nil;
    @synchronized(self) {
        if (singleton == nil) singleton = [[MainSnapViewController alloc] init];
    }
    return singleton;
}

- (id) init {
    if ((self = [super init])) {
        self.view.backgroundColor = [UIColor orangeColor];
        
        self.title = @"Snap Roulette";
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Snaps" style:UIBarButtonItemStyleDone target:self action:@selector(handleSnapList:)];
        
        _takePhotoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _takePhotoButton.frame = CGRectMake(self.view.frame.size.width/2 - 20, self.view.frame.size.height - 60, 40, 40);
        _takePhotoButton.backgroundColor = [UIColor blueColor];
        [self.view addSubview:_takePhotoButton];
    }
    return self;
}

- (void) handleSnapList:(id)sender {
    SnapListViewController *controller = [[SnapListViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

@end