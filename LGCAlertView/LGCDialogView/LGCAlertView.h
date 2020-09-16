//
//  LGCAlertView.h
//  pickcolor
//
//  Created by apple on 2020/9/15.
//  Copyright © 2020 apple. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LGCAlertView : UIViewController

+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle okTitle:(NSString *)okTitle parentVC:(UIViewController*)parentVC completion:(void(^)(BOOL confirmed))completion;

@end


