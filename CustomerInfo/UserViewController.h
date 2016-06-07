//
//  UserViewController.h
//  CustomerInfo
//
//  Created by Ryan Huynh on 6/7/16.
//  Copyright © 2016 Info Way. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBUUID+Ext.h"
#import "AltBeacon.h"

@interface UserViewController : UIViewController<AltBeaconDelegate>
@property (weak, nonatomic) IBOutlet UILabel *showInfo;
@property (strong, nonatomic) AltBeacon *beaconToDetect;
- (IBAction)startScanning:(id)sender;
- (IBAction)stopScanning:(id)sender;
@end
