//
//  HHRedView.h
//  RACNetwork
//
//  Created by vanke on 2019/10/17.
//  Copyright © 2019 com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveObjC.h>
NS_ASSUME_NONNULL_BEGIN

@interface HHRedView : UIView

@property (nonatomic, strong) RACSubject *btnClickSignal;

- (IBAction)btnClick:(id)sender;

@end

NS_ASSUME_NONNULL_END
