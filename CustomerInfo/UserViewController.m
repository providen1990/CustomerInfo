//
//  UserViewController.m
//  CustomerInfo
//
//  Created by Ryan Huynh on 6/7/16.
//  Copyright © 2016 Info Way. All rights reserved.
//

#import "UserViewController.h"


#define kUuidBeacon @"5F22CA05-8F6C-49B6-AEAE-B278FDFE9287"


@interface UserViewController ()

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.beaconToDetect =  [[AltBeacon alloc ]initWithIdentifier:kUuidBeacon];
    [self.beaconToDetect addDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)startScanning:(id)sender {
    // might not need to broadcasting since we only need to detect the beacon
    //[self.beaconToDetect startBroadcasting];
    [self.beaconToDetect startDetecting];
}

- (IBAction)stopScanning:(id)sender {
    //[self.beaconToDetect stopBroadcasting];
    [self.beaconToDetect stopDetecting];
}

- (NSString*) convertToString:(NSNumber *)number {
    NSString *result = nil;
    
    switch(number.intValue) {
        case INDetectorRangeFar:
            result = @"Up to 100 meters";
            break;
        case INDetectorRangeNear:
            result = @"Up to 15 meters";
            break;
        case INDetectorRangeImmediate:
            result = @"Up to 5 meters";
            break;
            
        default:
            result = @"Unknown";
    }
    
    return result;
}

// Delegate methods
- (void)service:(AltBeacon *)service foundDevices:(NSMutableDictionary *)devices {
    
    for(NSString *key in devices) {
        NSNumber * range = [devices objectForKey:key];
        if (range.intValue == INDetectorRangeUnknown){
            if ([key  isEqualToString:kUuidBeacon]){
                self.showInfo.text = @"";
            }
            
        }else{
            
            NSString *result = [self convertToString:range];
            NSString *beaconStr = @"";
            if ([key  isEqualToString:kUuidBeacon]){
                beaconStr = @"Beacon found!";
                self.showInfo.text = [NSString stringWithFormat:@"%@ %@ %@ %@", beaconStr, @"was found",result, @"meters away"];
            }
            
        }
    }
}


@end
