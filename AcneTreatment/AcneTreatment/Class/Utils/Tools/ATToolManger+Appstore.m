//
//  ATToolManger+Appstore.m
//  AcneTreatment
//
//  Created by FaceBooks on 2018/8/18.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ATToolManger+Appstore.h"

@implementation ATToolManger (Appstore)

- (void)openAppStoreWithAppleID:(NSString *)appleID withType:(JumpStoreType)jumpStoreType {
    switch (jumpStoreType) {
        case JumpStoreTypeInAppStore:{
            NSString* urlStr =[NSString stringWithFormat:@"https://itunes.apple.com/app/id%@",appleID];
            [self applicationOpenURL:[NSURL URLWithString:urlStr]];
        }
            break;
        case JumpStoreTypeInApp:{
            if (@available(iOS 10.3, *)) {
                SKStoreProductViewController *storeProductVC = [[SKStoreProductViewController alloc] init];
                storeProductVC.delegate = self;
                [storeProductVC loadProductWithParameters:[NSDictionary dictionaryWithObjectsAndKeys:appleID,SKStoreProductParameterITunesItemIdentifier, nil] completionBlock:^(BOOL result, NSError * _Nullable error) {
                    if (result) {
                        [[[[UIApplication sharedApplication] keyWindow] rootViewController] presentViewController:storeProductVC animated:YES completion:nil];
                    } else {
                        NSLog(@"%@",error);
                    }
                }];
            } else {
                NSLog(@"Less than 10.3 version does not support opening the Appstore preview page within app");
            }
        }
            break;
        case JumpStoreTypeAuto:{
            if (@available(iOS 10.3, *)) {
                SKStoreProductViewController *storeProductVC = [[SKStoreProductViewController alloc] init];
                storeProductVC.delegate = self;
                [storeProductVC loadProductWithParameters:[NSDictionary dictionaryWithObjectsAndKeys:appleID,SKStoreProductParameterITunesItemIdentifier, nil] completionBlock:^(BOOL result, NSError * _Nullable error) {
                    if (result) {
                        [[[[UIApplication sharedApplication] keyWindow] rootViewController] presentViewController:storeProductVC animated:YES completion:nil];
                    } else {
                        NSLog(@"%@",error);
                    }
                }];
            } else {
                NSString* urlStr =[NSString stringWithFormat:@"https://itunes.apple.com/app/id%@",appleID];
                [self applicationOpenURL:[NSURL URLWithString:urlStr]];
            }
        }
            break;
    }
}

- (void)giveScoreWithAppleID:(NSString *)appleID withType:(ScoreType)scoreType {
    switch (scoreType) {
        case ScoreTypeInAppStore:{
            NSString* urlStr =[NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/viewContentsUserReviews?id=%@",appleID];
            [self applicationOpenURL:[NSURL URLWithString:urlStr]];
        }
            break;
        case ScoreTypeInApp:{
            if (@available(iOS 10.3, *)) {
                [SKStoreReviewController requestReview];
            } else {
                NSLog(@"Less than 10.3 version does not support the app open score");
            }
        }
            break;
        case ScoreTypeAuto:{
            if (@available(iOS 10.3, *)) {
                [SKStoreReviewController requestReview];
            } else {
                NSString* urlStr =[NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@",appleID];
                [self applicationOpenURL:[NSURL URLWithString:urlStr]];
            }
        }
            break;
    }
}

- (void)giveScoreAutoTypeWithAppleID:(NSString *)appleID withHasRequestTime:(NSUInteger)hasRequestTime withTotalTimeLimit:(NSUInteger)totalTimeLimit {
    if (@available(iOS 10.3, *)) {
        if (hasRequestTime < totalTimeLimit && hasRequestTime < 3) {
            [SKStoreReviewController requestReview];
        } else {
            [self giveScoreWithAppleID:appleID withType:ScoreTypeInAppStore];
        }
    } else {
        [self giveScoreWithAppleID:appleID withType:ScoreTypeInAppStore];
    }
}

#pragma mark OpenURL
- (void)applicationOpenURL:(NSURL *)url {
    if (@available(iOS 10.0, *)) {
        [[UIApplication sharedApplication] openURL:url options:[NSDictionary dictionary] completionHandler:nil];
    } else {
        [[UIApplication sharedApplication] openURL:url];
    }
}

#pragma mark - SKStoreProductViewControllerDelegate
- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController{
    [viewController dismissViewControllerAnimated:YES completion:nil];
}

@end
